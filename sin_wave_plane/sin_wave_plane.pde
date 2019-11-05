int maxH = 300, minH = 10;
int w = 40;
int height = 600, width = 600;
float angle = 0.1;
float maxD,ma;

final boolean recording = false;
int frameCount = 0, maxFrames = 60;

void setup(){
  size(600,600,P3D);
  maxD = dist(0,0,width/2,height/2);
  ma = atan(1/sqrt(2));
  rectMode(CENTER);
  colorMode(HSB);
}

void draw(){
  lights();
  //pointLight(100, 100, 100, 10, 30, 50);
  pointLight(255, 0, 255, 10, 30, 50); //white light
  background(50);
  ortho(-600, 600, 600, -600, -1000, 1000);
  rotateX(1.25*ma);
  rotateY(-QUARTER_PI);
  translate(width/2+112.5,height/2+112.5);
  for(float z = 0; z < height; z+=w){
    for(float x = 0; x < width; x+=w){
      pushMatrix();
      float d = dist(x,z,width/2,height/2);
      float mapD = map(d,0,maxD,-PI,PI);
      int h = floor(map(sin(angle+mapD),-1,1,minH,maxH));
      fill(map(h,minH,maxH,80,220),150,200); //varies highly saturated colours
      //fill(80,150,map(h,minH,maxH,50,180)); //varies darkness with 1 base colour
      //fill(200,0,map(h,minH,maxH,80,220)); //greyscale variations
      translate(x - width/2, 0, z - width/2);
      box(w,h,w);
      popMatrix();
    }
  }
  if(!recording){
    angle-=0.075;
  }
  else{
    angle-=TWO_PI/maxFrames;
    if(frameCount<maxFrames){
      String frameName = "frame-"+(frameCount++)+".gif";
      println(frameName);
      saveFrame(frameName);
    }
  }
}
