%%% run calibrate.m first

%-------------------------------------------------------%
%                 ENDOGENOUS VARIABLES                  % 
%-------------------------------------------------------%

var 
// core vars
c h a i d r a_T a_N y_T y_N k_T k_N i_T i_N h_T h_N lambda
// shocks
z g 
// auxiliary vars
p p_N tb delta_c delta_y tby y 
logY
logC
logI
;

%-------------------------------------------------------%
%                  EXOGENOUS VARIABLES                  % 
%-------------------------------------------------------%

varexo ez eg;

%-------------------------------------------------------%
%                      PARAMETERS                       % 
%-------------------------------------------------------%

parameters yeta miu alpha_T alpha_N delta phi g_bar psi d_bar gamma beta r_star phoz phog sigmaz sigmag sigma;

load param_vals;

set_param_value('beta',    param.beta);
set_param_value('gamma',   param.gamma);
set_param_value('d_bar',   param.d_bar);
set_param_value('psi',     param.psi);
set_param_value('alpha_T', param.alpha_T);
set_param_value('alpha_N', param.alpha_N);
set_param_value('delta',   param.delta);
set_param_value('g_bar',   param.g_bar);
set_param_value('phi',     param.phi);
set_param_value('miu',     param.miu);
set_param_value('yeta',    param.yeta);
set_param_value('sigma',   param.sigma);

// yeta     = 0.5;
// alpha_T  = 0.4;
// miu      = 0.44;
// alpha_N  = 0.80;
// delta    = 0.05;
// phi      = 1.37;
// g_bar    = 1.0066;
// psi      = 0.001;
// d_bar    = 0.10;
// gamma    = 0.36;
// beta     = 0.98;

r_star  = 1/beta/g_bar^(-gamma*sigma+gamma-1);

// r_star  = 1.029578212769690;
// parameters that do not affect the steady state

phoz    = 0.95;
phog    = 0.00;
sigmaz  = 0.0053;
sigmag  = 0.0213;

%-------------------------------------------------------%
%                        MODEL                          % 
%-------------------------------------------------------%

model;

// focs
(1-gamma)*c = gamma*(1-h)*a^(1/miu)*   yeta *a_T^(-1/miu)*alpha_T*z*g*(k_T(-1)/h_T/g)^(1-alpha_T);
(1-gamma)*c = gamma*(1-h)*a^(1/miu)*(1-yeta)*a_N^(-1/miu)*alpha_N*z*g*(k_N(-1)/h_N/g)^(1-alpha_N);

lambda = (c^gamma*(1-h)^(1-gamma))^(-sigma)*(1-h)^(1-gamma)*gamma*c^(gamma-1);

// Euler eqns
lambda * a^(1/miu)*yeta*a_T^(-1/miu)/r = beta*lambda(+1)*g^(-gamma*sigma+gamma-1)*a(+1)^(1/miu)*yeta*a_T(+1)^(-1/miu);

lambda * (1+phi*(k_T/k_T(-1)*g - g_bar)) = beta * lambda(+1) * g^(-gamma*sigma+gamma-1)*(a(+1)^(1/miu)*   yeta *a_T(+1)^(-1/miu)*(1-alpha_T)*y_T(+1)/k_T + 1 - delta + phi*(k_T(+1)/k_T*g(+1)-g_bar)*k_T(+1)/k_T*g(+1)-phi/2*(k_T(+1)/k_T*g(+1)-g_bar)^2);
lambda * (1+phi*(k_N/k_N(-1)*g - g_bar)) = beta * lambda(+1) * g^(-gamma*sigma+gamma-1)*(a(+1)^(1/miu)*(1-yeta)*a_N(+1)^(-1/miu)*(1-alpha_N)*y_N(+1)/k_N + 1 - delta + phi*(k_N(+1)/k_N*g(+1)-g_bar)*k_N(+1)/k_N*g(+1)-phi/2*(k_N(+1)/k_N*g(+1)-g_bar)^2);

// 
a = c + i;
a = (yeta*a_T^((miu-1)/miu)+(1-yeta)*a_N^((miu-1)/miu))^(miu/(miu-1));

i = i_T + i_N;
h = h_T + h_N;

// production function
y_T = z * k_T(-1)^(1-alpha_T)*(g*h_T)^alpha_T;
y_N = z * k_N(-1)^(1-alpha_N)*(g*h_N)^alpha_N;

// market clearing conditions for N and T
y_N = a_N;
y_T = d(-1) + a_T - d*g/r;

// law of motion of capital 
k_T = ((1-delta)*k_T(-1) + i_T -phi/2*(k_T/k_T(-1)*g - g_bar)^2*k_T(-1))/g;
k_N = ((1-delta)*k_N(-1) + i_N -phi/2*(k_N/k_N(-1)*g - g_bar)^2*k_N(-1))/g;

r = r_star + psi*(exp(d(+1)-d_bar)-1);

// shock process
log(z) = phoz*log(z(-1)) + sigmaz*ez;
log(g/g_bar) = phog*log(g(-1)/g_bar) + sigmag*eg;

// define auxiliary vars here: 
p   = a^(-1/miu)/yeta*a_T^(1/miu);
p_N = (1-yeta)/yeta*(a_N/a_T)^(-1/miu);
y   = (y_T + p_N*y_N)/p;
tb  = y - c - i;
tby = tb/y;

delta_c = log(c/c(-1)*g(-1));
delta_y = log(y/y(-1)*g(-1));

logY = log(y);
logC = log(c);
logI = log(i);

end;

%-------------------------------------------------------%
%                 STEADY STATE INITIAL VALUES           % 
%-------------------------------------------------------%

load ss_vals.mat

initval;

a     =   x_ss(1);
c     =   x_ss(2);
i     =   x_ss(3);
a_T   =   x_ss(4);
a_N   =   x_ss(5);
y_T   =   x_ss(6);
k_T   =   x_ss(7);
h_T   =   x_ss(8);
k_N   =   x_ss(9);
h_N   =   x_ss(10);
i_T   =   x_ss(11);
i_N   =   x_ss(12);
y_N   =   x_ss(13);
h     =   x_ss(14);
d     =   x_ss(15);
r     =   x_ss(16);

lambda = (x_ss(2)^gamma*(1-x_ss(14))^(1-gamma))^(-sigma)*(1-x_ss(14))^(1-gamma)*gamma*x_ss(2)^(gamma-1);

z = 1;
g = g_bar;

p   = x_ss(1)^(-1/miu)/yeta*x_ss(4)^(1/miu);
p_N = (1-yeta)/yeta*(x_ss(5)/x_ss(4))^(-1/miu);
y   = (y_T + p_N*y_N)/p;
tb  = y - c - i;
tby = tb/y;

delta_c = log(g_bar);
delta_y = log(g_bar);

logY = log(y);
logC = log(c);
logI = log(i);

end;

resid(1);
check;

steady;

shocks;
var ez; stderr 1; 
var eg; stderr 1;  
end;

stoch_simul(irf=0, nodecomposition, order=1, periods=0);