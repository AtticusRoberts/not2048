int[][] board = new int[4][4];
int boxCount;
int tempInt;
int save;
int thing;
boolean moved;
void setup() {
  size(400,400);
  background(255);
  boxCount=2;
  for (int i=0;i<2;i++) {
    int tempX=int(random(0,4));
    int tempY=int(random(0,4));
    while (board[tempX][tempY]>2) {
      tempX=int(random(0,4));
      tempY=int(random(0,4)); 
    }
    board[tempX][tempY]=int(random(0,2))*2+2;
  }
}

void draw() {
  background(255);
  int counter=0;
  for (int x=0;x<4;x++) {
    for (int y=0;y<4;y++) {
      if (board[x][y]>0) {
        counter++;
        drawBox(x,y,board[x][y]);
      }
    }
  }
  if (counter>=16) {
    background(255);
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
    for (int x=0;x<4;x++) {
      for (int y=0;y<4;y++) {
        if (dir<0) { 
          if (x!=0) {
            save=x;
            while (save !=0 && board[save][y]>0 && board[save+dir][y]<2) { 
              tempInt=board[save][y];
              board[save][y]=0;
              board[save+dir][y]=tempInt;
              save+=dir;
              moved=true;
            }
            if (save !=0 && board[save][y]==board[save+dir][y]) {
              board[save+dir][y]=board[save+dir][y]+board[save][y];
              board[save][y]=0;
              moved=true;
}}}
        else if (dir>0) {
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
              board[save][y]=0;
              moved=true;
}}}}}}
  else if (axis==1) {
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
                board[x][save]=0;
                moved=true;
}}}}}}
  if (moved) {
    int tempX=int(random(0,4));
    int tempY=int(random(0,4));
    while (board[tempX][tempY]>2) {
      tempX=int(random(0,4));
      tempY=int(random(0,4)); 
    }
    board[tempX][tempY]=int(random(0,2))*2+2;
  }
}
void drawBox(int x,int y,int num) {
    x=x*100;
    y=y*100;
    textSize(32); 
    if (num==2) {
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
    else if (num==2048) {
      fill(237,194,46);
      win();
    }
    rect(x,y,100,100);
    fill(0);
    text(num, x+40, y+60);
}
void win() {
  while (true) {
    background(255);
    text("YOU WIN!",100,200);
  }
}
