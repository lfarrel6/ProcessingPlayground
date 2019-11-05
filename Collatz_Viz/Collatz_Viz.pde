final int height = 1000;
final int width = 1000;

final int dPos = 5;
final float angle = PI/12;

final int nLines = 10000;
IntList[] lines;

int currentIndex = 0;
boolean printed = false;

void setup(){
  println("Setting up");
  println("Creating Canvas");
  size(1000,1000);
  background(0);
  stroke(255,80);
  frameRate(120);
  println("Canvas Created");
  
  println("Generating Lines");
  lines = generateLines(nLines);
  println("Lines Generated");
  println("Set up complete");
  println("Beginning Drawing");
}

void draw(){
  resetMatrix();
  translate(width/2,height/2);

  if(currentIndex < lines.length){
    IntList currentLine = lines[currentIndex];
    println("Currently drawing " + currentLine.get(currentLine.size()-1));
    for(int i = 0; i < currentLine.size(); i++){
      int num = currentLine.get(i);
      if(num%2==0){
        rotate(angle);
      }else{
        rotate(-angle);
      }
      line(0,0,0,-dPos);
      translate(0,-dPos);
    }
    
    currentIndex++;
  }else if(!printed){
    println("Drawing Complete");
    printed=true;
  }
}

IntList[] generateLines(int n){
  IntList[] res = new IntList[n];
  for(int i = 2; i < n+2; i++){
    res[i-2] = genColatzSeq(i);
  }
  return res;
}

IntList genColatzSeq(int n){
  IntList sequence = new IntList();
  do{
    sequence.append(n);
    n = colatz(n);
  }while(n!=1);
  sequence.append(1);
  sequence.reverse();
  return sequence;
}

int colatz(int n){
  if(n%2==0){
    return n/2;
  }else{
    return ((n*3)+1)/2;
  }
}
