void setup(){
  
}

void draw(){
  
}

void makeMaths(int level){
  //TODO:Generate problem
  String[] ops = {"+","-","*","/"};
  int difficulty = level*level*10;
  int firstOpperand   = Math.Floor((Math.Random()*.3+.7)*difficulty);
  int secondOpperand  = Math.Floor((Math.Random()*.3+.7)*difficulty);
  int answer = 0;
  switch(level){
   case 0:
     firstOpperand = 2;
     secondOpperand= 2;
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
       answer = firstOpperand + secondOpperand + Math.Floor((Math.Random()*.3+.7)*difficulty); 
       break;
      default:
       answer = firstOpperand - secondOpperand - Math.Floor((Math.Random()*.3+.7)*difficulty);
     }
     // <50 + <50 = ?
   break;
   
   case 4:
     answer = firstOpperand * secondOpperand;
     // <120 + <120 - 3
   break;
   
  }
  //TODO:Generate Answer
}
