class A
{
  int i;
  A()
{
  i = int(random(200));
}
}

ArrayList<A> al = new ArrayList<A>();
int size = 50;
for(int i =0;i < 50; ++i)
{
al.add(new A());
}
for(A a : al)
{
  println(a.i);
}
exit();
