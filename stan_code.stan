
data {
    int<lower=0> n_x;
    int<lower=0> n_y;
    real<lower=0> sigma_y;
    real y_obs[n_y];
    int<lower=0> tau;
    real x0;
}
parameters {
    real x[n_x];
    real alpha;
    real<lower=0> sigma_x;
}


model {
    alpha ~ normal(5.3, 0.2);
    sigma_x ~ uniform(0,0.1);
    x[1] ~ normal(alpha*x0*x0*(1-x0), sigma_x);
    for(i in 2:n_x) {
    	x[i] ~ normal(alpha*x[i-1]*x[i-1]*(1-x[i-1]), sigma_x);
    }
    
    for(i in 1:n_y) {
    	y_obs[i] ~ normal(x[i*tau], sigma_y);
    }
}


