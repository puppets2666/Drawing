using System.Drawing;

namespace Shapes.DataModel
{
    public class ChangeColorCommand : ICommand
    {
        private Rects rects;
        private Color color;
        private Color prevColor;

        public ChangeColorCommand(Rects rects, Color color)
        {
            this.rects = rects;
            this.color = color;
        }

        public string Name => "Change color";

        public void Execute()
        {
            prevColor = rects.LastRect.Color;
            rects.LastRect.Color = color;

            rects.OnChanged();
        }

        public void UnExecute()
        {
            rects.LastRect.Color = prevColor;

            rects.OnChanged();
        }
    }
}