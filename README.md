<!-- Statistical Inference -->

[TOC]

Slides are the same as the complete script. \
Distribution sheet on Moodle $\rightarrow$ allowed for exam.

# Introduction

## Inference

* Estimation for data and assumed underlying parameters
* Confidence Intervals
* Testing of hypothesis

## Concepts

* Classical inference
* Likelihood inference
* Bayesian inference
* (Bootstrap)

## Overview

* i.i.d. case vs. conditionally independent (regression...) vs. dependent case (longitudinal data)

# Statistical models

## One-sample case

* $X_i \overset{i.i.d.}\sim F(x) = \mathbb{P}(X \leq x)$
* Observations: $x_1, ..., x_n$
* Radon-Nikodym density <!-- TODO -->
  * Lebesgue measure, Dirac measure

## Parametric models

* $X \sim F(x|\bm{\theta}), \bm{\theta} = (\theta_1, ..., \theta_k)^T \in \Theta \subseteq \mathbb{R}^k$
* Density completely defined by the distributional assumption and $\bm{\theta}$

## Exponential family

* $f(\bm{x}|\bm{\theta}) = h(\bm{x}) \exp(b(\bm{\theta}) + \bm{\gamma}(\bm{\theta})^T \bm{T}(\bm{x}))$
* $h(\bm{x}) \geq 0$
* $\bm{T}, \bm{\gamma} \in \mathbb{R}^r$
* $\bm{T}:$ statistics
* $\bm{\gamma}:$ natural parameters
* $f$ is strictly $r$-parametric $\rightarrow$ $\bm{T} \bot \bm{\gamma}$
* The density can be factorized in a part which only depends on the data and a part which depends on the parameters

### Properties

* Have sufficient statistics
* Concave likelihood
* Have conjugate priors
* Simplified calculations of expectations

### Examples

* Simple linear exponential family
* Location scale family
  * E.g., $f_0(z) = \mathbb{I}_{(-0.5, 0.5)}(z)$
  * $a$ not necessarily the mean
  * Cauchy distribution $\rightarrow$ there the location is the median <!-- TODO What is the scale? -->
    * Simulation: $C \sim \frac{N(0, 1)}{N(0, 1)}$
* Mixture distributions, discrete mixtures

## Linear and generalized linear parametric models

### Linear model

* $y_i | \bm{x}_i \sim N(\bm{x}_i^T\bm\beta, \sigma^2)$
* Normality assumption is only necessary for confidence intervals, for $n \rightarrow \infty$, it can be dropped
* $\bm\theta = (\bm\beta, \sigma^2)$

### Generalized linear model

* $\mathbb{E}(y_i | \bm{x}_i) = h(\bm{x}_i^T\bm\beta)$

## Point estimator

* missed one lecture $\rightarrow$ page 14
* Mean squared error (MSE)
  * $\text{MSE}_\theta(\bm{T}) = \mathbb{E}_\theta[(\bm{T} - \theta)(\bm{T} - \theta)^T] = \text{COV}_\theta(\bm{T}) + \text{Bias}_\theta(\bm{T})\text{Bias}_\theta(\bm{T})^T$
  * There is a scalar and a matrix version
  * $\text{MSE}_\theta(\bm{T}) = \text{trace}(\text{COV}_\theta(\bm{T})) + ||\text{Bias}_\theta(\bm{T})||^2$
* The concept of "quality" is frequentist
* In this interpretation the quality of the method $\bm{T}$ is evaluated

## Confidence sets

* Frequentist
* $C_\alpha$

## Hypothesis testing

* Been there, done that
* $\phi : \mathcal{X} \rightarrow \{A_0, A_1\} = \{0, 1\}$
* $\phi(X) = \begin{cases}
               1 & \text{if} \; T(\bm{x}) \in C_\alpha, \\
               0 & \text{if} \; T(\bm{x}) \notin C_\alpha. \\
             \end{cases}$
* Power function
  * $g_\phi(\bm\theta) = \mathbb{P}_\theta(A_1)$
  * Level condition (reformulation): $g_\phi(\bm\theta) \leq \alpha \text{ for } \bm\theta \in \Theta_0$
  * Type II error: $1 - g_\phi(\bm\theta)$
    * Possible to calculate if both hypothesis are point hypothesis
* p-value
  * $p = \mathbb{P}(T(\bm{X}) > T(x) | \mu = \mu_0)$
* S-value an alternative

## Risk

* Minimax criterion
* Bayesian criterion \
  $\rightarrow$ Bayes optimal rule \
  $\rightarrow$ Posterior Bayes risk
  * Admissible
  * Posterior expected value is Bayes optimal with the quadratic loss function
  * Median posterior is Bayes optimal with the absolute loss function
  * Posterior mode is Bayes optimal with the 0-1 loss function $\rightarrow$ ML estimator
* Multiple imputation is Bayesian
* criterion $\rightarrow$ rule $\rightarrow$ decision

### Homework 2

```r
library(ggplot2); theme_set(theme_bw())

r1 <- function(x) 3^2 * pi^2 / 3 / 10
r2 <- function(x) 3^2 * pi^2 / 12 / 10 + (1 - x)^2 / 4

ggplot() +
  geom_function(fun = r1, color = "red") +
  geom_function(fun = r2, color = "blue") +
  xlim(-5, 5)
```

# Classical estimation theory

* Basic model
  * $\hat{\mathbb{P}} \in \mathcal{P} = \{f(\bm{x}|\bm{\theta}) : \bm{\theta} \in \Theta\}$
* Statistic
  * $\mathcal{X} \rightarrow \mathbb{R}^l$
  * $\bm{x} \mapsto \bm{T}(\bm{x})$
  * Example
    * $\bm{T}$ estimator: $l = k$
    * $T$ test: $l = 1$

## Sufficiency

* $p(\bm{x} | \bm{T}(\bm{X}) = \bm{t}, \theta) = p(\bm{x} | \bm{T}(\bm{X}) = \bm{t})$
* $\Leftrightarrow  p(\bm{x} | \bm\theta) = h(\bm{x}) g(\bm{T}(\bm{x}) | \bm\theta)$
* Was geht mit injektiv und Jacobi Matrix? <!-- TODO -->
* The order statistic is sufficient for iid data, nice example

## Minimal sufficiency

* $\bm{T}(\bm{X}) = \bm{H}(\bm{V}(\bm{X}))$
* I.e., $\bm{T}(\bm{X})$ can be calculated out of every other sufficient statistic.

## Completeness

* $\mathbb{E}_\theta(g(\bm{T})) = 0\ \forall \theta \Rightarrow \mathbb{P}_\theta(g(\bm{T}) = 0) = 1\ \forall \theta$
* Sufficiency $\wedge$ completeness $\Rightarrow$ minimum sufficiency
* Minimum sufficiency $\nRightarrow$ completeness (example 2.9)

## Bias, variance, MSE

* $\text{MSE}_\theta(\hat\theta) = \mathbb{E}_\theta((\hat\theta - \theta)^2) = \mathbb{V}_\theta(\hat\theta) + \text{Bias}(\hat\theta)^2$
* TODO implement example 2.10, Bayes estimator

```r
bayes_est <- function(x) {
  n <- length(x)
  a <- b <- sqrt(n) / 2
  (sum(x) + a) / (a + b + n)
}

# Monte Carlo
set.seed(1)
p <- 0.7
x <- replicate(5e4, rbinom(n = 1e3, size = 1, prob = p), simp = FALSE)
x_std <- sapply(x, mean)
x_bayes <- sapply(x, bayes_est)

# Visual
# plot(x_std - p, x_bayes - p)
# abline(0,1)

# MSE
mean((x_std - p)^2)
mean((x_bayes - p)^2)

# Bias
(mean(x_std) - p)^2
(mean(x_bayes) - p)^2

# Var
mean((x_std - p)^2) - (mean(x_std) - p)^2
mean((x_bayes - p)^2) - (mean(x_bayes) - p)^2
```

<!-- until p. 41 -->

## Fisher information and sufficiency

* Fisher regularity
  * Support does not depend on $\theta$.
* $\mathbb{E}(\bm{s}(\bm\theta | \bm{X})) = \bm0$
* $\mathbb{V}(\bm{s}(\bm\theta | \bm{X})) = \mathcal{I}(\bm\theta)$
* $iid$: every observation has the same information
  * $\mathcal{I}(\bm\theta) = n \cdot i(\bm\theta)$
  * $i(\bm\theta) = \mathbb{E}(-\ell''(\bm\theta | X_1)) = \mathbb{V}(\ell'(\bm\theta | X_1))$
* $\mathcal{I}_{\bm{T}}(\bm\theta) = \mathcal{I}(\bm\theta) \Leftrightarrow \bm{T} \text{ is sufficient for } \bm\theta.$
* C. R. Rao, 102 Jahre alt, still going strong

<!-- until p. 46 -->

## Consistency

* Not defined relation between MSE and strong consistency
* <!-- TODO --> Chebyshev inequality
* Better notation for asymptotic normality
  * $\sqrt{n}(\bar{X}_n - \mu) \overset{d}\rightarrow N(0, \sigma^2)\ \text{for}\ n \rightarrow \infty$
  * $\sqrt{n} \bar{X}_n \overset{d}\rightarrow N(\sqrt{n}\mu, \sigma^2)\ \text{for}\ n \rightarrow \infty \rightarrow$ this is stupid
* Roots of matrix unique except for rotation

<!-- until p. 55 (test theory) -->

# Classical test theory

* Critical region $C_\alpha$
* $\phi(\bm{X}) = \begin{cases}
    1 & \text{if }\ T(\bm{X}) \in C_\alpha, \\
    0 & \text{otherwise}.
   \end{cases}$
* Actions $A_0, A_1$, don't reject, reject
* Power function $g_\phi(\theta) = \mathbb{E}_\theta(\phi(\bm{X})) = \mathbb{P}_\theta(A_1)$
* "We want a power of x if $\theta_1 = ... \rightarrow$ find $n$

# Likelihood inference

* MLE's are asymptotically unbiased BAN (best asymptotically normal) estimators.
* Hypothesis $H_0: \bm{C} \bm\theta = \bm{d}$ vs. $H_1: \bm{C} \bm\theta \neq \bm{d}$
* Dimension of $\bm{C}$ and $\bm{d}$ is $s$.
* Likelihood ratio statistic $\lambda$
  * $\lambda = 2 \log \left( \mathcal{L}(\hat\theta)/\mathcal{L}(\tilde\theta) \right)= 2(\ell(\hat\theta) - \ell(\tilde\theta))$
  * $\lambda$ too large $\Rightarrow$ reject $H_0$
  * Optimization under linear constraints $\rightarrow$ Lagrange method
* Wald statistic $w$
  * Standardized distance between hypothetical value $\bm{d}$ under $H_0$ and $\bm{C} \hat\theta$.
  * $w$ too large $\Rightarrow$ reject $H_0$
  * $w = \hat\beta_s^T \mathcal{I}_{s \times s}^{-1} \hat\beta_s$
* Score/Rao statistic $u$
  * Built out of $s(\tilde{\bm\theta}|\bm{x})$ (score function constructed w.r.t. $H_1$ model, plug in constraints, say $s_{\hat\theta}(\tilde{\bm\theta}|\bm{x})$)
  * Idea: For $\hat{\bm\theta}, s(\hat{\bm\theta}|\bm{x}) = 0$
  * $u$ too large $\Rightarrow$ reject $H_0$
* $\lambda, w, u \overset{a}{\sim} \chi^2(s)$
* Reject if $\lambda, w, u > \chi_{1 - \alpha}^2(s)$
* Joint confidence intervals $\mathbb{P}_\theta(w \leq \chi_{1 - \alpha}^2(p)) \overset{a}{\approx} 1 - \alpha$ are hard to calculate and interpret.
  They are ellipsoids.
* Component wise confidence intervals assume independence of estimators (see multiple testing!)

# Bayesian inference

* $\mu$ and $\sigma$ independent
  * $f(\mu, \sigma^2 | x) \propto \text{likelihood} \times \text{prior}_\mu \times \text{prior}_{\sigma^2}$
  * $f(\mu, \sigma^2 | x) \propto f(x | \mu, \sigma^2) \times f(\mu) \times f(\sigma^2)$
  * $f(\mu | x) \propto f(x | \mu, \sigma^2) \times f(\mu)$
* $\text{cov}(\hat{y}) =$ estimation uncertainty + data generating process uncertainty

<!-- page 124 -->

# MCMC

* Metropolis-Hastings
* Gibbs

```r
set.seed(1)

r <- 4
f <- dnorm  # want to sample from
q <- function(x) 1/r  # proposal
alpha <- function(x1, x2, f, q) min(f(x2) / q(x2) / f(x1) * q(x1), 1)  # p accept

n <- 3e4; x <- numeric(n + 1); count <- 0
for (i in seq_len(n)) {
  y <- x[[i]] + runif(1, -r/2, r/2)  # candidate point
  x[[i + 1]] <- if (runif(1) < alpha(x[[i]], y, dnorm, q)) {
    count <- count + 1
    y
  } else x[[i]]
}
count / n
```

# FAQ - Exercises

* Proper density: non-negative, integrate to 1
* Can a prior distribution which assigns 0 probability mass to negative values be used with a identity link in GLMs?
* Handbook of Markov Chain Monte Carlo

# Exam preparation

## Important Stuff

* [X] Fisher-information (matrix)
* [X] Neyman criterion / factorization theorem
* [o] Exponential family
  * [X] Definition
  * [X] (Minimum) Sufficiency in exponential family
  * [ ] All properties
* [X] Fisher-regularity
* [ ] Risk
* [ ] Rao-Blackwellization
* [ ] Asymptotic normality
* [ ] Delta method
* [ ] Quotienten Regel
* [ ] UMPU test
* [ ] Metropolis-Hastings and Gibbs
* [ ] Weakly consistent
* [X] MSE
* [ ] Jeffrey's prior

## Summary

blub

