M_.endo_names

    % {'c'      }
    % {'d'      }
    % {'r'      }
    % {'y_T'    }
    % {'k_T'    }
    % {'i_T'    }
    % {'h_T'    }
    % {'lambda' }
    % {'z'      }
    % {'g'      }
    % {'tb'     }
    % {'delta_y'}
    % {'tby'    }

data = oo_.endo_simul

c_tilde = data(1,:)
y_tilde = data(4,:)
i_tilde = data(6,:)
tb_tilde = data(end-2,:)
tby = data(end,:)

g = data(10,:)
X = cumprod(g)

C  = exp(c_tilde(2:end)) .* X(1:end-1)
Y  = exp(y_tilde(2:end)) .* X(1:end-1)
I  = exp(i_tilde(2:end)) .* X(1:end-1)
Tb = exp(tb_tilde(2:end)) .* X(1:end-1)

Tb2 = Y-C-I
tby2=Tb2./Y

[~,c] = hpfilter(log(C),1600)
[~,y] = hpfilter(log(Y),1600)
[~,i] = hpfilter(log(I),1600)
[~,tb] = hpfilter(log(Tb),1600)

std(y)
std(c)/std(y)
std(i)/std(y)
std(tb)/std(y)
std(tby)/std(y)

corr(y,c)
corr(y,i)
corr(y,tb)
corr(y,tby)






dy = oo_.endo_simul(end-1,:)