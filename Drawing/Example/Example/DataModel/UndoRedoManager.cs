using System;
using System.Collections.Generic;
using System.Linq;

namespace Shapes.DataModel
{
    public class UndoRedoManager
    {
        public event EventHandler StateChanged = delegate { };

        public bool CanUndo => UndoStack.Count > 0; 
        public bool CanRedo => RedoStack.Count > 0;

        Stack<ICommand> UndoStack { get; set; }
        Stack<ICommand> RedoStack { get; set; }

        public UndoRedoManager()
        {
            UndoStack = new Stack<ICommand>();
            RedoStack = new Stack<ICommand>();
        }

        public void Undo()
        {
            if(UndoStack.Count > 0)
            {
                ICommand command = UndoStack.Pop();
                command.UnExecute();
                RedoStack.Push(command);

                StateChanged(this, EventArgs.Empty);
            }
        }

        public void Redo()
        {
            if (RedoStack.Count > 0)
            {
                ICommand command = RedoStack.Pop();
                command.Execute();
                UndoStack.Push(command);

                StateChanged(this, EventArgs.Empty);
            }
        }
        
        public void Execute(ICommand command)
        {
            command.Execute();
            UndoStack.Push(command);
            RedoStack.Clear();

            StateChanged(this, EventArgs.Empty);
        }

        public IEnumerable<string> UndoItems => UndoStack.Select(c => c.Name);

        public IEnumerable<string> RedoItems => RedoStack.Select(c => c.Name);

        public void Undo(int count)
        {
            for (int i = 0; i < count; ++ i)  Undo();
        }

        public void Redo(int count)
        {
            for (int i = 0; i < count; ++ i)  Redo();
        }
    }
}