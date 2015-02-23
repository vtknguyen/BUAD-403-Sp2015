# This is our introductory R code file, where we implemented our first R functions.

add.4 <- function(a, b, c, d) {a + b + c + d}


# Sum range recursive formulation
srr <- function(from, to) {
	if(from == to) { return(from) }
	return(srr(from, to - 1) + to)
}

# Sum range iterative formulation
sum.range <- function(min.val, max.val) {
	curr.pos <- min.val
	running.total <- 0
	while(curr.pos <= max.val) {
		running.total <- running.total + curr.pos
		curr.pos <- curr.pos + 1
	}	
	running.total
}

quadratic <- function(a, b,d) {
	x<-c((-1*b)+(sqrt (b^2)-(4*a*d))/(2*a),(-1*b)-(sqrt (b^2)-(4*a*d))/(2*a))
	x
}

# Compute the sum of squares for numbers in nums.
# Input: nums is a vector of numbers
# Output: the sum of squares
sum.squares <- function(nums) {
	running.total <- 0
	for(num in nums) { running.total <- running.total + (num * num) }
	return(running.total)
}

nths <- function(vec, n) {
	return(vec[seq(n, length(vec), by = n)])
}

# Aggregate sums of consecutive numbers, n at a time.
n.agg <- function(vec, n) {
	in.i <- 1
	out.i <- 1
	out.vec <- c()
	while(in.i <= length(vec)) {
		last <- min((in.i + n - 1), length(vec))
		curr.sum <- sum(vec[in.i:last])
		out.vec[out.i] <- curr.sum
		in.i <- in.i + n
		out.i <- out.i + 1
	}
	out.vec
}


