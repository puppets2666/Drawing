namespace Shapes.DataModel
{
    public class AddRectCommand : ICommand
    {
        private Rects rects;
        private Rect rect;

        public AddRectCommand(Rects rects, Rect rect)
        {
            this.rects = rects;
            this.rect = rect;
        }

        public string Name => "Add rectangle";

        public void Execute()
        {
            rects.Add(rect);
            rects.OnChanged();
        }

        public void UnExecute()
        {
            rects.RemoveLastRect();
            rects.OnChanged();
        }
    }
}