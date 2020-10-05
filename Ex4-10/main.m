%% ENV
clear all; clc;
addpath('/Applications/Dynare/4.6.2/matlab'); % add dynare path

%% Baseline
dynare Ex410.mod; % to get model instance

print_table() % exactly replicate table 4.2 using textbook calibration

%% Q1.1 Calibrate model for Canada 1960-2011

%{
NOTE:
    1. moments to match: [std(y),autocor(y),std(i),std(tb/y)]
    2. target moment values: [3.71%, 0.86, 10.31%, 1.72%]
    3. pars to calibrate: rho, eta, phi, psi_1
    4. method: min distance
    5. solver: fminunc/BFGS Quasi-Newton
    6. init guess: param = [0.42 0.0129 0.028 0.000742]
%}

param_init = [0.42 0.0129 0.028 0.000742];
param_est  = fminunc(@(x)m_dist(x), param_init);

fprintf('Estimation results:\n');
fprintf('\n');
fprintf('rho   = %.6f\n', param_est(1));
fprintf('eta   = %.6f\n', param_est(2));
fprintf('phi   = %.6f\n', param_est(3));
fprintf('psi_1 = %.6f\n', param_est(4));

% %% Q1.2 Compute theoretical second moments

set_param_value('rho',  param_est(1)); 
set_param_value('eta',  param_est(2));
set_param_value('phi',  param_est(3)); 
set_param_value('psi_1',param_est(4));

[info,oo_,options_,M_] = stoch_simul(M_,options_,oo_,var_list_);

print_table()

% %% Q1.4 compute std(ln A)

sd_list  = sqrt(diag(oo_.var));
sd_A     = sd_list(strcmp('A',M_.endo_names))*100;
sd_y     = sd_list(strcmp('y',M_.endo_names))*100;
sd_A_old = 100*sqrt(0.0129^2/(1-0.42^2));

fprintf('Unconditional SD(ln(A)) = %.4f\n', sd_A);
fprintf('Old value:                %.4f\n', sd_A_old);
fprintf('Unconditional SD(y)     = %.4f\n', sd_y);
fprintf('Old value:                %.4f\n', 3.08);


