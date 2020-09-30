%%% First you should run calibrate.m

%------------------------------------------------------------------------------------------%
%                 ENDOGENOUS VARIABLES                                                     % 
%------------------------------------------------------------------------------------------%

var 
// core vars
c 
d r 
a_T y_T k_T i_T h_T lambda
// shocks
z g 
// auxiliary vars
// p p_N 
tb 
// delta_c 
delta_y tby
;

%------------------------------------------------------------------------------------------%
%                  EXOGENOUS VARIABLES                                                     % 
%------------------------------------------------------------------------------------------%

varexo ez eg;

%------------------------------------------------------------------------------------------%
%                      PARAMETERS                                                          % 
%------------------------------------------------------------------------------------------%

parameters alpha_T delta phi g_bar psi d_bar gamma beta r_star phoz phog sigmaz sigmag sigma;

// yeta    = 1;
alpha_T = 0.68;

// miu     = 0.44;
delta   = 0.05;
phi     = 1.37;
g_bar   = 1.0066;
psi     = 0.001;
d_bar   = 0.10;
gamma   = 0.36;
beta    = 0.98;

r_star  = 1.029578212769690;

// parameters that do not affect the steady state
phoz    = 0.95;
phog    = 0.00;
sigmaz  = 0.0053;
sigmag  = 0.0213;
sigma   = 2;

%------------------------------------------------------------------------------------------%
%                                 MODEL                                                    % 
%------------------------------------------------------------------------------------------%

model;

// focs
(1-gamma)*exp(c) = gamma*(1-exp(h_T))*alpha_T*z*(exp(k_T(-1))/(exp(h_T)*g))^(1-alpha_T);

lambda = (exp(c)^gamma*(1-exp(h_T))^(1-gamma))^(-sigma)*(1-exp(h_T))^(1-gamma)*gamma*exp(c)^(gamma-1);

// Euler eqns
lambda/r = beta*lambda(+1)*g^(-gamma*sigma+gamma-1);

lambda * (1+phi*(exp(k_T)/exp(k_T(-1))*g - g_bar)) = beta * lambda(+1) * g^(-gamma*sigma+gamma-1)*((1-alpha_T)*exp(y_T(+1))/exp(k_T) + 1 - delta + phi*(exp(k_T(+1))/exp(k_T)*g(+1)-g_bar)*exp(k_T(+1))/exp(k_T)*g(+1)-phi/2*(exp(k_T(+1))/exp(k_T)*g(+1)-g_bar)^2);

// 
exp(a_T) = exp(c) + exp(i_T);

// production function
exp(y_T) = z * exp(k_T(-1))^(1-alpha_T)*(exp(h_T)*g)^alpha_T;

// market clearing conditions for N and T
exp(y_T) = d(-1) + exp(a_T) - d*g/r;

// law of motion of capital 
exp(k_T) = ((1-delta)*exp(k_T(-1))+exp(i_T)-phi/2*(exp(k_T)/exp(k_T(-1))*g-g_bar)^2*exp(k_T(-1)))/g;

r = r_star + psi*(exp(d-d_bar)-1);

// shock process
log(z)       = phoz*log(z(-1))       + sigmaz*ez;
log(g/g_bar) = phog*log(g(-1)/g_bar) + sigmag*eg;

// define auxiliary vars here: 

exp(tb) = exp(y_T) - exp(c) - exp(i_T);
tby = exp(tb)/exp(y_T);

// delta_c = c-c(-1)+log(g(-1));
delta_y = y_T - y_T(-1);

end;

%------------------------------------------------------------------------------------------%
%                          STEADY STATE INITIAL VALUES                                     % 
%------------------------------------------------------------------------------------------%

initval;

c        =  -0.469107;
d        =  0.0993443;
r        =  1.02958;
a_T      =  -0.210054;
y_T      =  -0.207323;
k_T      =  1.18424;
i_T      =  -1.68751;
h_T      =  -0.862177;
lambda   =  0.967961;
z        =  1;
g        =  1.0066;
tb       =  -6.11039;
// delta_c  =  0.00657832;
delta_y  =  0;
tby      =  0.00273106;

end;

resid(1);
check;

steady;

shocks;
var ez; stderr 1; 
var eg; stderr 1;  
end;

stoch_simul(irf=0, nodecomposition, order=1, periods=0);