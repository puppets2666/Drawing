using System;
using System.Collections.Generic;

namespace Shapes.DataModel
{
    public class Rects : IEnumerable<Rect>
    {
        public event EventHandler Changed = delegate { };
        private List<Rect> Items = new List<Rect>();

        public void Add(Rect rect)
        {
            Items.Add(rect);
        }

        public virtual void OnChanged()
        {
            Changed(this, EventArgs.Empty);
        }

        internal void RemoveLastRect()
        {
            if(Items.Count == 0) throw new ArgumentException();
            Items.RemoveAt(Items.Count - 1);
        }

        public Rect LastRect => Items.Count == 0 ? null : Items[Items.Count - 1];

        public IEnumerator<Rect> GetEnumerator() => Items.GetEnumerator();
        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator() => GetEnumerator();
    }
}