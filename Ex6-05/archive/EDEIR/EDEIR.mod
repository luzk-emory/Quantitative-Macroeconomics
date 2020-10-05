// ==== Declaring variables and parameters
var A c d h i k r y lambda r_star_t tb_y ca_y;	// variables
varexo  eps_A 
        eps_r;	// normal shocks
parameters alpha beta delta sigma phi omega d_bar r_star psi_1 
           eta rho 
           zeta sigma_mu;	// parameters

// ==================== Setting parameters
// From table 4.1
sigma = 2;
delta = 0.1;
r_star= 0.04;
alpha = 0.32;
d_bar = 0.7442;
omega = 1.455;
phi   = 0.028;    // magnitude of capital adjust ment cost
psi_1 = 0.000742; // debt sensitivity of the interest rate

beta  = 1/(1+r_star);	// by assumption

rho   = 0.42; // persistence of technology shock
zeta  = 0.8;  // new par zeta in motion of interest rate

eta   = 0.0129; // std of productivity shock
sigma_mu = 0.0; // std of mu_t

// eta   = 0.0;
// sigma_mu = 0.012; 


// ======================= Declaring model
model;
    // ----- budget constraint
	exp(c)+exp(i)+phi/2*(exp(k)-exp(k(-1)))^2+(1+r(-1))*d(-1)=exp(y)+d;
	// ----- production function
    exp(y)=exp(A)*exp(k(-1))^alpha*exp(h)^(1-alpha);
	// ----- capital law of motion
    exp(i)=exp(k)-(1-delta)*exp(k(-1));
	// ----- 
    exp(lambda)=(exp(c)-exp(h)^omega/omega)^(-sigma);
	// ----- labor supply
    exp(h)^(omega-1)=exp(A)*(1-alpha)*(exp(k(-1))/exp(h))^alpha;
	// ----- Euler 1
    exp(lambda)*(1+phi*(exp(k)-exp(k(-1))))=beta*exp(lambda(+1))*(exp(A(+1))*alpha*(exp(k)/exp(h(+1)))^(alpha-1)+1-delta+phi*(exp(k(+1))-exp(k)));
	// ----- Euler 2
    exp(lambda)=beta*(1+r)*exp(lambda(+1));
	
    r = r_star_t + psi_1*(exp(d-d_bar)-1);

    // shocks
    A=rho*A(-1)+eta*eps_A;    
    r_star_t = r_star + zeta * (r_star_t(-1) - r_star) + sigma_mu * eps_r;

    // ----- define two ratios
    tb_y = 1-((exp(c)+exp(i)+(phi/2)*(exp(k)-exp(k(-1)))^2)/exp(y));
    ca_y = (1/exp(y))*(d(-1)-d);  
end;


// == Sequential solution for steady state
// steady_state_model;

initval;
    A        = log(1);
    c        = log(1.11695);
    d        = 0.7442;
    h        = log(1.00742);
    i        = log(0.339769);
    k        = log(3.39769);
    r        = 0.04;
    y        = log(1.48649);
    lambda   = log(5.60908);
    r_star_t = 0.04;
    tb_y     = 0.0200257;
    ca_y     = 0;
end;

// resid;
steady;	// display solution for steady state
// check;	// display eigenvalues

shocks;
	var eps_A = 1;	// standard normal
    var eps_r = 1;  // standard normal 
end;

// ==================== Solve and simulate
// stoch_simul(graph_format=none, hp_filter=0, irf=0, nodecomposition, nofunctions, order=1);
// stoch_simul(irf=0, nodecomposition, nofunctions, order=1) y c i h tb_y ca_y;
stoch_simul(irf=20, order=1);
