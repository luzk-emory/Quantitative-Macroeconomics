% calibrate the model and saves the steady state
param.beta       = 0.98;
param.gamma      = 0.36;
param.d_bar      = 0.10;
param.psi        = 0.001;
param.alpha_T    = 0.40;
param.alpha_N    = 0.80;
param.delta      = 0.05;
param.g_bar      = 1.0066;
param.phi        = 1.37;
param.miu        = 0.44;
% share paremeter of tradable goods; to be calibrated endogenously
param.yeta       = 0.5; 

% solve for the steady state with eta = 0.5, an initial guess
% x_ss0 provides an initial guess for the steady state
x0    = [0,0,0.1,1,1,1,1,1,1,1,1,1,1,1,1,1];
x_ss0 = fsolve(@(x)ss_model(x,param), x0);

% find the eta
eeta = fsolve(@(x)calibrate_eta(x,param,x_ss0), param.yeta);

% update the parameters and the steady state vals
[~, param, x_ss] = calibrate_eta(eeta, param, x_ss0)

% save for Dynare to load
save ss_vals x_ss
save param_vals param






%% helper function
function [res, param, x_ss] = calibrate_eta(eeta, param, x_ss0)

    param.yeta = eeta;

    x_ss = fsolve(@(x)ss_model(x,param),x_ss0);
    
    y_T = x_ss(6);
    y_N = x_ss(13);
    p_N = (1-param.yeta)/param.yeta*(x_ss(5)/x_ss(4))^(-1/param.miu);

    nt_share = p_N*y_N/(y_T+p_N*y_N);
    nt_share_target = 0.65;

    res = nt_share-nt_share_target;

end