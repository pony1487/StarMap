/*
  Labtest 1
  Ronan Connolly
  c15737505

*/

ArrayList<Star> stars = new ArrayList<Star>();

Table table;
int rowCount;

void setup()
{
  size(800,800);
  
  table = loadTable("HabHYG15ly.csv", "header");
  rowCount = table.getRowCount();
  loadData();
  
  
}//end setup()

void draw()
{
  
  printStars();
  
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
  
  
}