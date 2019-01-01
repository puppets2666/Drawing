class Firework
{
  // FIELDS
  private ArrayList<Particle> firework;
  private ArrayList<Explosion> child;
  // CONSTRUCTORS
  Firework()
  {
    firework = new ArrayList<Particle>();
    child = new ArrayList<Explosion>();
  }
  // METHODS
  void update(PVector gravity)
  {
    if (random(1) < 0.1) firework.add(new Particle());
    
    for (int i = 0; i < firework.size(); ++i)
    {
      firework.get(i).applyForce(gravity);
      firework.get(i).update();
      
      if(firework.get(i).reachTopPoint())
      {
        // add its children to child array
        Explosion[] child = firework.get(i).explode();
        for (int j = 0; j < child.length; ++j)
        {
          this.child.add(child[j]);
        }
        firework.remove(i);
        --i;
      }
    }
    for (int i = 0; i < child.size(); ++i)
    {
      child.get(i).applyForce(gravity);      
      child.get(i).update();
      
      if(child.get(i).outOfScreen())
      {
        child.remove(i);
        --i;
      }
    }
  }
  void show()
  {
    for (int i = 0; i < firework.size(); ++i)
    {
      firework.get(i).show();
    }
    for (int i = 0; i < child.size(); ++i)
    {
      child.get(i).show();
    }
  }
}
