// Declaring variables and parameters
options_.noprint=1;

var A c d h i k r y lambda
	tb_y // trade balance over y
	ca_y // current account over y
	;

varexo epsilon;	

parameters alpha beta delta sigma phi chi omega d_bar r_star psi_1 eta rho;	

// calibrated parameters
beta  = 1/1.04;
sigma = 2;
omega = 1.455;
alpha = 0.32;
delta = 0.10;
d_bar=0.7442;

r_star=0.04;
chi=1;

// parameters to be estimated; assign initial vals here
rho=0.42;
eta=0.0129;
phi=0.028;
psi_1=0.000742;

// Declaring model
model;
	// c+i+phi/2*(k-k(-1))^2+(1+r(-1))*d(-1)=y+d;
	// y=A*k(-1)^alpha*h^(1-alpha);
	// i=k-(1-delta)*k(-1);
	// lambda=(c-chi*h^omega/omega)^(-sigma);
	// chi*h^(omega-1)=A*(1-alpha)*(k(-1)/h)^alpha;
	// lambda*(1+phi*(k-k(-1)))=beta*lambda(+1)*(A(+1)*alpha*(k/h(+1))^(alpha-1)+1-delta+phi*(k(+1)-k));
	// lambda=beta*(1+r)*lambda(+1);
	// r=r_star+psi_1*(exp(d-d_bar)-1);
	// log(A)=rho*log(A(-1))+eta*epsilon;
	exp(c)+exp(i)+phi/2*(exp(k)-exp(k(-1)))^2+(1+r(-1))*d(-1)=exp(y)+d;
	exp(y)=exp(A)*exp(k(-1))^alpha*exp(h)^(1-alpha);
	exp(i)=exp(k)-(1-delta)*exp(k(-1));
	exp(lambda)=(exp(c)-chi*exp(h)^omega/omega)^(-sigma);
	chi*exp(h)^(omega-1)=exp(A)*(1-alpha)*(exp(k(-1))/exp(h))^alpha;
	exp(lambda)*(1+phi*(exp(k)-exp(k(-1))))=beta*exp(lambda(+1))*(exp(A(+1))*alpha*(exp(k)/exp(h(+1)))^(alpha-1)+1-delta+phi*(exp(k(+1))-exp(k)));
	exp(lambda)=beta*(1+r)*exp(lambda(+1));
	r=r_star+psi_1*(exp(d-d_bar)-1);
	A=rho*A(-1)+eta*epsilon;

	tb_y = (d(-1)-d+r(-1)*d(-1))/exp(y);
	ca_y = (d(-1)-d)/exp(y);
end;

// Sequential solution for steady state
steady_state_model;
	A=0;
	d=d_bar+log(1+(1/beta-1-r_star)/psi_1);
	r=r_star+psi_1*(exp(d-d_bar)-1);
	k_h=((1/beta-1+delta)/(alpha))^(1/(alpha-1));
	h=log(((1-alpha)/chi*k_h^alpha)^(1/(omega-1)));
	k=log(k_h*exp(h));
	i=log(delta*exp(k));
	y=log(exp(k)^alpha*exp(h)^(1-alpha));
	c=log(exp(y)-exp(i)-r*d);
	lambda=log((exp(c)-chi*exp(h)^omega/omega)^(-sigma));

	tb_y = (d_bar*r_star)/exp(y);
	ca_y = 0;
end;


// Optional
steady;	// display solution for steady state
check;	// display eigenvalues


// Exogenous shocks
shocks;
	var epsilon=1;	// standard normal
end;

// Solve and simulate
stoch_simul(
	graph_format=none, 
	hp_filter=0, 
	irf=0, 
	nodecomposition, 
	nofunctions, 
	order=1, 
	periods=0
	);

