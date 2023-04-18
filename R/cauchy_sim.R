sample_cauchy <- function(n) {
	s <- rnorm(n, 0, 1)/rnorm(n, 0, 1)
	c(samples = n, median = median(s), mean = mean(s), sd = sd(s), variance = var(s))
}
samples <- vapply(c(10, 100, 1000, 100000, 10000000), sample_cauchy, numeric(5))
samples
