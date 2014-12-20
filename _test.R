##
# Load functions
#
source("cachematrix.R")


originMatrix <- matrix(1:4,2,2)

matrixWithCaching <- makeCacheMatrix(originMatrix)
inverseMatrix <- cacheSolve(matrixWithCaching)

# this function call should use a cache
inverseMatrix2 <- cacheSolve(matrixWithCaching)



# What about time measurement?








##
# Other way to get an inverse matrix
#
# make inverse matrix
library(MASS)


matX = rbind(c(1, 2), c(3, 4))
matX
class(matX)


inv <- ginv(matX)
inv %*% matX

inv
matX %*% matX




