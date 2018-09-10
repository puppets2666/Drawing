using System.Drawing;

namespace Shapes.DataModel
{
    public class ChangeLocationCommand : ICommand
    {
        private Rects rects;
        private Rect rect;
        private Point location;
        private Point prevLocation;

        public ChangeLocationCommand(Rects rects, Rect rect, Point location)
        {
            this.rects = rects;
            this.rect = rect;
            this.location = location;
        }

        public string Name =>" Move";

        public void Execute()
        {
            prevLocation = rect.Location;
            rect.Location = location;

            rects.OnChanged();
        }

        public void UnExecute()
        {
            rect.Location = prevLocation;

            rects.OnChanged();
        }
    }
}
