//Justin Comins && Mitchell Karchemsky
GameSpace p1;
GameSpace p2;
color bg;

void setup(){
  rectMode(CORNERS);
  bg = #B0B0B0;
  p1 = new GameSpace(1);
  p2 = new GameSpace(2);
  size(1024, 512);
  fill(0, 0, 0);
  background(bg);
  line(width/2,0,width/2,height);
  noStroke();
  p1.nextLevel();
  p2.nextLevel();
}

void draw(){
  runGame();
}

void runGame(){
  p1.genEquation();
  p1.genAnswers();
  p2.genEquation();
  p2.genAnswers();
  if(p1.checkAnswer()||mousePressed){
    p1.nextLevel();
  }
  if(p2.checkAnswer()){
    p2.nextLevel();
  }
}

class GameSpace{
  
  boolean changeQFill = false;
  boolean changeAFill = false;
  color answerFill    = color(0,0,0);
  color questionFill  = color(0,0,0);
  public int i = 0;
  public int player;
  int answer        = 0;
  int answerChoiceA = 0;
  int answerChoiceB = 0;
  int answerChoiceC = 0;
  int answerChoiceD = 0;
  int firstOpperand = 0;
  int secondOpperand= 0;
  int dNum          = 0;
  String[] ops      = {"+","-","*","/"};
  int opperation    = 0;
  
  GameSpace(int p){
    player = p;
  }
  
  boolean checkAnswer(){
    
    return false;
  }
  
  void genAnswers(){
    if(i>5){
      text("Please insert an earbud.",(player*2-1)*width/4 ,height/13);
    }
    if(i>3&&changeAFill){
      answerFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
      fill(answerFill);
    }
    text(answerChoiceA, ((player*4)-3)*width/9, height*12/13);
    if(i>6&&changeAFill){
      answerFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
      fill(answerFill);
    }
    text(answerChoiceB, ((player*4)-2)*width/9, height*12/13);
    if(i>6&&changeAFill){
      answerFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
      fill(answerFill);
    }
    text(answerChoiceC, ((player*4)-1)*width/9, height*12/13);
    if(i>6&&changeAFill){
      answerFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
      fill(answerFill);
    }
    text(answerChoiceD, ((player*4)-0)*width/9, height*12/13);
    changeAFill = false;
    fill(0,0,0);
  }
  
  void nextLevel(){
    fill(bg);
    rect(width*(player-1),0,width/2,height);
    fill(0,0,0);
    stroke(0,0,0);
    line(width/2,0,width/2,height);
    noStroke();
    println("i: "+i);
    if(i<10){
      makeMaths();
      makeAnswers();
    }
    else if(i==10){
      text("PLAYER "+player+" WINS!", ((player*2)-1)*width/4, height/2 - 40);
      text("THE GAME IS OVER", ((player*2)-1)*width/4, height/2);
      text("CLICK TO EXIT", ((player*2)-1)*width/4, height/2 + 40);
    } else {
      exit();
    }
    i++;
  }
  
  int difficultNumber(){
    return (int) Math.floor(20+(Math.random())*40);
  }
  
  void makeMaths(){
    //TODO:Generate problem
    textSize(32);
    textAlign(CENTER,CENTER);
    if (i < 4){
      firstOpperand  = (int) Math.floor(10+(Math.random())*i*30);
      secondOpperand = (int) Math.floor(10+(Math.random())*i*70);
    } else if (i < 7){
      firstOpperand  = (int) Math.floor(6+(Math.random()) *5*(i-4));
      secondOpperand = (int) Math.floor(14+(Math.random())*9*(i-3));
    } else {
      secondOpperand = (int) Math.floor(12+Math.random()*10*(i-6));
      firstOpperand  = ((int) Math.floor(7+Math.random()*10*(i-7)))*secondOpperand;
    }
    if(i>3){
      questionFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
      fill(questionFill);
    }
    opperation    = (int) Math.floor(Math.random()*2);
    dNum = difficultNumber();
  }
  
  void genEquation(){
    switch(i){
     case 0:
       firstOpperand  = 2;
       secondOpperand = 2;
       answer = firstOpperand + secondOpperand;
       text(firstOpperand+ops[0]+secondOpperand+"=", ((player*2)-1)*width/4, height/2);
     case 1:
       answer = firstOpperand + secondOpperand;
       text(firstOpperand+ops[0]+secondOpperand+"=", ((player*2)-1)*width/4, height/2);
       // 2 + 2 = ?
     break;
     
     case 2:
       switch(opperation){
        case 0:
         answer = firstOpperand + secondOpperand;
         text(firstOpperand+ops[0]+secondOpperand+"=", ((player*2)-1)*width/4, height/2);
         break;
        default:
         answer = firstOpperand - secondOpperand;
         text(firstOpperand+ops[1]+secondOpperand+"=", ((player*2)-1)*width/4, height/2);
       }
       // <20 + <20 = ?
     break;
     
     case 3:
       switch(opperation){
        case 0:
         answer = firstOpperand + secondOpperand + dNum;
         text(firstOpperand+ops[0]+secondOpperand+ops[0]+dNum+"=", ((player*2)-1)*width/4, height/2);
         break;
        default:
         answer = firstOpperand - secondOpperand - dNum;
         text(firstOpperand+ops[0]+secondOpperand+ops[1]+dNum+"=", ((player*2)-1)*width/4, height/2);
       }
       // <50 + <50 = ?
     break;
     
     case 4:
       answer = firstOpperand * secondOpperand;
       text(firstOpperand+ops[2]+secondOpperand+"=", ((player*2)-1)*width/4, height/2);
       // <120 + <120 - 3
     break;
     
     case 5:
       answer = firstOpperand * secondOpperand;
       text(firstOpperand+ops[2]+secondOpperand+"=", ((player*2)-1)*width/4, height/2);
       // <120 + <120 - 3
     break;
     
     case 6:
       switch(opperation){
        case 0:
         answer = firstOpperand * secondOpperand + dNum;
         text(firstOpperand+ops[2]+secondOpperand+ops[0]+dNum+"=", ((player*2)-1)*width/4, height/2);
         break;
        default:
         answer = firstOpperand * secondOpperand - dNum;
         text(firstOpperand+ops[2]+secondOpperand+ops[1]+dNum+"=", ((player*2)-1)*width/4, height/2);
       }
       // <50 + <50 = ?
     break;
     
     case 7:
       answer = firstOpperand / secondOpperand;
       text(firstOpperand+ops[3]+secondOpperand+"=", ((player*2)-1)*width/4, height/2);
       // <120 + <120 - 3
     break;
     
     case 8:
       switch(opperation){
        case 0:
         answer = firstOpperand / secondOpperand + dNum;
         text(firstOpperand+ops[3]+secondOpperand+ops[0]+dNum+"=", ((player*2)-1)*width/4, height/2);
         break;
        default:
         answer = firstOpperand / secondOpperand - dNum;
         text(firstOpperand+ops[3]+secondOpperand+ops[1]+dNum+"=", ((player*2)-1)*width/4, height/2);
       }
     break;
       
     case 9:
       switch(opperation){
        case 0:
         answer = firstOpperand / secondOpperand + dNum;
         text(firstOpperand+ops[3]+secondOpperand+ops[0]+dNum+"=", ((player*2)-1)*width/4, height/2);
         break;
        default:
         answer = firstOpperand / secondOpperand - dNum;
         text(firstOpperand+ops[3]+secondOpperand+ops[1]+dNum+"=", ((player*2)-1)*width/4, height/2);
       }
     break;
    }
  }
    
  void makeAnswers(){
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
}
