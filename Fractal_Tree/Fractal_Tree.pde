final float angle = PI/9;
final int len = 300;
final int max = 50;

final int height = 1000;
final int width = 1000;

int count = 0;

void setup(){
  size(1000,1000);
  background(0);
  stroke(255);
  translate(width/2,height);
  
  //draw initial stem
  line(0,0,0,-len);
  translate(0,-len);
  branch(len);
}

void draw(){
}

void branch(float branchLength){
  branchLength*=0.67;
  
  if(branchLength > 2){
    //save state
    pushMatrix();
    rotate(-angle);
    line(0,0,0,-branchLength);
    translate(0,-branchLength);
    count++;
    branch(branchLength);
    popMatrix();
    
    pushMatrix();
    rotate(angle);
    line(0,0,0,-branchLength);
    translate(0,-branchLength);
    branch(branchLength);
    popMatrix();
  }else{
    /*
    float ratio = len/branchLength;
    float td = logX(ratio,0.67);
    println("len (" + len + ") branchLength (" + branchLength);
    println("Tree depth: " + ((int)(-1*td)));
    */
  }  
}

float logX(float target, float x){
  return (log(target)/log(x));
}
