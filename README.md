
# Functions of A*.m

1.euclideanDist (calculate eculidne distance):

      Parameters -->  (I, J)(current location), SrcDest(source, destination)
      Return --> the distance between current cell and goal’s one
      
2. validMove (check validity of moves)
        
        Parameters --> (r, c)(location’s move)
        Return --> bool

3. foundDest (check whether current cell is the desired one or not):
        
        Parameters --> (r,c) current location, SrcDest(source, destination)
	      Return -->  bool
        
4. printPath:
        
        Print parents after applying A* function        

        
4. aStarSearch:

        Parameters --> grid(playground representation), SrcDest(source, destination)
        Main Sections --> Move up, Move down, Move left, Move right.
        Main variabes --> Has main array of struct (g: cost value), (h: heuristic),(f: g+h), (parent: node’s parent) 
        Algorithm --> Firstly, check validity of the four main moves. Then, check the current cell is destination or not.
        Finally If not the destination, calculate h and f and choose the lowest f value, then move and save parent. Repeat.
