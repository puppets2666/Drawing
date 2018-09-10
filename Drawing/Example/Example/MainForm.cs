using System;
using System.Drawing;
using System.Windows.Forms;
using Shapes.DataModel;
using System.Linq;

namespace Shapes
{
    public partial class MainForm : Form
    {
        private Rects rects = new Rects();
        private UndoRedoManager manager = new UndoRedoManager();

        public MainForm()
        {
            InitializeComponent();

            SetStyle(ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer | ControlStyles.UserPaint, true);

            rects.Changed += rects_Changed;
            manager.StateChanged += manager_StateChanged;

            BuildInterface();
        }
        
        void manager_StateChanged(object sender, EventArgs e)
        {
            BuildInterface();
        }

        void rects_Changed(object sender, EventArgs e)
        {
            Invalidate();
        }

        private void BuildInterface()
        {
            btRedo.Enabled = manager.CanRedo;
            btUndo.Enabled = manager.CanUndo;

            btRedo.DropDownItems.Clear();
            btRedo.DropDownItems.AddRange(manager.RedoItems.Select(c=>new ToolStripMenuItem(c)).ToArray());
            btUndo.DropDownItems.Clear();
            btUndo.DropDownItems.AddRange(manager.UndoItems.Select(c => new ToolStripMenuItem(c)).ToArray());

            cbColor.Enabled = rects.LastRect != null;
        }

        private void btNew_Click(object sender, EventArgs e)
        {
            // create and execute new command
            ICommand command = new AddRectCommand(rects, new Rect());

            manager.Execute(command);
        }

        private void cbColor_SelectedIndexChanged(object sender, EventArgs e)
        {
            // create and execute new command
            ICommand command = new ChangeColorCommand(rects, Color.FromName(cbColor.Text));

            manager.Execute(command);
        }

        private void btUndo_ButtonClick(object sender, EventArgs e)
        {
            manager.Undo();
        }

        private void btRedo_ButtonClick(object sender, EventArgs e)
        {
            manager.Redo();
        }

        #region Drawing

        protected override void OnPaint(PaintEventArgs e)
        {
            using (SolidBrush brush = new SolidBrush(Color.Black))
            {
                foreach (Rect rect in rects)
                {
                    brush.Color = rect.Color;
                    e.Graphics.FillRectangle(brush, new Rectangle(rect.Location, rect.Size));
                }

                if (draggedRect != null)
                {
                    ControlPaint.DrawFocusRectangle(e.Graphics, new Rectangle(newRectLocation, draggedRect.Size));
                }
            }
                
        }

        #endregion

        #region Moving

        private Rect draggedRect;
        private Point newRectLocation;
        private Point startMouseLocation;

        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                foreach (Rect rect in rects.Reverse())
                {
                    if (rect.HitTest(e.Location))
                    {
                        draggedRect = rect;
                        startMouseLocation = e.Location;
                        return;
                    }
                }


                draggedRect = null;
            }
        }

        protected override void OnMouseMove(MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left && draggedRect != null)
            {
                newRectLocation = new Point(draggedRect.Location.X + e.X - startMouseLocation.X, draggedRect.Location.Y + e.Y - startMouseLocation.Y);
                Invalidate();
            }
        }

        protected override void OnMouseUp(MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left && draggedRect != null)
            {
                // create and execute new command
                ICommand command = new ChangeLocationCommand(rects, draggedRect, newRectLocation);

                manager.Execute(command);
                draggedRect = null;
                Invalidate();
            }
        }

        #endregion

        private void btUndo_DropDownItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            int index = btUndo.DropDownItems.IndexOf(e.ClickedItem);
            manager.Undo(index + 1);
        }

        private void btRedo_DropDownItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            int index = btRedo.DropDownItems.IndexOf(e.ClickedItem);
            manager.Redo(index + 1);
        }
    }
}
