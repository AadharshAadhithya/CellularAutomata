

class CA{
  /*
  CA(space,ruleset)
  Space
  is a SquareGrid object in our case. can be extended to a Space object in future applications
  ruleset
  Is an one dimentional integer array. ith element in the ruleset corresponds to the transition rule in 
  case of i neighbours. ruleset[3] should tell what is the transition for the cell if the possible neighbours are 3.
  
  Possible Transitions
  0: Set cell to off
  1: Set cell to on
  -1: dont change the cell state
  
  
  CA(int rule , SquareGrid space)
  rule is the rule number in the wolfram's elementary rule set
  */

  

  


int rule; 
SquareGrid space;
int state[];
int ruleset[];
boolean customRuleSet;

CA(SquareGrid space_,int[] ruleset_){
  this.rule = -1;
  this.space = space_;
  this.ruleset = ruleset_;
  this.customRuleSet = true;
  
  
 


}


CA(int rule_,SquareGrid space_){
  this.rule = rule_;
  this.space = space_;
  this.ruleset = getWolframRuleSet();;
    this.customRuleSet = false;
  
  
 


}

int[] getWolframRuleSet(){
  int[] arr = new int[8];

String brule = "00000000".substring(0, 8-Integer.toBinaryString(this.rule).length()) + Integer.toBinaryString(this.rule);
 
 for(int i=0;i<8;i++){
 arr[7-i] =  Character.getNumericValue( brule.charAt(i));
 }
 return arr;
}

int[] step(int arr[]){
  //Goes forward one timeunit with respect to the states based on arr[]
  
  int nextGen[] = new int[arr.length];
  for(int i=0;i<(arr.length-1);i++){
    int left,middle, right;
    if(i==0 ){
       left =0;
       middle = arr[i];
       right = arr[i+1];
    
    }else if(i==arr.length-1){
      left = arr[i-1];
       middle = arr[i];
      right = arr[i+1];
      
    
    }
    
    else{
     middle = arr[i];
     left = arr[i-1];
    right = arr[i+1];
    }
    
    nextGen[i] = this.ruleset[Integer.parseInt( ( String.valueOf(left) + String.valueOf(middle) + String.valueOf(right))  ,2)];
    
    
  
  }
  
  
 
  
  
  
  

return nextGen;
}



int[][] moresNeighs(int arr[][]){
  //return an array of same dimention as arr[][] each cell in the returned array
  //contains the moores neighbours for that cell in arr[][]
  int[][] moreneighs = new int[arr.length][arr[0].length];
  int temp[][] = new int[arr.length+2][arr[0].length +2];
  
  for(int x=0;x<temp.length;x++)
    for(int y=0; y<temp.length;y++){
      
      if(x==0 || y==0 || x ==( arr.length+1) || y== (arr[0].length +1)){
      temp[x][y] = 0;
      }
      else{
        temp[x][y] = arr[x-1][y-1];  
    }
    
  

  
    }
    
       for(int x=1; x<temp.length-1;x++)
          for(int y=1; y<temp[0].length-1;y++){
         moreneighs[x-1][y-1] = temp[x][y+1] +  temp[x][y-1] + temp[x-1][y+1] + temp[x-1][y-1] + temp[x+1][y+1] + temp[x+1][y-1] + temp[x-1][y]  + temp[x+1][y];     
      }
      
    
    
    
   
  
return moreneighs;
} 


 


 int[][] step(int arr[][]){
   //Steps one timeunit based on the state of arr
   
   int[][] morenighbours = moresNeighs(arr);
   int[][] nextgen = new int[arr.length][arr[0].length];
   
   for(int x=0;x<morenighbours.length;x++)
     for(int y=0;y<morenighbours[0].length;y++){
       if(this.ruleset[morenighbours[x][y]] == -1){
           nextgen[x][y] = arr[x][y];
       } 
       else{
       nextgen[x][y] = this.ruleset[morenighbours[x][y]];
       }
     
     }
   
   
 
   
   
  
  
  return nextgen;
  }
  
  
  int[][][] step(int arr[][][]){
    /*We can Try implementing the step function for a 3 dimentional case*/
  
  return arr;
  }
  

  
  
  


int[][] generate(int[] init,int generations){
  /* Applys Step generation number of times to get a 2d array. Each row corresponds to one geneartion*/

  int[][] states = new int[init.length][generations];
  int[] steped = init;
  
  for(int y=0; y<generations; y++){
    
    for(int x=0;x<init.length;x++){
      states[x][y] = steped[x];
    
    }
    
     steped = this.step(steped);
  
  }
  
  return states;
  
  
  

  
 

}

int[][][] generate(int[][] init,int generations){
  /* Applys Step generation number of times to get a 3d array. Each 2d array in states[][][i] corresponds to one geneartion*/

  int[][][] states = new int[init.length][init[0].length][generations];
  int[][] steped = init;
  
  for(int z=0; z<generations; z++){
    
    for(int x=0;x<init.length;x++){
      for(int y=0; y<init[0].length;y++){
        
              states[x][y][z] = steped[x][y];
      
      }

    
    }
    
     steped = this.step(steped);
  
  }
  
  return states;
  
  
  

  
 

}

}
