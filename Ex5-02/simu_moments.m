% results for Ex5.2 Q5Q6 are reported in Dynare

% run dynare first
% dynare Ex502

% simulate/compute moments in table 5.2 for Q5.2-7
options_.periods = 10000;

[~, oo_, ~, ~] = stoch_simul(M_, options_, oo_, var_list_)
data = oo_.endo_simul

M_.endo_names

% y_tilde = data(end-2,:)
% c_tilde = data(end-1,:)
% i_tilde = data(end,:)
% g = data(10,:)

y_tilde = data(strcmp('logY',M_.endo_names),:)
c_tilde = data(strcmp('logC',M_.endo_names),:)
i_tilde = data(strcmp('logI',M_.endo_names),:)
g       = data(strcmp('g'   ,M_.endo_names),:)

logX = cumsum(log(g))

logC = c_tilde(2:end) + logX(1:end-1)
logY = y_tilde(2:end) + logX(1:end-1)
logI = i_tilde(2:end) + logX(1:end-1)

[~,c] = hpfilter(logC,1600)
[~,y] = hpfilter(logY,1600)
[~,i] = hpfilter(logI,1600)

burnin=1000;

c = c((burnin+1):end)
y = y((burnin+1):end)
i = i((burnin+1):end)
tby = tby((burnin+1):end)

% replicate numbers in table 5.2

std(y)
std(c)/std(y)
std(i)/std(y)

% std(tb)/std(y)

corr(y(2:end),y(1:end-1))
corr(y,c)
corr(y,i)





