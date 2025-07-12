data {
  int<lower=0> N;
  array[N] int y; 
}

parameters {
  real<lower=0> lambda; // lambda must be positive for Poisson distribution
}

model {
    //a prior 
    lambda ~ uniform(0,5);
    
    // Likelihood function
    y ~ poisson(lambda);
}