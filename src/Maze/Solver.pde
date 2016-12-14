class Solver{
  
  Cell current;
  
  boolean tracing = false;
  boolean filling = true;
  
  Cell mazeStart;
  
  boolean solved = false;
  
  private ArrayList<Cell> Sol = new ArrayList<Cell>();
  private ArrayList<Cell> Dead = new ArrayList<Cell>();
  
  Solver(Cell start){
    mazeStart = start;
    //mazeStart.sol = true;
  }
  
  public void solve(){
    int loop = 0;
    if(filling){
      loop = 0;
      for(int i = 0; i<Dead.size(); i++){
        current = Dead.get(i);
        if(!current.start && !current.end){ 
          ArrayList<Cell> neighbors = checkWalls(current);
          if(neighbors.size() == 1){
            Cell next = neighbors.get(0);
            current.dead = true;
            Dead.set(i,next);
            loop++;
          } else {
            Dead.remove(i);
          }
        }
      }
    }
    
    if(loop == 0){
      tracing = true;
      filling = false;
      current = mazeStart;
    }
    
    if(tracing){
      TracePath();
    }
    
  
  }

  
  public void findDeadEnds(){
    for (int i = 0; i < grid.size(); i++) {
      Cell cell = grid.get(i);
      if(!cell.start && !cell.end){ 
        int walls = 0;
        for(int j = 0; j<4; j++){
          if(cell.walls[j]){
            walls++;
          }
        }
        
        if(walls == 3){
          cell.dead = true;
          Dead.add(cell);
        }
      }
    }
  }
  
  public void TracePath(){
    for(int i = 0; i<grid.size(); i++){
      if(!grid.get(i).dead){
        grid.get(i).sol=true;
      }
    }
   }

  public ArrayList<Cell> checkWalls(Cell checking){
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    
    Cell top, right, bottom, left;
    
    if(!checking.walls[0]){
      top = grid.get(index(checking.i,checking.j-1));
      if(!top.dead && !top.sol){
        neighbors.add(top);
      }
    }
    
    if(!checking.walls[1]){
      right = grid.get(index(checking.i+1,checking.j));
      if(!right.dead && !right.sol){
        neighbors.add(right);
      }
    }
    
    if(!checking.walls[2]){
      bottom = grid.get(index(checking.i,checking.j+1));
      if(!bottom.dead && !bottom.sol){
        neighbors.add(bottom);
      }
    }
    
    if(!checking.walls[3]){
      left = grid.get(index(checking.i-1,checking.j));
      if(!left.dead && !left.sol){
        neighbors.add(left);
      }
    }
    
    return neighbors;
   
  }
}