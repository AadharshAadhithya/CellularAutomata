class Pixel{
// Pixel is a square in the screen.
// Pixel has a specific size,state
float size;
float state;
float xpos;
float ypos;
float zpos;
float neighnum;





Pixel(float x , float y , float s){
this.xpos = x;
this.ypos =y;
this.state = 0;
this.size = s;
this.zpos =0;
this.neighnum=0;


}

Pixel(float x , float y ,float z, float s){
this.xpos = x;
this.ypos =y;
this.state = 0;
this.size = s;
this.zpos =z;
this.neighnum=0;


}
void setState(int stte){

this.state=stte;
}



void show(){
stroke(0);
strokeWeight(0);
if(this.state == 1){
fill(0,255,0);
}
if(this.state ==0){
noFill();
}

pushMatrix();
translate(xpos,ypos,zpos);
box(size);
popMatrix();


}



}
