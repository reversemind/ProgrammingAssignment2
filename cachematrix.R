## Put comments here that give an overall description of what your
## functions do


##
# Make a cache for matrix
#  
# x - is a square invertible matrix
#
# return:
#  list(
#     setMatrix               -
#     getMatrix               -
#     setCachedInverseMatrix  - set inverse matrix
#     getCachedInverseMatrix  - 
#   )
#
#
makeCacheMatrix <- function(x = matrix()) {
  cacheMatrix <- NULL
  
  setMatrix <- function(y) {
    x <<- y
    inverseMatrix <<- NULL
  }
  getMatrix <- function() x
  
  setMatrixToCache <- function(value) cacheMatrix <<- value
  getMatrixFromCache <- function() cacheMatrix
  
  list(setMatrix = setMatrix, 
       getMatrix = getMatrix,
       setMatrixToCache = setMatrixToCache,
       getMatrixFromCache = getMatrixFromCache)
}


##
# Get an inverse matrix
# 
# m - is result of makeCacheMatrix function
# 
# return: 
#       a matrix that is the inverse of 'm'
#
cacheSolve <- function(m, ...) {
  
  cachedMatrix <- m$getMatrixFromCache()
  
  # if cache is exist - just return it
  if(!is.null(cachedMatrix)) {
    message("getting cached data")
    return(cachedMatrix)
  }
  
  # if cache is empty - find inverse matrix return it and put in cache
  data <- m$getMatrix()
  inverseMatrix <- solve(data, ...)
  
  # put in cache - inverseMatrix for further using
  m$setMatrixToCache(inverseMatrix)
  
  inverseMatrix
}
