//Justin Comins && Mitchell Karchemsky
import java.util.Timer;
import java.util.TimerTask;
Timer t;

GameSpace p1;
GameSpace p2;
color bg;
int input;
boolean noP1 = false;
boolean noP2 = false;
boolean gameOver = false;

void setup(){
  rectMode(CORNERS);
  textSize(32);
  textAlign(CENTER,CENTER);
  bg = #B0B0B0;
  t = new Timer();
  p1 = new GameSpace(1);
  p2 = new GameSpace(2);
  size(1024, 512);
  fill(0, 0, 0);
  background(bg);
  line(width/2,0,width/2,height);
  noStroke();
  p1.nextLevel();
  p2.nextLevel();
  t.schedule(new timeLimit(), 180000);
}

void draw(){
  if(!gameOver){runGame();}
  else{endGame();}
}

void keyPressed(){
  input = 0;
  if(key == CODED && !noP2){
    if(keyCode == UP){
      input = 1;
    }
    if(keyCode == LEFT){
      input = 2;
    }
    if(keyCode == DOWN){
      input = 3;
    }
    if(keyCode == RIGHT){
      input = 4;
    }
    if(p2.checkAnswer(input)){
      p2.nextLevel();
    }
    disableKeyPress(2);
  }
  else if (!noP1){
    if((int)key == 119){
      input = 1;
    }
    if((int)key == 97){
      input = 2;
    }
    if((int)key == 115){
      input = 3;
    }
    if((int)key == 100){
      input = 4;
    }
    if (p1.checkAnswer(input)){
      p1.nextLevel();
    }
    disableKeyPress(1);
  }
}

class timeLimit extends TimerTask{
  public void run(){
    background(bg);
    text("NEITHER PLAYER HAS WON!", width/2, height/2 - 40);
    text("THE GAME IS OVER", width/2, height/2);
    text("CLICK TO EXIT", width/2, height/2 + 40);
    endGame();
  }
}

class keyTime1 extends TimerTask{
  public void run(){
    noP1 = false;
  }
}

class keyTime2 extends TimerTask{
  public void run(){
    noP2 = false;
  }
}

void endGame(){
  gameOver = true;
  if(mousePressed){
    exit();
  }
}

void runGame(){
  p1.genEquation(-1);
  p1.genAnswers();
  p2.genEquation(-1);
  p2.genAnswers();
}

void disableKeyPress(int p){
  if(p==1){
    noP1 = true;
    t.schedule(new keyTime1(),1000);
  }
  else{
    noP2 = true;
    t.schedule(new keyTime2(),1000);
  }
}

class GameSpace{
  
  class aFillTimer extends TimerTask{
    public void run(){
      changeAFill = true;
      cancel();
    }
  }
  
  class qFillTimer extends TimerTask{
    public void run(){
      changeQFill = true;
      cancel();
    }
  }

  boolean changeQFill = false;
  boolean changeAFill = false;
  color answerFill    = color(0,0,0);
  color questionFill  = color(0,0,0);
  public int i        = 0;
  public int player;
  int answer          = 0;
  int answerChoiceA   = 0;
  int answerChoiceB   = 0;
  int answerChoiceC   = 0;
  int answerChoiceD   = 0;
  int correct         = 0;
  int firstOpperand   = 0;
  int secondOpperand  = 0;
  int dNum            = 0;
  String[] ops        = {"+","-","*","/"};
  int opperation      = 0;
  int input           = 0;
  int x               = 0;
  int y               = 0;
  
  GameSpace(int p){
    player = p;
  }
  
  boolean checkAnswer(int input){
    if(input == correct){
      return true;
    }
    return false;
  }
  
  void nextLevel(){
    if(i>9){
      background(bg);
      stroke(0,0,0);
      line(width/2,0,width/2,height);
      text("PLAYER "+player+" WINS!", ((player*2)-1)*width/4, height/2 - 40);
      text("THE GAME IS OVER", ((player*2)-1)*width/4, height/2);
      text("CLICK TO EXIT", ((player*2)-1)*width/4, height/2 + 40);
      endGame();
    }
    if(!gameOver){
      x=0;
      y=0;
      fill(bg);
      rect(width*(player-1),0,width/2,height);
      fill(0,0,0);
      stroke(0,0,0);
      line(width/2,0,width/2,height);
      noStroke();
      println("i: "+i);
      if(i<10){
        makeMaths();
        genEquation(0);
        makeAnswers();
        genAnswers();
      }
      i++;
    }
  }

  void makeMaths(){
    //TODO:Generate problem
    if (i < 1){
      firstOpperand  = 2;
      secondOpperand = 2;
    } else if (i < 4){
      firstOpperand  = (int) Math.floor(10+(Math.random())*i*30);
      secondOpperand = (int) Math.floor(10+(Math.random())*i*70);
    } else if (i < 7){
      firstOpperand  = (int) Math.floor(6+(Math.random()) *5*(i-4));
      secondOpperand = (int) Math.floor(14+(Math.random())*9*(i-3));
    } else {
      secondOpperand = (int) Math.floor(12+Math.random()*10*(i-6));
      firstOpperand  = ((int) Math.floor(7+Math.random()*10*(i-7)))*secondOpperand;
    }
    opperation    = (int) Math.floor(Math.random()*2);
    dNum          = (int) Math.floor(20+(Math.random())*40);
  }
  
  void genEquation(int offset){
    if(!gameOver){
      fill(bg);
      rect(width*(player-1),2*height/13,width/2,11*height/13);
      fill(0,0,0);
      stroke(0,0,0);
      line(width/2,0,width/2,height);
      noStroke();
      if(i>3&&changeQFill){
        questionFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
        fill(questionFill);
      }
      changeQFill = false;
      t.schedule(new qFillTimer(), 0, 4000);
      x+=Math.round((Math.random()-.5)*2*i);
      y+=Math.round((Math.random()-.5)*2*i);
      switch(i+offset){
        case 0:
         firstOpperand  = 2;
         secondOpperand = 2;
         answer = firstOpperand + secondOpperand;
         text(firstOpperand+ops[0]+secondOpperand+"=", ((player*2)-1)*width/4+x, height/2+y);
       case 1:
         answer = firstOpperand + secondOpperand;
         text(firstOpperand+ops[0]+secondOpperand+"=", ((player*2)-1)*width/4+x, height/2+y);
         // 2 + 2 = ?
       break;
       
       case 2:
         switch(opperation){
          case 0:
           answer = firstOpperand + secondOpperand;
           text(firstOpperand+ops[0]+secondOpperand+"=", ((player*2)-1)*width/4+x, height/2+y);
           break;
          default:
           answer = firstOpperand - secondOpperand;
           text(firstOpperand+ops[1]+secondOpperand+"=", ((player*2)-1)*width/4+x, height/2+y);
         }
         // <20 + <20 = ?
       break;
       
       case 3:
         switch(opperation){
          case 0:
           answer = firstOpperand + secondOpperand + dNum;
           text(firstOpperand+ops[0]+secondOpperand+ops[0]+dNum+"=", ((player*2)-1)*width/4+x, height/2+y);
           break;
          default:
           answer = firstOpperand - secondOpperand - dNum;
           text(firstOpperand+ops[1]+secondOpperand+ops[1]+dNum+"=", ((player*2)-1)*width/4+x, height/2+y);
         }
         // <50 + <50 = ?
       break;
       
       case 4:
         answer = firstOpperand * secondOpperand;
         text(firstOpperand+ops[2]+secondOpperand+"=", ((player*2)-1)*width/4+x, height/2+y);
         // <120 + <120 - 3
       break;
       
       case 5:
         answer = firstOpperand * secondOpperand;
         text(firstOpperand+ops[2]+secondOpperand+"=", ((player*2)-1)*width/4+x, height/2+y);
         // <120 + <120 - 3
       break;
       
       case 6:
         switch(opperation){
          case 0:
           answer = firstOpperand * secondOpperand + dNum;
           text(firstOpperand+ops[2]+secondOpperand+ops[0]+dNum+"=", ((player*2)-1)*width/4+x, height/2+y);
           break;
          default:
           answer = firstOpperand * secondOpperand - dNum;
           text(firstOpperand+ops[2]+secondOpperand+ops[1]+dNum+"=", ((player*2)-1)*width/4+x, height/2+y);
         }
         // <50 + <50 = ?
       break;
       
       case 7:
         answer = firstOpperand / secondOpperand;
         text(firstOpperand+ops[3]+secondOpperand+"=", ((player*2)-1)*width/4+x, height/2+y);
         // <120 + <120 - 3
       break;
       
       case 8:
         switch(opperation){
          case 0:
           answer = firstOpperand / secondOpperand + dNum;
           text(firstOpperand+ops[3]+secondOpperand+ops[0]+dNum+"=", ((player*2)-1)*width/4+x, height/2+y);
           break;
          default:
           answer = firstOpperand / secondOpperand - dNum;
           text(firstOpperand+ops[3]+secondOpperand+ops[1]+dNum+"=", ((player*2)-1)*width/4+x, height/2+y);
         }
       break;
         
       case 9:
         switch(opperation){
          case 0:
           answer = firstOpperand / secondOpperand + dNum;
           text(firstOpperand+ops[3]+secondOpperand+ops[0]+dNum+"=", ((player*2)-1)*width/4+x, height/2+y);
           break;
          default:
           answer = firstOpperand / secondOpperand - dNum;
           text(firstOpperand+ops[3]+secondOpperand+ops[1]+dNum+"=", ((player*2)-1)*width/4+x, height/2+y);
         }
       fill(0,0,0);
      }
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
        correct = 1;
      break;
      case 1:
        answerChoiceA = (int) Math.floor(answer*((1+Math.random())/2));
        answerChoiceB = answer;
        answerChoiceC = answer - 10;
        answerChoiceD = (int) Math.floor(answer*((1-Math.random())/2));
        correct = 2;
      break;
      case 2:
        answerChoiceA = answer + 10;
        answerChoiceB = (int) Math.floor(answer*((1-Math.random())/2));
        answerChoiceC = answer;
        answerChoiceD = (int) Math.floor(answer*((1+Math.random())/2));
        correct = 3;
      break;
      default:
        answerChoiceA = (int) Math.floor(answer*((1+Math.random())/2));
        answerChoiceB = (int) answer + 14;
        answerChoiceC = (int) Math.floor(answer*((1-Math.random())/2));
        answerChoiceD = answer;
        correct = 4;
      }
   }
   
   void genAnswers(){
    fill(bg);
    rect(width*(player-1),0,width/2,2*height/13);
    fill(0,0,0);
    stroke(0,0,0);
    line(width/2,0,width/2,height);
    noStroke();
    text("score: "+i, ((player*7)-1)*width/14, height/13);
    if(i>5){
      text("Please insert earbud.",(player*3-2)*width/6 ,height/13);
    }
    if(!gameOver){
      fill(bg);
      rect(width*(player-1),height,width/2,11*height/13);
      fill(0,0,0);
      stroke(0,0,0);
      line(width/2,0,width/2,height);
      noStroke();
      if(i>3&&changeAFill){
        answerFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
        fill(answerFill);
      }
      text(answerChoiceA, ((player*4)-3)*width/9, height*12/13);
      if(i>3&&changeAFill){
        answerFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
        fill(answerFill);
      }
      text(answerChoiceB, ((player*4)-2)*width/9, height*12/13);
      if(i>3&&changeAFill){
        answerFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
        fill(answerFill);
      }
      text(answerChoiceC, ((player*4)-1)*width/9, height*12/13);
      if(i>3&&changeAFill){
        answerFill=color((int)(255*Math.random()),(int)(255*Math.random()),(int)(255*Math.random()));
        fill(answerFill);
      }
      text(answerChoiceD, ((player*4)-0)*width/9, height*12/13);
      changeAFill = false;
      t.schedule(new aFillTimer(), (long) (Math.random()+3)*1000*(10-i));
      fill(0,0,0);
    }
  }
}
