import peasy.PeasyCam;
PeasyCam cam;

//We need a Space for the cellular automata to interact with
SquareGrid g;

//We need the CA system itself , and associated ruleset
CA ca;

//We need the initial condition
int[][] init;


int a[][][];
void setup(){
   cam = new PeasyCam(this,1000);
   //Set size,Renderer
   size(600,600,P3D);
   //Initialise the space
   g  = new SquareGrid(30,30,30);

   
   
   //Initialise CA object
   int[] ruleset = {1,0,0,0,0,0,1,0,1};
   ca = new CA(g,ruleset);

   
   //Initialise the initial state
   init = new int[30][30];
   init[14][14] = 1;

   
   
   //generate
  a = ca.generate(init,30);




}


void draw(){
translate(-width/2,-height/2);
lights();
background(0);

//Let the CA system Talk to the space

g.arraytoGrid(a);


//Draw the Space
g.show();



}
