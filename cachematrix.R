## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Define a function to create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  # Initialize a variable to store the cached inverse
  cached_inverse <- NULL
  
  # Function to set the matrix_input and clear the cached_inverse
  setMatrix <- function(matrix) {
    x <<- matrix  # Set the matrix_input using a global assignment
    cached_inverse <<- NULL  # Clear the cached_inverse
  }
  
  # Function to compute and cache the inverse of the matrix
  cacheInverse <- function() {
    if (is.null(cached_inverse)) {
      cached_inverse <<- solve(x)  # Compute and cache the inverse
    } else {
      message("Using cached inverse")  # Display a message if the inverse is already cached
    }
    cached_inverse  # Return the cached inverse
  }
  
  # Function to get the cached inverse or display a message if it's not cached
  getCachedInverse <- function() {
    if (!is.null(cached_inverse)) {
      message("Getting cached inverse")
      return(cached_inverse)  # Return the cached inverse
    } else {
      message("Inverse is not cached. Use cacheInverse() to compute and cache it.")
      return(NULL)  # Return NULL if the inverse is not cached
    }
  }
  
  # Return a list of functions that can be used to interact with the special matrix object
  list(setMatrix = setMatrix, cacheInverse = cacheInverse, getCachedInverse = getCachedInverse)
}

## Write a short comment describing this function

# Define a function to compute the inverse of the special "matrix" object
cacheSolve <- function(x,...) {
  # Get the cached inverse using the getCachedInverse function
  cached_inverse <- x$getCachedInverse()
  if (!is.null(cached_inverse)) {
    return(cached_inverse)  # Return the cached inverse if it exists
  } else {
    message("Inverse is not cached. Use cacheInverse() to compute and cache it.")
    return(NULL)  # Display a message and return NULL if the inverse is not cached
  }
}

mat <- matrix(c(4, 2, 2, 3), nrow = 2, ncol = 2)

cacheMatrix <- makeCacheMatrix(mat)

cacheMatrix$cacheInverse()

cached_inverse <- cacheSolve(cacheMatrix)
print(cached_inverse)

cached_inverse <- cacheSolve(cacheMatrix)
print(cached_inverse)