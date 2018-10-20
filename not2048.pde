int[][] board = new int[4][4];
int boxCount;
int tempInt;
int save;
int thing;
int score;
boolean moved;
void setup() {
  size(500,400);
  background(255);
  boxCount=2;
  score=0;
  for (int i=0;i<2;i++) { //Generate the coordenants of two random starting values
    int tempX=int(random(0,4));
    int tempY=int(random(0,4));
    while (board[tempX][tempY]>2) { //Make sure they don't overlap
      tempX=int(random(0,4));
      tempY=int(random(0,4)); 
    }
    board[tempX][tempY]=int(random(0,2))*2+2; //Add those values to board at the generated coordenants
  }
}

void draw() {
  background(255);
  int counter=0;
  for (int x=0;x<4;x++) { //Constantly draw the boxes at all the positions in board
    line((x+1)*100,0,(x+1)*100,400); 
    line(0,(x+1)*100,400,(x+1)*100);
    for (int y=0;y<4;y++) {
      if (board[x][y]>0) {
        counter++;
        drawBox(x,y,board[x][y]);
      }
    }
  }
  text("Score",410,50); //Display the score
  text(score,420,100);
  if (counter>=16) { //See if all the positions are full, if they are, the game ends.
    background(255);
    line(400,0,400,400);
    text("Score",410,50);
    text(score,420,100);
    text("GAME OVER",100,200);
  }
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) {
      makeOrder(1,-1);
    }
    else if (keyCode==DOWN) {
      makeOrder(1,1);
    }
    else if (keyCode==LEFT) {
      makeOrder(0,-1);
    }
    else if (keyCode==RIGHT) { 
      makeOrder(0,1);
    }
  }
}

void makeOrder(int axis, int dir) {
  moved=false;
  if (axis==0) {
    for (int x=0;x<4;x++) { //This is the heart of the code. It's also the most messy part. This for loop is just for the right/left movement. 
      for (int y=0;y<4;y++) { //It goes through board and moves each piece as far as it can go
        if (dir<0) { 
          if (x!=0) {
            save=x; //I use a clone of x, save, so that I can alter it without messing up the loop
            while (save !=0 && board[save][y]>0 && board[save+dir][y]<2) { //This is the moving part
              tempInt=board[save][y];
              board[save][y]=0;
              board[save+dir][y]=tempInt; 
              save+=dir;
              moved=true;
            }
            if (save !=0 && board[save][y]==board[save+dir][y]) { //This checks to see if they can merge, and if they can, then it does.
              board[save+dir][y]=board[save+dir][y]+board[save][y];
              score=score+board[save+dir][y];
              board[save][y]=0;
              moved=true;
}}}
        else if (dir>0) { //Most of this is the same as above, and I know that it's redundant, but getting it working was my top priority. 
          if (x!=0) {
            save=3-x;
            while (save!=3 && board[save][y]>0 && board[save+dir][y]<2) { 
              tempInt=board[save][y];
              board[save][y]=0;
              board[save+dir][y]=tempInt;
              save+=dir;
              moved=true;
            }
            if (save !=3 && board[save][y]==board[save+dir][y]) {
              board[save+dir][y]=board[save+dir][y]+board[save][y];
              score=score+board[save+dir][y];
              board[save][y]=0;
              moved=true;
}}}}}}
  else if (axis==1) { //This is even more reundant. This is the up/down movement, so it has to move along the y axis instead. 
    for (int y=0;y<4;y++) {
      for (int x=0;x<4;x++) {       
          if (y!=0) {
            if (dir<0) {
              save=y;     
              while (save !=0 && board[x][save]>0 && board[x][save+dir]<2) { 
                tempInt=board[x][save];
                board[x][save]=0;
                board[x][save+dir]=tempInt;
                save+=dir;
                moved=true;
              }
              if (save !=0 && board[x][save]==board[x][save+dir]) {
                board[x][save+dir]=board[x][save+dir]+board[x][save];
                score=score+board[x][save+dir];
                board[x][save]=0;
                moved=true;
}}
            else if (dir>0) {
              save=3-y;     
              while (save !=3 && board[x][save]>0 && board[x][save+dir]<2) { 
                tempInt=board[x][save];
                board[x][save]=0;
                board[x][save+dir]=tempInt;
                save+=dir;
                moved=true;
              }
              if (save !=3 && board[x][save]==board[x][save+dir]) {
                board[x][save+dir]=board[x][save+dir]+board[x][save];
                score=score+board[x][save+dir];
                board[x][save]=0;
                moved=true;
}}}}}}
  if (moved) { //If a box has been moved, then generate another somewhere else
    int tempX=int(random(0,4));
    int tempY=int(random(0,4));
    while (board[tempX][tempY]>2) {  //Make sure that it's generated in a free spot
      tempX=int(random(0,4));
      tempY=int(random(0,4)); 
    }
    board[tempX][tempY]=int(random(0,2))*2+2; //Update the board with the coordenants of the new box
  }
}
void drawBox(int x,int y,int num) { //The function I made to actually draw the boxes
    x=x*100;
    y=y*100;
    textSize(32); 
    if (num==2) { //Different boxes = different colors
      fill(238,288,218);
    }
    else if (num==4) {
      fill(237,224,200);
    }
    else if (num==8) {
      fill(242,177,121);
    }
    else if (num==16) {
      fill(245,149,99);
    }
    else if (num==32) {
      fill(246,124,95);
    }
    else if (num==64) {
      fill(246,94,59);
    }
    else if (num==128) {
      fill(237,207,114);
    }
    else if (num==256) {
      fill(237,204,97);
    }
    else if (num==512) {
      fill(237,200,80);
    }
    else if (num==1024) {
      fill(237,197,63);
    }
    else if (num==2048) { //If you get to 204, you win
      fill(237,194,46);
      win();
    }
    rect(x,y,100,100);
    fill(0);
    text(num, x+40, y+60);
}
void win() { //If you win, you win. 
  while (true) {
    background(255);
    text("YOU WIN!",100,200);
    line(400,0,400,400);
    text("Score",410,50);
    text(score,420,100);
  }
}
