void setup(){
  
}

void draw(){
  
}

void makeMaths(int level){
  //TODO:Generate problem
  String[] ops = {"+","-","*","/"};
  int difficulty     = Math.Floor(level/3 + level%3);
  int firstOpperand  = Math.Floor(difficulty*5/2+(Math.Random())*difficulty*10);
  int secondOpperand = Math.Floor(difficulty*5/2+(Math.Random())*difficulty*10);
  int answer = 0;
  int answerChoiceA = 0;
  int answerChoiceB = 0;
  int answerChoiceC = 0;
  int answerChoiceD = 0;
  switch(level){
   case 0:
     firstOpperand  = 2;
     secondOpperand = 2;
     answer = firstOpperand + secondOpperand;
   case 1:
     answer = firstOpperand + secondOpperand;
     // 2 + 2 = ?
   break;
   
   case 2:
     int opperation = Math.Floor(Math.Random()*2)
     switch(opperation){
      case 0:
       answer = firstOpperand + secondOpperand;
       break;
      default:
       answer = firstOpperand - secondOpperand;
     }
     // <20 + <20 = ?
   break;
   
   case 3:
     int opperation = Math.Floor(Math.Random()*2)
     switch(opperation){
      case 0:
       answer = firstOpperand + secondOpperand + Math.Floor(difficulty*5/2+(Math.Random())*difficulty*10);
       break;
      default:
       answer = firstOpperand - secondOpperand - Math.Floor(difficulty*5/2+(Math.Random())*difficulty*10);
     }
     // <50 + <50 = ?
   break;
   
   case 4:
     answer = firstOpperand * secondOpperand;
     // <120 + <120 - 3
   break;
   
  }
  //TODO:Generate Answer
  answerFormat = Math.Floor(Math.Random()*4)
  switch(answerFormat){
   case 0:
    answerChoiceA = answer;
    answerChoiceB = answer - Math.Floor(difficulty*5/2+(Math.Random())*difficulty*5);
    answerChoiceC = answer + 10;
    answerChoiceD = 42;
   case 1:
    answerChoiceA = answer + Math.Floor(difficulty*5/2+(Math.Random())*difficulty*5);
    answerChoiceB = answer;
    answerChoiceC = answer - 10;
    do while(answerChoiceD == answerChoiceA)
    {
      answerChoiceD = answer + Math.Floor(difficulty*5/2+(Math.Random())*difficulty*5);
    }
   case 2:
    answerChoiceA = answer + 10;
    answerChoiceB = answer - 10;
    answerChoiceC = answer;
    answerChoiceD = answer + Math.Floor(difficulty*5/2+(Math.Random())*difficulty*5);
   case 3:
    answerChoiceA = answer + Math.Floor(difficulty*5/2+(Math.Random())*difficulty*5);
    do while(answerChoiceB == answerChoiceA)
    {
      answerChoiceB = answer + Math.Floor(difficulty*5/2+(Math.Random())*difficulty*5);
    }
    answerChoiceC = answer - Math.Floor(difficulty*5/2+(Math.Random())*difficulty*5);
    answerChoiceD = answer;
  }
}
