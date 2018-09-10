using System.Drawing;

namespace Shapes.DataModel
{
    public class Rect
    {
        public Point Location { get; set; }
        public Size Size { get; set; }
        public Color Color { get; set; }

        public Rect()
        {
            Location = new Point(100, 100);
            Color = Color.SkyBlue;
            Size = new Size(100, 100);
        }

        public bool HitTest(Point p)
        {
            int x = p.X - Location.X;
            int y = p.Y - Location.Y;
            return x >= 0 && x < Size.Width && y >= 0 && y < Size.Height;
        }
    }
}