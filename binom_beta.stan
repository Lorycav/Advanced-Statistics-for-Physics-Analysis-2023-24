data {
  int<lower=0> N;       // Number of trials in first experiment
  int<lower=0> y;       // Number of successes in first experiment
}
parameters {
  real<lower=0, upper=1> prior;  // Probability of success
}
model {
  // Priors
  prior ~ beta(1, 10);
  
  // Likelihood
  y ~ binomial(N, prior);
  
}

generated quantities {
  real<lower=0, upper=1> p_post;
  p_post = beta_rng(1 + y, 10 + N - y);
}