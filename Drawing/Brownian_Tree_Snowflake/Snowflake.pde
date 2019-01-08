class Snowlake
{
  // FIELDS
  private ArrayList<Particle> snowflake; 
  // CONSTRUCTORS
  Snowlake()
  {
    snowflake = new ArrayList<Particle>();
  }
  // METHODS
  void show()
  {
    // part of snowlake rotated 6 times
    for (int i = 0; i < 6; ++i)
    {
      rotate(PI/3);
      // an original particle
      current.show();
      for(Particle p : snowflake)
      {
        p.show();
      }
      // a particle mirrored on X axis
      pushMatrix();
      scale(1, -1);
      current.show();
      for(Particle p : snowflake)
      {
        p.show();
      }
      popMatrix();
    }
  }
  void add(Particle p)
  {
    snowflake.add(p);
  }
  void clear()
  {
    snowflake.clear();
  }
  
}
