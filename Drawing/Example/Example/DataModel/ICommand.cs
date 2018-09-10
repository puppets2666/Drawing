namespace Shapes.DataModel
{
    public interface ICommand
    {
        string Name { get; }
        void Execute();
        void UnExecute();
    }
}