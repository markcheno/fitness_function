int nPoints = 80;
PVector[][] v = new PVector[nPoints][nPoints];
int findex=0;
String fname = "";
ArrayList flist = new ArrayList();
float xmag=0, ymag=0;

void setup() 
{ 
  size(400,400,P3D);
  frameRate(30);
  colorMode(RGB,2);
  textMode(SCREEN);
  flist = new ArrayList();
  flist.add(new DeJongF1());
  flist.add(new Rosenbrock());
  flist.add(new RastriginF1());
  flist.add(new SchafferF6());
  flist.add(new Ackley());
  flist.add(new Schwefel());
  flist.add(new Michalewicz());
  flist.add(new Easom());
  flist.add(new SixHump());
  flist.add(new DropWave());
  init_fitness();
} 

void keyPressed()
{
  switch(keyCode) {
    case LEFT:
      findex--;
      if( findex < 0 ) findex = flist.size()-1;
      init_fitness();
      break;
    case RIGHT:
      findex++;
      if( findex > flist.size()-1 ) findex = 0;
      init_fitness();
      break;  
  }
}

void init_fitness()
{
  //float zmin=1e6,zmax=-1e6;
  FitnessFunction f = (FitnessFunction)flist.get(findex);
  fname = f.name();
  for(int row=0; row<nPoints; row++ ) {
   for(int col=0; col<nPoints; col++ ) {
     float x = f.xMin+(row*(f.xRange()/nPoints));
     float y = f.yMin+(col*(f.yRange()/nPoints));
     float z = f.fitness(x,y);
     //if( z < zmin ) zmin = z;
     //if( z > zmax ) zmax = z;
     v[row][col] = new PVector();
     v[row][col].x = map(x,f.xMin,f.xMax,-1,1);
     v[row][col].y = map(y,f.yMin,f.yMax,-1,1);
     v[row][col].z = map(z,f.zMin,f.zMax,-1,1);
   }
  }
  //println("zmin="+zmin+", zmax="+zmax);
}

void draw() 
{ 
  background(0);
  pushMatrix(); 
  text(fname,25,25);
  ambientLight(2,2,2);  
  pointLight(2,2,2,100+width/2,100+height/2,100);

  translate(width/2, height/2, -30); 
  float newXmag = mouseX/float(width)*TWO_PI;
  float newYmag = mouseY/float(height)*TWO_PI;
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  rotateX(-ymag);
  rotateZ(-xmag);
  scale(100);
  
  stroke(2);
  line(0,0,1,0,0,-1);
  line(0,1,-1,0,-1,-1);
  line(1,0,-1,-1,0,-1);
  
  noStroke();
  fill(.75,.25,.25);
  for(int row=1; row<nPoints-1; row++ )
  {
   beginShape(QUAD_STRIP);
   for(int col=0; col<nPoints; col++ ) {
     vertex(v[row][col].x,v[row][col].y,v[row][col].z);
     vertex(v[row+1][col].x,v[row+1][col].y,v[row+1][col].z);
   } 
   endShape();
  }

  popMatrix(); 
}
