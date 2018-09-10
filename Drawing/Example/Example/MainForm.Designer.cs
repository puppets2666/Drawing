namespace Shapes
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.btNew = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.btUndo = new System.Windows.Forms.ToolStripSplitButton();
            this.btRedo = new System.Windows.Forms.ToolStripSplitButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.cbColor = new System.Windows.Forms.ToolStripComboBox();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btNew,
            this.toolStripSeparator2,
            this.btUndo,
            this.btRedo,
            this.toolStripSeparator1,
            this.toolStripLabel1,
            this.cbColor});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(472, 25);
            this.toolStrip1.TabIndex = 0;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // btNew
            // 
            this.btNew.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btNew.Image = global::Shapes.Properties.Resources.paper_16x16;
            this.btNew.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btNew.Name = "btNew";
            this.btNew.Size = new System.Drawing.Size(23, 22);
            this.btNew.Text = "New Rectangle";
            this.btNew.Click += new System.EventHandler(this.btNew_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 25);
            // 
            // btUndo
            // 
            this.btUndo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btUndo.Enabled = false;
            this.btUndo.Image = global::Shapes.Properties.Resources.undo_16x16;
            this.btUndo.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btUndo.Name = "btUndo";
            this.btUndo.Size = new System.Drawing.Size(32, 22);
            this.btUndo.Text = "Undo";
            this.btUndo.ButtonClick += new System.EventHandler(this.btUndo_ButtonClick);
            this.btUndo.DropDownItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.btUndo_DropDownItemClicked);
            // 
            // btRedo
            // 
            this.btRedo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btRedo.Enabled = false;
            this.btRedo.Image = global::Shapes.Properties.Resources.redo_16x16;
            this.btRedo.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btRedo.Name = "btRedo";
            this.btRedo.Size = new System.Drawing.Size(32, 22);
            this.btRedo.Text = "Redo";
            this.btRedo.ButtonClick += new System.EventHandler(this.btRedo_ButtonClick);
            this.btRedo.DropDownItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.btRedo_DropDownItemClicked);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(36, 22);
            this.toolStripLabel1.Text = "Color";
            // 
            // cbColor
            // 
            this.cbColor.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbColor.Items.AddRange(new object[] {
            "Blue",
            "Red",
            "Yellow",
            "Green"});
            this.cbColor.Name = "cbColor";
            this.cbColor.Size = new System.Drawing.Size(121, 25);
            this.cbColor.SelectedIndexChanged += new System.EventHandler(this.cbColor_SelectedIndexChanged);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.ClientSize = new System.Drawing.Size(472, 397);
            this.Controls.Add(this.toolStrip1);
            this.Name = "MainForm";
            this.Text = "MainForm";
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripSplitButton btUndo;
        private System.Windows.Forms.ToolStripSplitButton btRedo;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripLabel toolStripLabel1;
        private System.Windows.Forms.ToolStripComboBox cbColor;
        private System.Windows.Forms.ToolStripButton btNew;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;

    }
}

