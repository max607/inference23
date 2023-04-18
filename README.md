<!-- Statistical Inference -->

 Macros: {
      bm: ["\\boldsymbol{#1}",1]
 }

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

### Examples

* Simple linear exponential family
* Location scale family
  * E.g., $f_0(z) = \mathbb{I}_{(-0.5, 0.5)}(z)$
  * $a$ not necessarily the mean
  * Cauchy distribution $\rightarrow$ there the location is the median <!-- TODO What is the scale? -->
    * Simulation: $C \sim \frac{N(0, 1)}{N(0, 1)}$
* Mixture distributions, discrete mixtures
