//Draw Fermat's Spiral at increasingly accurate approximations of fibonacci's golden angle

final int height = 1000;
final int width = 1000;
final int scale = 16;
final int dotSize = 5;
final int maxN = 1000;

int fibAccuracy = 2;
float fibN = 2;
float fibN_2 = 1;
float goldenAngle;

int n = 0;
int textY = 30;
int dY = 30;

final int btnW = 100;
final int btnH = 30;
final int btnColNeutral = 220;
final int btnColHover = 110;
final int btnX = 20;
final int btnY = textY+(2*dY);

boolean bOnProceed = false;

void setup(){
  size(1000,1000);
  background(0);
  frameRate(120);
  colorMode(HSB);
  updateInputs();
}

void draw(){
  update(mouseX,mouseY);
  drawBtn();
  if(n<maxN){
    fill((n%maxN)%256,100,200);
    noStroke();
    
    float a = n*goldenAngle;
    float r = scale*sqrt(n);
    float x = (cos(a)*r) + width/2;
    float y = (sin(a)*r) + height/2;
    
    ellipse(x,y,dotSize,dotSize);
    
    n++;
  }
}

void updateInputs(){
 
 updateFibAccuracy();
 updateGoldenAngle();
 drawGUI();
 
}

void update(int x, int y){
  if(overProceed(x,y)){
    bOnProceed = true;
  }else{
    bOnProceed = false;
  }
}

boolean overProceed(int x, int y){
  if(x >= btnX && x <= btnX+btnW){
    if(y >= btnY && y <= btnY+(btnH)){
      return true;
    }
  }
  return false;
}

void mousePressed(){
  if(bOnProceed){
    println("Proceeding");
    background(0);
    updateInputs();
    n=0;
  }
}

void drawGUI(){

   textY = 30;
   textSize(16);
   String fibNumStr = "Vis for " + fibN_2 + " & " + fibN;
   stroke(255);
   fill(255);
   text(fibNumStr, 20, textY);
   
   textY+=dY;
   
   String gaStr = "Angle: " + (goldenAngle*180)/PI;
   text(gaStr,20,textY);
   
}

void drawBtn(){
  //proceed button
   if(bOnProceed){
     fill(btnColHover);
   }else{
     fill(btnColNeutral);
   }
   noStroke();
   rect(btnX,btnY,btnW,btnH);
}

void updateFibAccuracy(){
  float fibA = fibN;
  float fibB = fibA-fibN_2;
  fibN_2 = fibB;
  fibN = fibA+fibB;
  fibAccuracy++;
}

void updateGoldenAngle(){
  goldenAngle = getFibAngle(true);
}

float getFibAngle(boolean radians){
  float a = (fibN_2/fibN)*360;
  if(radians){
    a*=PI/180;
  }
  return a;
}
