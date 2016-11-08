class Star
{
    int hab;
    String name;
    float distance;
    float x, y, z;
    float size;
    
    Star(TableRow row)
    {
        hab = row.getInt("Hab?");
        name = row.getString("Display Name");
        distance = row.getFloat("Distance");
        x = row.getFloat("Xg");
        y = row.getFloat("Yg");
        z = row.getFloat("Zg");
        size = row.getFloat("AbsMag");
    }
    
    public String toString()
    {
       return hab + "," + name + "," + distance + "," + x + "-" + y + "-" + z + " " + size; 
      
    }
    
}