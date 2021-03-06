## makeCacheMatrix: This function creates a special "matrix" object that can
# cache its inverse. 

## cacheSolve: This function computes the inverse of the
# special "matrix" returned by makeCacheMatrix above. If the inverse has already
# been calculated (and the matrix has not changed), then the cachesolve should
# retrieve the inverse from the cache. ## Write a short comment describing this
# function

# Creates a mutable matrix object where the matrix itself and it's inverse can
# be easily retrieved.
makeCacheMatrix <- function( x = matrix() ) 
  {
  m <- NULL
  
  set <- function(y) 
  {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  
  setinverse <- function(inverse)  m <<- inverse
  
  getinverse <- function() m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Return a matrix that is the inverse of 'x'. Computes matrix with solve(x) function
# if inverse matrix can't be already found in the cache.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  
  if(!is.null(m)) 
  {
    message("getting cached data")
    
    return(m)
  }
  
  data <- x$get()
  
  m <- solve(data, ...)
  
  x$setinverse(m)
  
  m
}
