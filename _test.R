##
# Load functions
#
source("cachematrix.R")


cachedM<-makeCacheMatrix(rbind(c(1, 2), c(3, 4)))
cs<-cacheSolve(cachedM)

# this function call should use a cache
cs<-cacheSolve(cachedM)



# What about time measurement








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




