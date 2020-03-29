void setup()
{
  size(screen.width - 17,screen.height - 80);
  background(125);
}

//variables(image)
var CoPad = loadImage("../controlPad.png");
var Chara = loadImage("../lungs.png")
//variables for controling
var virusKT = 100;
var virusK = 0;
var N = 0;
var Vx = -300,Vy=screen.width/2.5;
var Vx2 = screen.width+ 300,Vy2=screen.width/2.5;
var Vx3 = screen.width/2 - 40,Vy3=-500;
var Vx4 = screen.width/2 - 40,Vy4=screen.width + 200;
var start = 1;
//variables for barrier images
  var up = loadImage("../up_barrier.png");
  var right = loadImage("../right_barrier.png");
  var left = loadImage("../left_barrier.png");
  var down = loadImage("../down_barrier.png");
  var full = loadImage("../full_barrier.png");
  var Expld = screen.width/2;
//player variables
var SWTHM = screen.width -20;
var PC = SWTHM / 2 - screen.width/8
var health = 20;
//images virus
var virus = loadImage("../virus.png")
//functions
//draw Background
DrawSence = function() {
  //background/frame seup
  fill(300, 300, 300);
  strokeWeight(3);
  stroke(0,0,0);
  rect(0, 0, screen.width - 20, screen.width - 20);
  fill(71,14,105);
  rect(0, screen.width - 20, screen.width -19,  screen.height- screen.width - 60);
}

//Draw Control pad
DrawPad = function(imgx) {
  image(imgx, 0, screen.width - 10, screen.width - 20, screen.height- screen.width - 80);
}

//draw player
DrawChar =function() {
  image(Chara,PC,PC,screen.width/4,screen.width/4)
}

//draw barrier
Drawbari = function(N) {
  if(N == 1){
  image(left,PC/1.7,PC - screen.width / 6,screen.width/7, screen.width/2);
  }else if(N == 2){
    image(full,PC/1.6,PC/1.6,Expld,Expld);
  }else if(N == 3){
    image(right,PC*1.7,PC - screen.width / 6,screen.width/7, screen.width/2);
  }else if(N == 4){
  image(up,PC/1.6,PC - screen.width / 6,screen.width/2, screen.width/7);
  }else if(N == 5){
  image(down,PC/1.6,PC + screen.width/5,screen.width/2, screen.width/7);
  }
}

//check for control pad
CheckP = function() {
var SWTM = screen.width -10;
var SW_TO = screen.width - 20;
var FT_W = SW_TO/10 * 4;
var TT_W = SW_TO/10 * 3;
var TFT_W = SW_TO/10 * 3.5;
var ST_W = SW_TO/10 * 7;
var SW_TO2 = screen.height - screen.width - 80;
var FT_W2 = SW_TO2/10 * 4;
var TT_W2 = SW_TO2/10 * 3;
var TFT_W2 = SW_TO2/10 * 3.5;
var ST_W2 = SW_TO2/10 * 7;
var DTM = screen.width + FT_W2 -29;
var DFM = DTM + TT_W2;
var MD = 0;
var HT = 0;
//check middle
if (mouseY >= DTM && mouseY <= DFM) {
  //left
  if(mouseX >= 0 && mouseX <= TFT_W){
    return 1;
  }
  //midd
  if(mouseX >= TFT_W && mouseX <= TFT_W + TT_W && health <= 1){
    return 2;
  }
  //right
    if(mouseX >= TT_W + TFT_W && mouseX <= screen.width - 20){
    return 3;
  }
  
}
//check Height
if(mouseY >= SWTM && mouseY <= SWTM + SW_TO2 && mouseX >= TFT_W && mouseX <= TFT_W + TT_W){
  //up
  if(mouseY >= screen.width-10 && mouseY <= screen.width -10 + TFT_W2){
    return 4;
  }
  //down
  if(mouseY >= screen.width-10 + TFT_W2 +TT_W2 && mouseY <= screen.width -10 + TFT_W2 + TT_W2 + TFT_W2){
    return 5;
  }
  }}
  DrawPoint = function(P) {
    fill(255,200,0);
    textSize(50);
    text(P,PC*1.13,PC*1.45)
  }
  DrawVirus = function() {
    image(virus,Vx,Vy,PC/4,PC/4);
    image(virus,Vx2,Vy2,PC/4,PC/4);
    image(virus,Vx3,Vy3,PC/4,PC/4);
    image(virus,Vx4,Vy4,PC/4,PC/4);
  }
  GOver = function(sts){
    start = 0;
    if(sts == "win"){
      start = 0;
    }
    if(sts == "lose"){
      start = 0;
    }
  }
draw = function() {
  //repeat code
  //call functions
  DrawSence();
  DrawVirus();
  DrawPad(CoPad);
  DrawChar()
  CheckP();
  DrawPoint(health);
  Drawbari(CheckP());
  if(health <= 0){
    fill(200,0,0);
    textSize(50);
    text("YOU LOST",screen.width/9,screen.height/3);
    textSize(20);
    text("Click to replay",screen.width/6,screen.height/2.8);
  }
  if(virusKT <= virusK){
    if(health < 20){
    fill(200,0,0);
    textSize(50);
    text("YOU WIN",screen.width/6,screen.height/3);
    textSize(20);
    text("You have",screen.width/6,screen.height/2.8);
    text(health,screen.width/2.55,screen.height/2.8);
    text("live/lives left",screen.width/2.2,screen.height/2.8);
    text("Try to get it up to 20,click to replay",screen.width/15,screen.height/2.6);
      if(mouseX >= 0){
      start = 1;
      virusKT = 100;
      virusK = 0;
      N = 0;
      Vx = -300,Vy=screen.width/2.5;
      Vx2 = screen.width+ 300,Vy2=screen.width/2.5;
      Vx3 = screen.width/2 - 40,Vy3=-500;
      Vx4 = screen.width/2 - 40,Vy4=screen.width + 200;
      }
    }else{
    fill(200,0,0);
    textSize(50);
    text("YOU WIN",screen.width/6,screen.height/3);
    textSize(20);
    text("You have",screen.width/6,screen.height/2.8);
    text(health,screen.width/2.55,screen.height/2.8);
    text("live/lives left",screen.width/2.2,screen.height/2.8);
    textSize(17)
    text("Congratuation you still have maxed health",screen.width/20,screen.height/2.6);
    text("click to replay",screen.width/20,screen.height/2.5);
      if(mouseX >= 0){
      start = 1;
      virusKT = 100;
      virusK = 0;
      N = 0;
      Vx = -300,Vy=screen.width/2.5;
      Vx2 = screen.width+ 300,Vy2=screen.width/2.5;
      Vx3 = screen.width/2 - 40,Vy3=-500;
      Vx4 = screen.width/2 - 40,Vy4=screen.width + 200;
      }}
  }
  //make virus move
  if(start == 1){
  if(virusK >= virusKT){
    GOver("win");
  }
    Vx += random(1.5,2.2);
    Vx2 -= random(1.5,2.2);
    Vy3 += random(1.5,2.2);
    Vy4 -= random(1.5,2.2);
    if(Vx >= PC - screen.width/15){health --;Vx = random(-265,-65);}
    if(Vx2 <= PC + screen.width / 5){health --;Vx2 = random(screen.width, screen.width + 200);}
    if( Vy3 >= PC - screen.width/15){health --;Vy3 = random(-265,-65);}
    if( Vy4 <= PC + screen.width /5){health --;Vy4 = random(screen.width,screen.width + 200);}
  //check for game over
  if (health <= 0){
    GOver("lose");
  }
  //barrier
  //1
  if(CheckP() == 1){
    if(Vx >= PC/1.7 - screen.width/15){
      Vx = random(-165,-65);
      virusK ++;
  }}
  //2
  if(CheckP() == 2){
    if(Vx >= PC/1.7 - screen.width/15){
      Vx = random(-165,-65);
      virusK ++;
  }
  if(Vx2 <= PC*1.7 + screen.width/15){
      Vx2 = random(screen.width, screen.width + 200);
      virusK ++;
      }
  if(Vy3 >= PC/1.7 - screen.width/15){
      Vy3 = random(-165,-65);
      virusK ++;
  }
    if(Vy4 <= PC*1.7 + screen.width/15){
      Vy4 = random(screen.width, screen.width + 200);
      virusK ++;
  }
  }
  //3
    if(CheckP() == 3){
    if(Vx2 <= PC*1.7 + screen.width/15){
      Vx2 = random(screen.width, screen.width + 200);
      virusK ++;
  }}
  //4
    if(CheckP() == 4){
    if(Vy3 >= PC/1.7 - screen.width/15){
      Vy3 = random(-165,-65);
      virusK ++;
  }}
  //5
    if(CheckP() == 5){
    if(Vy4 <= PC*1.7 + screen.width/7){
      Vy4 = random(screen.width, screen.width + 200);
      virusK ++;
  }}
  textSize(20);
  text(virusK,PC/5,screen.width + PC/4);
  text(virusKT,PC/2,screen.width + PC/4);
  text("|",PC/2.4,screen.width + PC/4.1)
  }
};
