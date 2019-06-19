int ballWidth;
int paddleWidth;
int paddleHeight;

float paddleRightX;
float paddleRightY;
float paddleLeftX;
float paddleLeftY;

float ballX;
float ballY;

float ballSpeedX;
float ballSpeedY;
float paddleSpeed;

int right_Score=0;
int left_Score=0;

String right_Score_String="";
String left_Score_String="";





void setup() {

  size(700, 500);
  // fill all variables
  ballWidth = 10;
  paddleWidth=10;
  paddleHeight=100;
  paddleLeftX=paddleWidth;
  paddleLeftY=height/2;
  paddleRightX=width-paddleWidth;
  paddleRightY=height/2;
  ballSpeedX=6;
  ballSpeedY=6;
  paddleSpeed=20;

  ballX=width/2;
  ballY=height/2;

  rectMode(CENTER);
}

void draw() {

  background(0);
  frameRate(60);

  // draw line 
  stroke(175);
  strokeWeight(3);
  line(width/2, 0, width/2, height);


  // draw paddles
  drawPaddle(paddleRightX, paddleRightY, paddleWidth, paddleHeight);
  drawPaddle(paddleLeftX, paddleLeftY, paddleWidth, paddleHeight);

  //draw ball and move ball 
  drawBall();
  moveBall();

  // score
  right_Score_String=""+right_Score;
  PFont font_right;
  font_right=loadFont("AgencyFB-Reg-48.vlw");
  textFont(font_right);
  text(right_Score_String, 700, 40, 100, 75);

  left_Score_String=""+left_Score;
  PFont font_left;
  font_left=loadFont("AgencyFB-Reg-48.vlw");
  textFont(font_left);
  text(left_Score_String, 90, 40, 100, 75);
}


// function to draw ball
void drawBall() {
  fill(12, 201, 196);
  noStroke();
  ellipse(ballX, ballY, ballWidth, ballWidth);
}

// move the ball
void moveBall() {

  // when it hits the top or bottom bounce back
  if (ballY-ballWidth/2<0 || ballY+ballWidth/2>height) {
    ballSpeedY *=-1;
  }
  ballY=ballY-ballSpeedY;


  // when it hits the edge bounce back
  if (ballX + ballWidth/2 >width-ballWidth/2) {
    ballSpeedX *= -1;
    left_Score=left_Score+1;
    ballX=width/2;
    ballY=height/2;//ballX go back to with/2
  }
  if (ballX - ballWidth/2  < 0+ballWidth/2)
  {
    ballSpeedX *= -1;
    right_Score=right_Score+1;
    ballX=width/2;
    ballY=height/2;//ballX go back to with/2
  }
  ballX=ballX-ballSpeedX;


  // when the circle hits the paddles
  if (ballX+ballWidth/2==paddleRightX-paddleWidth/2
    && ballY+ballWidth/2<=paddleRightY+paddleHeight/2
    && ballY-ballWidth/2>=paddleRightY-paddleHeight/2)
  { 
    ballSpeedX *=-1;
    println("right");//test the paddle is work or not
  }
  if (ballX-ballWidth/2==paddleLeftX+paddleWidth/2
    && ballY+ballWidth/2<=paddleLeftY+paddleHeight/2
    && ballY-ballWidth/2>=paddleLeftY-paddleHeight/2)
  { 
    ballSpeedX *=-1;
    println("left");//test the paddle is work or not
  }
}


// function draw paddles
void drawPaddle(float x, float y, float w, float h) {
  fill(14, 201, 12);
  stroke(175);
  rect(x, y, w, h);
}

void keyPressed() {

  // use if statements to move two paddles up or dowm

  if (keyPressed) {
    if (key=='w') {
      paddleLeftY=paddleLeftY-paddleSpeed;
      if (paddleLeftY<=paddleHeight/2) {
        paddleLeftY=paddleHeight/2;
      }
    }
  }
  if (key=='s') {
    paddleLeftY=paddleLeftY+paddleSpeed;
    if (paddleLeftY>=height-paddleHeight/2) {
      paddleLeftY=height-paddleHeight/2;
    }
  }
  if (key=='o') {
    paddleRightY=paddleRightY-paddleSpeed;
    if (paddleRightY<=paddleHeight/2) {
      paddleRightY=paddleHeight/2;
    }
  }
  if (key=='k') {
    paddleRightY=paddleRightY+paddleSpeed;
    if (paddleRightY>=height-paddleHeight/2) {
      paddleRightY=height-paddleHeight/2;
    }
  }
}

