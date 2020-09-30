M_.endo_names

data = oo_.endo_simul

c_tilde = data(1,:)
y_tilde = data(4,:)
i_tilde = data(6,:)

tb = data(11,:)

g = data(10,:)


% X  = cumprod(g)
% C  = exp(c_tilde(2:end)) .* X(1:end-1)
% Y  = exp(y_tilde(2:end)) .* X(1:end-1)
% I  = exp(i_tilde(2:end)) .* X(1:end-1)

% tb = tb(2:end) .* X(1:end-1)
% tby = tb ./ Y

% [~,c] = hpfilter(log(C),1600)
% [~,y] = hpfilter(log(Y),1600)
% [~,i] = hpfilter(log(I),1600)


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





