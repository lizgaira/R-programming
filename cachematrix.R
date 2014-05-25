## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#Following the example of makeVector function, we set the value of the matrix,
#get the value of the matrix, set the value of the inverse and get the value of the inverse.
#We just have to change the class of the argument of the function (vector->matrix) and 
#put solve instead of mean.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  }


## Write a short comment describing this function
#The function's structure remains the same, but we change the mean calculation for the
#inverse calculation.

cacheSolve <- function(x=matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  }
