int x = 400;
int y = 300;
int speedY = 10;
int speedX = 10;
int score = 0;
boolean gameover = false;

void setup(){
  size(800,600);
}

void draw(){
  if(!gameover){
    background(0,0,0);
    noStroke();
    fill(255,255,255);
    rect(0,0,800,20);
    rect(0,580,800,20);
    rect(390,0,20,600);
    fill(255,255,255);
    rect(20,mouseY-50,20,100);
    rect(780,30,20,540);
    
    ellipse(x,y,60,60);
    x = x + speedX;
    y = y + speedY;
    
    //bounce of walls
    if(y>=600-50){
      speedY = -speedY;
    }
    if(y<=0+50){
      speedY = -speedY;
    }
    if(x>=800-50){
      speedX = -speedX;
    }
  
    //bounce of padel
    if(x>=65 && x<=75){
      if(mouseY+50 >= y && mouseY-50 <= y){
        speedX = -speedX;
        score ++;
      }
    }
    textSize(50);
    text(score,100,100);
    
    if(x < -30){
      gameover = true;
    }
  }
  else{
    background(0,0,0);
    textSize(50);
    text("GAME OVER", 250, 300);
    textSize(30);
    text("Final Score: " + score, 300, 350);
  }
}

void keyPressed() {
  final int k = keyCode;
  if (k == ENTER)
    if (looping){
      noLoop();
      fill(255,0,0);
      text("Pause", 325, 300);
    }
    else{
      loop();
    }
}
