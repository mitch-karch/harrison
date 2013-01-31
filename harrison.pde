//Justin Comins && Mitchell Karchemsky
int i = 0;
color bg = #B0B0B0;

void setup(){
  size(512, 512);
  fill(0, 0, 0);
  background(bg);
}

void draw(){
  

}

void mousePressed(){
  background(bg);
  println("i: "+i);
  makeMaths(i);
  i++;
  if(i%6==0){
    text("GAME SHOULD RESET NOW", width/2, height/2);
    i=0;
  }
}



void makeMaths(int level){
  //TODO:Generate problem
  textSize(32);
  textAlign(CENTER,CENTER);
  String[] ops        = {"+","-","*","/"};
  int difficulty      = (int) Math.floor((level/3.0 + level%3));
  int firstOpperand   = (int) Math.floor(difficulty*5/2+(Math.random())*difficulty*10);
  int secondOpperand  = (int) Math.floor(difficulty*5/2+(Math.random())*difficulty*10);
  int answer          = 0;
  int answerChoiceA   = 0;
  int answerChoiceB   = 0;
  int answerChoiceC   = 0;
  int answerChoiceD   = 0;
  int opperation      = (int) Math.floor(Math.random()*2);
  int difficultNumber = (int)Math.floor(difficulty*5/2+(Math.random())*difficulty*10);
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
     switch(opperation){
      
      case 0:
       answer = firstOpperand + secondOpperand + difficultNumber;
       text(firstOpperand+ops[0]+secondOpperand+ops[0]+difficultNumber+"=", width/2, height/2);
       break;
      default:     
       answer = firstOpperand - secondOpperand - difficultNumber;
       text(firstOpperand+ops[0]+secondOpperand+ops[1]+difficultNumber+"=", width/2, height/2);
     }
     // <50 + <50 = ?
   break;
   
   case 4:
     answer = firstOpperand * secondOpperand;
     text(firstOpperand+ops[2]+secondOpperand+"=", width/2, height/2);
     // <120 + <120 - 3
   break;
   
  }
  //TODO:Generate Answer
  int answerFormat = (int) Math.floor(Math.random()*4);
      switch(answerFormat){
      case 0:
        answerChoiceA = answer;
        answerChoiceB = (int) (answer - Math.floor(difficulty*5/2+(Math.random())*difficulty*5));
        answerChoiceC = answer + 10;
        answerChoiceD = 42;
        break;
      case 1:
        answerChoiceA = (int) (answer + Math.floor(difficulty*5/2+(Math.random())*difficulty*5));
        answerChoiceB = answer;
        answerChoiceC = answer - 10;
        do
        {
        answerChoiceD = (int) (answer + Math.floor(difficulty*5/2+(Math.random())*difficulty*5));
        } while(answerChoiceD == answerChoiceA);
      break;
      case 2:
        answerChoiceA = answer + 10;
        answerChoiceB = answer - 10;
        answerChoiceC = answer;
        answerChoiceD = (int) (answer + Math.floor((difficulty*5/2+(Math.random())*difficulty*5)));
      break;
      case 3:
        answerChoiceA = (int) (answer + Math.floor((difficulty*5/2+(Math.random())*difficulty*5)));
        do{
        answerChoiceB = (int) (answer + Math.floor((difficulty*5/2+(Math.random())*difficulty*5)));
        }while(answerChoiceB == answerChoiceA);

        answerChoiceC =(int) (answer - Math.floor((difficulty*5/2+(Math.random())*difficulty*5)));
        answerChoiceD = answer;
      break;
      }
  
}
