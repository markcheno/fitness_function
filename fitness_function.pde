class FitnessFunction {
  float xMin = 0.0;
  float xMax = 0.0;
  float yMin = 0.0;
  float yMax = 0.0;
  float zMin = 0.0;
  float zMax = 0.0;
  float xRange() { return xMax-xMin; }
  float yRange() { return yMax-yMin; }
  float zRange() { return zMax-zMin; }
  float fitness(float x, float y) {
    return 0.0;
  }
  float[] train() {
   float[] t = new float[2];
   t[0] = random(xMin,xMax);
   t[1] = random(yMin,yMax);
   return t;
  }
  String name() { return "FitnessFunction"; }
}

class DeJongF1 extends FitnessFunction {
  DeJongF1() {
    xMin = -5.12;
    xMax = 5.12;
    yMin = -5.12;
    yMax = 5.12;
    zMin = 0.0;
    zMax = 53.0;
  }
  float fitness(float x, float y) {
    return pow(x,2)+pow(y,2);
  }
  String name() { return "DeJongF1"; }
}

class Rosenbrock extends FitnessFunction {
  Rosenbrock() {
    xMin = -2.0;
    xMax = 2.0;
    yMin = -1.0;
    yMax = 3.0;
    zMin = 0.0;
    zMax = 2509.0;
  }
  float fitness(float x, float y) {
    return pow(1.0-x,2)+100.0*pow(y-pow(x,2),2);
  }
  String name() { return "Rosenbrock"; }
}

class RastriginF1 extends FitnessFunction {
  RastriginF1() {
    xMin = -5.12;
    xMax = 5.12;
    yMin = -5.12;
    yMax = 5.12;
    zMin = 0.0;
    zMax = 81.0;
  }
  float fitness(float x, float y) {
    return 20 + pow(x,2) - 10*cos(2*PI*x) + pow(y,2) - 10*cos(2*PI*y);
  }
  String name() { return "RastriginF1"; }
}

class SchafferF6 extends FitnessFunction {
  SchafferF6() {
    xMin = -5.12;
    xMax = 5.12;
    yMin = -5.12;
    yMax = 5.12;
    zMin = 0.0;
    zMax = 1.0;
  }
  float fitness(float x, float y) {
    return 0.5 + (pow(sin(sqrt(x*x+y*y)),2)-0.5)/pow(1+0.001*(x*x+y*y),2);
  }
  String name() { return "SchafferF6"; }
}

class Ackley extends FitnessFunction {
  Ackley() {
    xMin = -5.12;
    xMax = 5.12;
    yMin = -5.12;
    yMax = 5.12;
    zMin = 0.0;
    zMax = 15.0;
  }
  float fitness(float x, float y) {
    return -20*exp(-0.2*sqrt(0.5*(x*x+y*y)))-exp(0.5*(cos(2*PI*x)+cos(2*PI*y)))+20+exp(1);
  }
  String name() { return "Ackley"; }  
}

class Schwefel extends FitnessFunction {
  Schwefel() {
    xMin = -500.0;
    xMax = 500.0;
    yMin = -500.0;
    yMax = 500.0;
    zMin = -838.0;
    zMax = 838.0;
  }
  float fitness(float x, float y) {
    return -x*sin(sqrt(abs(x)))- y * sin(sqrt(abs(y)));
  }
  String name() { return "Schwefel"; }
}

class Michalewicz extends FitnessFunction {
  Michalewicz() {
    xMin = -5.12;
    xMax = 5.12;
    yMin = -5.12;
    yMax = 5.12;
    zMin = -1.91;
    zMax = 1.91;
  }
  float fitness(float x, float y) {
    return -sin(x)*pow(sin(x*x/PI),2) - sin(y)*pow(sin(y*y/PI),2);
  }
  String name() { return "Michalewicz"; }
}

class Easom extends FitnessFunction {
  Easom() {
    xMin = -100.0;
    xMax = 100.0;
    yMin = -100.0;
    yMax = 100.0;
    zMin = -0.09787;
    zMax = 1.61811e-5;
  }
  float fitness(float x, float y) {
    return -cos(x)*cos(y)*exp( -pow(x-PI,2) - pow(y-PI,2) );
  }
  String name() { return "Easom"; }
}

class SixHump extends FitnessFunction {
  SixHump() {
    xMin = -1.0;
    xMax = 1.0;
    yMin = -1.0;
    yMax = 1.0;
    zMin = -1.0;
    zMax = 3.25;
  }
  float fitness(float x, float y) {
    return (4.0-2.1*x*x+pow(x,4)/3)*x*x+x*y+(-4+4*y*y)*y*y;
  }
  String name() { return "SixHump"; }
}

class DropWave extends FitnessFunction {
  DropWave() {
    xMin = -5.12;
    xMax = 5.12;
    yMin = -5.12;
    yMax = 5.12;
    zMin = -1.0;
    zMax = 0.0;
  }
  float fitness(float x, float y) {
    return -(1.0+cos(12*sqrt(x*x+y*y)))/(0.5*(x*x+y*y)+2);
  }
  String name() { return "DropWave"; }
}

