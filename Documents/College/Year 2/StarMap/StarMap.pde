/*
  Labtest 1
  Ronan Connolly
  c15737505

  I had a lot of trouble getting GIT to work so I dont have many pushes. 
*/

ArrayList<Star> stars = new ArrayList<Star>();

Table table;
int rowCount;
int border;
float gridWidth;
float gridHeight;
float maxStarX;
float maxStarY;

//used to store coords of stars that are clicked
float star1X;
float star1Y;  
float star2X;
float star2Y;

int value;

void setup()
{
  size(800,800);
  
  table = loadTable("HabHYG15ly.csv", "header");
  rowCount = table.getRowCount();
  border = 50;
  
  
  gridWidth = (width - (border * 2));
  gridHeight = (height - (border * 2));
  loadData();
  
  
}//end setup()

void draw()
{
  background(0);
  printStars();
  drawStars();
  
  drawGrid();
  //is hidden by the grid;
  clickStar();
  
  
  
}//end draw()

void loadData()
{
    
    for(TableRow row : table.rows())
    {
        Star s = new Star(row);
        
        stars.add(s);
      
    }
   
  
}//end loadData()

void printStars()
{
  /*
    for(int i = 0; i < stars.size();i++)
    {
        println("Habital: " + stars.get(i).hab);
        println("Name: " + stars.get(i).name);
        println("Distance: " + stars.get(i).distance);
        println("Habital: " + stars.get(i).hab);
        println("Size: " + stars.get(i).size);
    }
    */

     for(int i = 0; i < stars.size();i++)
    {
        println(stars.get(i));
    }
  
}//end prinStars()

void drawGrid()
{
  float x = border;
  float y =  height - border;
  
  float textX = border;
  float textY = border;
  
  int rect_size = 50;
  
  int count = -5;
  
  
  for(int i = border; i < width - border; i += rect_size)
  {
     
     for( int j = border; j < height - border; j += rect_size)
     {
       
       stroke(216,191,216);
       strokeWeight(0);
       noFill();
       rect(i,j, rect_size, rect_size);
       
       
     }
    
  }
  
  //print values
  for(int i = 0; i < gridWidth; i++)
  {
    fill(255);
    text(count, textX, textY - 5);
    textX = textX + rect_size;
    count++;
  }
  
  count = -5;
  
  for(int i = 0; i < gridHeight; i++)
  {
    fill(255);
    text(count, textX - 5, textY);
    textY = textY + rect_size;
  }
  
 
  
}//end drawGrind()

void drawStars()
{
  int crossWidth = 4;
  
  for(int i = 0; i < stars.size();i++)
  {
    
    fill(255);
    
    float mappedX = map(stars.get(i).x, -5, maxStarX, border, width - border);
    float mappedY = map(stars.get(i).y, -5, maxStarY, border, height - border);
    
    //uncomment to see star positions
    //strokeWeight(5);
    //point(mappedX, mappedY);
    
    //draw crosses
    line(mappedX - crossWidth, mappedY, mappedX + crossWidth, mappedY);
    line(mappedX, mappedY - crossWidth, mappedX, mappedY + crossWidth);
    
    //print cirlce
    noFill();
    ellipse(mappedX, mappedY, stars.get(i).size,stars.get(i).size);
    textAlign(CENTER);
    text(stars.get(i).name, mappedX + 10, mappedY + 20);
  }
  
}

void findMax()
{
  //find max X
  maxStarX = stars.get(0).x;
   for(int i = 0; i < stars.size();i++)
  {
    if(stars.get(i).x > maxStarX)
    {
      maxStarX = stars.get(i).x;
      
    }
    
  }
  
  //find max Y

  maxStarY = stars.get(0).y;
  for(int i = 0; i < stars.size();i++)
  {
    if(stars.get(i).y > maxStarY)
    {
      maxStarY = stars.get(i).y;
      
    }
    
  }
  
}//end max


void clickStar()
{
   //to do
   //rushed and ran out of time, not quite working
   //very messy from here on
   
  
   
   
  for(int i = 0; i < stars.size();i++)
  {
    float mappedX = map(stars.get(i).x, -5, maxStarX, border, width - border);
    float mappedY = map(stars.get(i).y, -5, maxStarY, border, height - border);
    
    
    if((mouseX == mappedX) || (mouseY == mappedY) || (mouseX == mappedX - 10) || (mouseY == mappedY - 10))
    {
      fill(0);
      strokeWeight(3);
      
      star1X = stars.get(i).x;
      star1Y = stars.get(i).y;
      
      star2X = stars.get(i).x;
      line(border, border, stars.get(i).x, stars.get(i).y);
      
    }
    
  }
  
  
}

void mousePressed() {
  if (value == 0) {
    //star1X = 255;
  } else {
    value = 0;
  }
}