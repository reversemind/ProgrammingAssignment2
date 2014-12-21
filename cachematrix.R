## Coursera / R Programming / Programming Assignment 2
##
## These two functions extends a usage of matrix calculations.
##
## The first function 'makeCacheMatrix()' - creates a list of functions for caching of matrix.
## The second one 'cacheSolve()' used to speed up a computation of inverse matrix.
## Function 'cacheSolve()' used a 'solve()' function to compute a inverse matrix. 


##
# Makes a cache for matrix
# 
# Creates a list of extra sub-functions, 
# to save origin matrix and save in cache a previously computed matrix
#
# parameters:
#   x - is a square invertible matrix
#
# return:
#  list(
#     setMatrix               # set origin matrix
#     getMatrix               # get origin matrix
#
#     setMatrixToCache        # put previously computed matrix to cache
#     getMatrixFromCache      # get previously computed matrix from cache
#   )
#
# usage:
#   originMatrix <- matrix(1:4,2,2)
#   matrixWithCaching <- makeCacheMatrix(originMatrix)
#
makeCacheMatrix <- function(x = matrix()) {
  # initialize cache variable
  cacheMatrix <- NULL
  
  # 
  setMatrix <- function(y) {
    x <<- y
    cacheMatrix <<- NULL
  }
  getMatrix <- function() x
  
  # caching sub-functions
  setMatrixToCache <- function(value) cacheMatrix <<- value
  getMatrixFromCache <- function() cacheMatrix
  
  # return an extra functions for matrix as a list
  list(setMatrix = setMatrix, 
       getMatrix = getMatrix,
       setMatrixToCache = setMatrixToCache,
       getMatrixFromCache = getMatrixFromCache)
}


##
# Get an inverse matrix
# 
# The first function call will cache an inverse matrix.
# Further calls of function will pull the inverse matrix from cache.
#
# parameters:
#   m - is matrix returned from makeCacheMatrix function
# 
# return: 
#   a matrix that is the inverse of 'm'
#
# usage:
#   originMatrix <- matrix(1:4,2,2)
#   matrixWithCaching <- makeCacheMatrix(originMatrix)
#
#   inverseMatrix <- cacheSolve(matrixWithCaching)    # calculate and cache an inverse matrix 
#
#   # the second call of function will use a cache
#   inverseMatrix2 <- cacheSolve(matrixWithCaching)   # message 'getting cached data' should be printed
#
cacheSolve <- function(m, ...) {
  # trying to get a previously caclulated and cached matrix
  cachedMatrix <- m$getMatrixFromCache()
  
  # if cachedMatrix is exist - just return it
  if(!is.null(cachedMatrix)) {
    message("getting cached data")
    return(cachedMatrix)
  }
  
  # cachedMatrix is empty - calculate an inverse matrix via solve()
  data <- m$getMatrix()
  inverseMatrix <- solve(data, ...)
  
  # put in cache - an inverseMatrix for further using
  m$setMatrixToCache(inverseMatrix)
  
  inverseMatrix
}

