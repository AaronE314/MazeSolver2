# MazeSolver2

MazeSolver, done with the dead end filling algorithm.

Dead-end filling is an algorithm for solving mazes that fills all dead ends, leaving only the correct ways unfilled. It can be used for solving mazes on paper or with a computer program, but it is not useful to a person inside an unknown maze since this method looks at the entire maze at once. 

The method is to: 
1) find all of the dead-ends in the maze, and then 
2) "fill in" the path from each dead-end until the first junction is met. Note that some passages won't become parts of dead end passages until other dead ends are removed first.

Dead-end filling cannot accidentally "cut off" the start from the finish since each step of the process preserves the topology of the maze. Furthermore, the process won't stop "too soon" since the end result cannot contain any dead-ends. Thus if dead-end filling is done on a perfect maze (maze with no loops), then only the solution will remain. If it is done on a partially braid maze (maze with some loops), then every possible solution will remain but nothing more.
