void rects()
{
  rectMode(CENTER);
  noStroke();
  int numRects = 10;
  float gap = width / numRects;
  float colorGap = 255 / numRects;
   for(int i = numRects ; i >= 0 ; i --)
  {
    float w = i * gap;
    fill(colorGap * i, 255, 255);
    rect(width / 2, height / 2, w, w);
  }
}


void circles()
{
  noStroke();
  float gap = width / count;
  float colorGap = 255 / count;
  for(int i = count ; i >= 0 ; i --)
  {
    float w = i * gap;
    fill(colorGap * i, 255, 255);
    ellipse(width / 2, height / 2, w, w);
  }
}

void triangles()
{
  noStroke();
  float gap = width / count;
  float colorGap = 255 / count;
  float cx = width / 2;
  float cy = height / 2;
  for(int i = count ; i >= 0 ; i --)
  {
    float w = i * gap * 0.5;
    fill(colorGap * i, 255, 255);   
    triangle(cx-w, cy+w,cx, cy-w, cx+w, cy+w);     
  }
}

int count = 10;
int mode = 0;

void setup()
{
  colorMode(HSB);
  size(800, 800);
  
  hue = new int[numRows];
  x = new float[numRows];
  
  for(int i = 0 ; i < numRows ; i ++)
  {
    hue[i] = (int) random(0, 255);
    x[i] = random(0, width);
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    mode = (mode + 1) % 3;
  }
}

int numRows = 10;
int[] hue;
float[] x;

void arrays()
{
  float radius = (height / numRows) / 2;
  for(int i = 0 ; i < numRows ; i ++)
  {
    noStroke();
    fill(hue[i], 255, 255);
    float y = radius + (i * radius * 2);
    ellipse(x[i], y, radius * 2, radius * 2);
    x[i] ++;
    if (x[i] > width + radius)
    {
      x[i] = -radius;
    }
  }
}

void draw()
{
  background(0);
  if (mode == 0) {
    rects();
  }
  else if (mode == 1) {
    triangles();
  }
  else if (mode == 2) {
    arrays();
  }
}
