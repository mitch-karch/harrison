//Justin Comins && Mitchell Karchemsky
import controlP5.*;
ControlP5 cp5;

int i             = 0;
color bg          = #B0B0B0;

int answer        = 0;
int answerChoiceA = 0;
int answerChoiceB = 0;
int answerChoiceC = 0;
int answerChoiceD = 0;

int score         = 0;
void setup(){
  size(512, 512);
  fill(0, 0, 0);
  background(bg);
   cp5 = new ControlP5(this);
  cp5.addButton("GET")
     .setValue(0)
     .setPosition(100,height-100)
     .setSize(80,20)
     .setId(1);
  cp5.addButton("READY")
     .setValue(0)
     .setPosition(200,height-100)
     .setSize(80,20)
     .setId(2);
  cp5.addButton("TO")
     .setValue(0)
     .setPosition(300,height-100)
     .setSize(80,20)
     .setId(3);
  cp5.addButton("PLAY")
     .setValue(0)
     .setPosition(400,height-100)
     .setSize(80,20)
     .setId(4);
}

void draw(){

}

void mousePressed(){
  
}

int difficultNumber(){
  return (int) Math.floor(20+(Math.random())*40);
}

void makeMaths(int level){
  //TODO:Generate problem
  int firstOpperand, secondOpperand, dNum;
  textSize(32);
  textAlign(CENTER,CENTER);
  String[] ops     = {"+","-","*","/"};
  if (level < 4){
    firstOpperand  = (int) Math.floor(10+(Math.random())*level*30);
    secondOpperand = (int) Math.floor(10+(Math.random())*level*70);
  } else if (level < 7){
    firstOpperand  = (int) Math.floor(6+(Math.random()) *5*(level-4));
    secondOpperand = (int) Math.floor(14+(Math.random())*9*(level-3));
  } else {
    secondOpperand = (int) Math.floor(12+Math.random()*10*(level-6));
    firstOpperand  = ((int) Math.floor(7+Math.random()*10*(level-7)))*secondOpperand;
  }
    
  int answer        = 0;
  int answerChoiceA = 0;
  int answerChoiceB = 0;
  int answerChoiceC = 0;
  int answerChoiceD = 0;
  int opperation    = (int) Math.floor(Math.random()*2);
  switch(level){
   case 0:
     firstOpperand  = 2;
     secondOpperand = 2;
     answer = firstOpperand + secondOpperand;
     text(firstOpperand+ops[0]+secondOpperand+"=", width/2, height/2);
   case 1:
     answer = firstOpperand + secondOpperand;
     text(firstOpperand+ops[0]+secondOpperand+"=", width/2, height/2);
     // 2 + 2 = ?
   break;
   
   case 2:
     switch(opperation){
      case 0:
       answer = firstOpperand + secondOpperand;
       text(firstOpperand+ops[0]+secondOpperand+"=", width/2, height/2);
       break;
      default:
       answer = firstOpperand - secondOpperand;
       text(firstOpperand+ops[1]+secondOpperand+"=", width/2, height/2);
     }
     // <20 + <20 = ?
   break;
   
   case 3:
     dNum = difficultNumber();
     switch(opperation){
      case 0:
       answer = firstOpperand + secondOpperand + dNum;
       text(firstOpperand+ops[0]+secondOpperand+ops[0]+dNum+"=", width/2, height/2);
       break;
      default:
       answer = firstOpperand - secondOpperand - dNum;
       text(firstOpperand+ops[0]+secondOpperand+ops[1]+dNum+"=", width/2, height/2);
     }
     // <50 + <50 = ?
   break;
   
   case 4:
     answer = firstOpperand * secondOpperand;
     text(firstOpperand+ops[2]+secondOpperand+"=", width/2, height/2);
     // <120 + <120 - 3
   break;
   
   case 5:
     answer = firstOpperand * secondOpperand;
     text(firstOpperand+ops[2]+secondOpperand+"=", width/2, height/2);
     // <120 + <120 - 3
   break;
   
   case 6:
   dNum = difficultNumber();
     switch(opperation){
      case 0:
       answer = firstOpperand * secondOpperand + dNum;
       text(firstOpperand+ops[2]+secondOpperand+ops[0]+dNum+"=", width/2, height/2);
       break;
      default:
       answer = firstOpperand * secondOpperand - dNum;
       text(firstOpperand+ops[2]+secondOpperand+ops[1]+dNum+"=", width/2, height/2);
     }
     // <50 + <50 = ?
   break;
   
   case 7:
     answer = firstOpperand / secondOpperand;
     text(firstOpperand+ops[3]+secondOpperand+"=", width/2, height/2);
     // <120 + <120 - 3
   break;
   
   case 8:
     dNum = difficultNumber();
     switch(opperation){
      case 0:
       answer = firstOpperand / secondOpperand + dNum;
       text(firstOpperand+ops[3]+secondOpperand+ops[0]+dNum+"=", width/2, height/2);
       break;
      default:
       answer = firstOpperand / secondOpperand - dNum;
       text(firstOpperand+ops[3]+secondOpperand+ops[1]+dNum+"=", width/2, height/2);
     }
   break;
     
   case 9:
     dNum = difficultNumber();
     switch(opperation){
      case 0:
       answer = firstOpperand / secondOpperand + dNum;
       text(firstOpperand+ops[3]+secondOpperand+ops[0]+dNum+"=", width/2, height/2);
       break;
      default:
       answer = firstOpperand / secondOpperand - dNum;
       text(firstOpperand+ops[3]+secondOpperand+ops[1]+dNum+"=", width/2, height/2);
     }
   break;
  }
  //TODO:Generate Answer
  int answerFormat = (int) Math.floor(Math.random()*4);
      switch(answerFormat){
      case 0:
        answerChoiceA = answer;
        answerChoiceB = (int) Math.floor(answer*((1-Math.random())/2));
        answerChoiceC = answer + 10;
        answerChoiceD = 42;
      break;
      case 1:
        answerChoiceA = (int) Math.floor(answer*((1+Math.random())/2));
        answerChoiceB = answer;
        answerChoiceC = answer - 10;
        do {
        answerChoiceD = (int) Math.floor(answer*((1-Math.random())/2));
        } while(answerChoiceD == answerChoiceA);
      break;
      case 2:
        answerChoiceA = answer + 10;
        answerChoiceB = (int) Math.floor(answer*((1-Math.random())/2));
        answerChoiceC = answer;
        answerChoiceD = (int) Math.floor(answer*((1+Math.random())/2));
      break;
      default:
        answerChoiceA = (int) Math.floor(answer*((1+Math.random())/2));
        do {
        answerChoiceB = (int) Math.floor(answer*((1+Math.random())/2));
        }while(answerChoiceB == answerChoiceA);
        answerChoiceC = (int) Math.floor(answer*((1-Math.random())/2));
        answerChoiceD = answer;
      break;
      }
}
