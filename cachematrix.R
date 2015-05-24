## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
##Assignment 2 Lexical Scoping
#1. Set the value of the vector
#2. Get the value of the vector
#3. Set the value of the mean
#4. Get the value of the mean
##Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix 
##rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). 
##Your assignment is to write a pair of functions that cache the inverse of a matrix.

##Write the following functions:
  
  ##makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
  ##cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
  ##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
  ##Computing the inverse of a square matrix can be done with the solve function in R. 
  ##For example, if X is a square invertible matrix, then solve(X) returns its inverse.

##For this assignment, assume that the matrix supplied is always invertible.

makeCacheMatrix <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve) ##return vector type list of functions
}



cachesolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}

