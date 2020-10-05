var  c h y i k a lambda util d tb_y ca_y r beta_fun eta;  
varexo e mu_t;   

parameters  sigma 
            omega 
            rho 
            sigma_tfp 
            delta 
            // psi_1
            alpha 
            phi 
            psi_3 
            r_bar 
            // d_bar 
            sigma_mu // new par for hw 1
            zeta ;  // new par for hw 1

% Table 4.1
sigma  = 2; %risk aversion
delta  = 0.1; %depreciation rate
r_bar  = 0.04; %world interest rate       
alpha  = 0.32; %labor share
omega  = 1.455; %Frisch-elasticity parameter
phi    = 0.028; %capital adjustment cost parameter

// d_bar  = 0.7442;
// psi_1  = 0.000742;

rho    = 0.42; %autocorrelation TFP 
zeta   = 0.8 ; // new par for hw 1

// sigma_tfp = 0 ; // 0.0129; %standard deviation TFP
// sigma_mu  = 0.012 ; // new par for hw 1
sigma_tfp = 0.0129 ; 
sigma_mu  = 0.0 ; 

% psi_3 is endogenously calibrated in the steady_state_model block
// psi_3  = 0.111349843009207; 

model;

    d = (1+r(-1))*d(-1)- exp(y)+exp(c)+exp(i)+(phi/2)*(exp(k)-exp(k(-1)))^2;

    exp(y) = exp(a)*(exp(k(-1))^alpha)*(exp(h)^(1-alpha));

    exp(k) = exp(i)+(1-delta)*exp(k(-1)); 

    exp(lambda) = beta_fun*(1+r)*exp(lambda(+1)); 

    exp(lambda) = (exp(c)-((exp(h)^omega)/omega))^(-sigma)-eta*(-psi_3*(1+exp(c)-omega^(-1)*exp(h)^omega)^(-psi_3-1));  

    eta = -util(+1)+eta(+1)*beta_fun(+1);

    ((exp(c)-(exp(h)^omega)/omega)^(-sigma))*(exp(h)^(omega-1)) + 
        eta*(-psi_3*(1+exp(c)-omega^(-1)*exp(h)^omega)^(-psi_3-1)*(-exp(h)^(omega-1))) = exp(lambda)*(1-alpha)*exp(y)/exp(h); 

    exp(lambda)*(1+phi*(exp(k)-exp(k(-1)))) = beta_fun*exp(lambda(+1))*(alpha*exp(y(+1))/exp(k)+1-delta+phi*(exp(k(+1))-exp(k))); 

    beta_fun =(1+exp(c)-omega^(-1)*exp(h)^omega)^(-psi_3);
    util = (((exp(c)-omega^(-1)*exp(h)^omega)^(1-sigma))-1)/(1-sigma);

    % shock process
    a = rho*a(-1)+sigma_tfp*e; 
    r = r_bar + zeta * (r(-1) - r_bar) + sigma_mu * mu_t;

    tb_y = 1-((exp(c)+exp(i)+(phi/2)*(exp(k)-exp(k(-1)))^2)/exp(y));
    ca_y = (1/exp(y))*(d(-1)-d);                                   
end;

steady_state_model;
    r     = r_bar;
    d     = 0.7442; //this ensures the ss is the same as that of EDEIR
    h     = log(((1-alpha)*(alpha/(r_bar+delta))^(alpha/(1-alpha)))^(1/(omega-1)));
    k     = log(exp(h)/(((r_bar+delta)/alpha)^(1/(1-alpha))));
    y     = log((exp(k)^alpha)*(exp(h)^(1-alpha)));
    i     = log(delta*exp(k));
    c     = log(exp(y)-exp(i)-r_bar*d);
    tb_y  = 1-((exp(c)+exp(i))/exp(y));
    util  = (((exp(c)-omega^(-1)*exp(h)^omega)^(1-sigma))-1)/(1-sigma);
    psi_3 = -log(1/(1+r_bar))/(log((1+exp(c)-omega^(-1)*exp(h)^omega)));
    beta_fun =(1+exp(c)-omega^(-1)*exp(h)^omega)^(-psi_3);
    eta   = -util/(1-beta_fun);
    lambda= log((exp(c)-((exp(h)^omega)/omega))^(-sigma)-eta*(-psi_3*(1+exp(c)-omega^(-1)*exp(h)^omega)^(-psi_3-1)));
    a     = 0;
    ca_y  = 0;
end;

// resid(1);
// check;

steady; 

shocks;
    var e; stderr 1;
    var mu_t; stderr 1;
end;

// stoch_simul(order=1, irf=0);

stoch_simul(irf=0, nodecomposition, nofunctions, order=1) y c i h tb_y ca_y;
