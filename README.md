<!-- Statistical Inference -->

[TOC]

Slides are the same as the complete script.

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

