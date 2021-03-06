## Put comments here that give an overall description of what your
## functions do

# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then cacheSolve should retrieve the inverse from the cache.


## Write a short comment describing this function

# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    invmat <- NULL
    set <- function(y){
        x <<- y
        invmat <<- NULL
    }
    get <- function() x
    setinv <- function(inv) invmat <<- inv
    getinv <- function() invmat
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function

# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    invmat <- x$getinv()
    
    if(!is.null(invmat)){
        message("getting cached inverse matrix")
        return(invmat)
    }
    data <- x$get()
    invmat <- solve(data,...)
    x$setinv(invmat)
    invmat
}
