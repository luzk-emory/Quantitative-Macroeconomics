%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'Q502';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Q502.log');
M_.exo_names = 'ez';
M_.exo_names_tex = 'ez';
M_.exo_names_long = 'ez';
M_.exo_names = char(M_.exo_names, 'eg');
M_.exo_names_tex = char(M_.exo_names_tex, 'eg');
M_.exo_names_long = char(M_.exo_names_long, 'eg');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'h');
M_.endo_names_tex = char(M_.endo_names_tex, 'h');
M_.endo_names_long = char(M_.endo_names_long, 'h');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'a_T');
M_.endo_names_tex = char(M_.endo_names_tex, 'a\_T');
M_.endo_names_long = char(M_.endo_names_long, 'a_T');
M_.endo_names = char(M_.endo_names, 'a_N');
M_.endo_names_tex = char(M_.endo_names_tex, 'a\_N');
M_.endo_names_long = char(M_.endo_names_long, 'a_N');
M_.endo_names = char(M_.endo_names, 'y_T');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_T');
M_.endo_names_long = char(M_.endo_names_long, 'y_T');
M_.endo_names = char(M_.endo_names, 'y_N');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_N');
M_.endo_names_long = char(M_.endo_names_long, 'y_N');
M_.endo_names = char(M_.endo_names, 'k_T');
M_.endo_names_tex = char(M_.endo_names_tex, 'k\_T');
M_.endo_names_long = char(M_.endo_names_long, 'k_T');
M_.endo_names = char(M_.endo_names, 'k_N');
M_.endo_names_tex = char(M_.endo_names_tex, 'k\_N');
M_.endo_names_long = char(M_.endo_names_long, 'k_N');
M_.endo_names = char(M_.endo_names, 'i_T');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_T');
M_.endo_names_long = char(M_.endo_names_long, 'i_T');
M_.endo_names = char(M_.endo_names, 'i_N');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_N');
M_.endo_names_long = char(M_.endo_names_long, 'i_N');
M_.endo_names = char(M_.endo_names, 'h_T');
M_.endo_names_tex = char(M_.endo_names_tex, 'h\_T');
M_.endo_names_long = char(M_.endo_names_long, 'h_T');
M_.endo_names = char(M_.endo_names, 'h_N');
M_.endo_names_tex = char(M_.endo_names_tex, 'h\_N');
M_.endo_names_long = char(M_.endo_names_long, 'h_N');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'p');
M_.endo_names_tex = char(M_.endo_names_tex, 'p');
M_.endo_names_long = char(M_.endo_names_long, 'p');
M_.endo_names = char(M_.endo_names, 'p_N');
M_.endo_names_tex = char(M_.endo_names_tex, 'p\_N');
M_.endo_names_long = char(M_.endo_names_long, 'p_N');
M_.endo_names = char(M_.endo_names, 'tb');
M_.endo_names_tex = char(M_.endo_names_tex, 'tb');
M_.endo_names_long = char(M_.endo_names_long, 'tb');
M_.endo_names = char(M_.endo_names, 'delta_c');
M_.endo_names_tex = char(M_.endo_names_tex, 'delta\_c');
M_.endo_names_long = char(M_.endo_names_long, 'delta_c');
M_.endo_names = char(M_.endo_names, 'delta_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'delta\_y');
M_.endo_names_long = char(M_.endo_names_long, 'delta_y');
M_.endo_names = char(M_.endo_names, 'tby');
M_.endo_names_tex = char(M_.endo_names_tex, 'tby');
M_.endo_names_long = char(M_.endo_names_long, 'tby');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'logY');
M_.endo_names_tex = char(M_.endo_names_tex, 'logY');
M_.endo_names_long = char(M_.endo_names_long, 'logY');
M_.endo_names = char(M_.endo_names, 'logC');
M_.endo_names_tex = char(M_.endo_names_tex, 'logC');
M_.endo_names_long = char(M_.endo_names_long, 'logC');
M_.endo_names = char(M_.endo_names, 'logI');
M_.endo_names_tex = char(M_.endo_names_tex, 'logI');
M_.endo_names_long = char(M_.endo_names_long, 'logI');
M_.endo_partitions = struct();
M_.param_names = 'yeta';
M_.param_names_tex = 'yeta';
M_.param_names_long = 'yeta';
M_.param_names = char(M_.param_names, 'miu');
M_.param_names_tex = char(M_.param_names_tex, 'miu');
M_.param_names_long = char(M_.param_names_long, 'miu');
M_.param_names = char(M_.param_names, 'alpha_T');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_T');
M_.param_names_long = char(M_.param_names_long, 'alpha_T');
M_.param_names = char(M_.param_names, 'alpha_N');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_N');
M_.param_names_long = char(M_.param_names_long, 'alpha_N');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'g_bar');
M_.param_names_tex = char(M_.param_names_tex, 'g\_bar');
M_.param_names_long = char(M_.param_names_long, 'g_bar');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'd_bar');
M_.param_names_tex = char(M_.param_names_tex, 'd\_bar');
M_.param_names_long = char(M_.param_names_long, 'd_bar');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'r_star');
M_.param_names_tex = char(M_.param_names_tex, 'r\_star');
M_.param_names_long = char(M_.param_names_long, 'r_star');
M_.param_names = char(M_.param_names, 'phoz');
M_.param_names_tex = char(M_.param_names_tex, 'phoz');
M_.param_names_long = char(M_.param_names_long, 'phoz');
M_.param_names = char(M_.param_names, 'phog');
M_.param_names_tex = char(M_.param_names_tex, 'phog');
M_.param_names_long = char(M_.param_names_long, 'phog');
M_.param_names = char(M_.param_names, 'sigmaz');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaz');
M_.param_names_long = char(M_.param_names_long, 'sigmaz');
M_.param_names = char(M_.param_names, 'sigmag');
M_.param_names_tex = char(M_.param_names_tex, 'sigmag');
M_.param_names_long = char(M_.param_names_long, 'sigmag');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 29;
M_.param_nbr = 17;
M_.orig_endo_nbr = 29;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('Q502_static');
erase_compiled_function('Q502_dynamic');
M_.orig_eq_nbr = 29;
M_.eq_nbr = 29;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 8 0;
 0 9 0;
 0 10 37;
 0 11 0;
 2 12 38;
 0 13 0;
 0 14 39;
 0 15 40;
 0 16 41;
 0 17 42;
 3 18 43;
 4 19 44;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 45;
 5 25 0;
 6 26 46;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;
 0 32 0;
 7 33 0;
 0 34 0;
 0 35 0;
 0 36 0;]';
M_.nstatic = 16;
M_.nfwrd   = 6;
M_.npred   = 3;
M_.nboth   = 4;
M_.nsfwrd   = 10;
M_.nspred   = 7;
M_.ndynamic   = 13;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(29, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(17, 1);
M_.NNZDerivatives = [125; -1; -1];
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
M_.params( 12 ) = 1/M_.params(11)/M_.params(7)^(M_.params(10)+(-M_.params(10))*M_.params(17)-1);
r_star = M_.params( 12 );
M_.params( 13 ) = 0.95;
phoz = M_.params( 13 );
M_.params( 14 ) = 0.00;
phog = M_.params( 14 );
M_.params( 15 ) = 0.0053;
sigmaz = M_.params( 15 );
M_.params( 16 ) = 0.0213;
sigmag = M_.params( 16 );
load ss_vals.mat
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 3 ) = x_ss(1);
oo_.steady_state( 1 ) = x_ss(2);
oo_.steady_state( 4 ) = x_ss(3);
oo_.steady_state( 7 ) = x_ss(4);
oo_.steady_state( 8 ) = x_ss(5);
oo_.steady_state( 9 ) = x_ss(6);
oo_.steady_state( 11 ) = x_ss(7);
oo_.steady_state( 15 ) = x_ss(8);
oo_.steady_state( 12 ) = x_ss(9);
oo_.steady_state( 16 ) = x_ss(10);
oo_.steady_state( 13 ) = x_ss(11);
oo_.steady_state( 14 ) = x_ss(12);
oo_.steady_state( 10 ) = x_ss(13);
oo_.steady_state( 2 ) = x_ss(14);
oo_.steady_state( 5 ) = x_ss(15);
oo_.steady_state( 6 ) = x_ss(16);
oo_.steady_state( 17 ) = M_.params(10)*(1-x_ss(14))^(1-M_.params(10))*(x_ss(2)^M_.params(10)*(1-x_ss(14))^(1-M_.params(10)))^(-M_.params(17))*x_ss(2)^(M_.params(10)-1);
oo_.steady_state( 18 ) = 1;
oo_.steady_state( 19 ) = M_.params(7);
oo_.steady_state( 20 ) = x_ss(1)^((-1)/M_.params(2))/M_.params(1)*x_ss(4)^(1/M_.params(2));
oo_.steady_state( 21 ) = (1-M_.params(1))/M_.params(1)*(x_ss(5)/x_ss(4))^((-1)/M_.params(2));
oo_.steady_state( 26 ) = (oo_.steady_state(9)+oo_.steady_state(21)*oo_.steady_state(10))/oo_.steady_state(20);
oo_.steady_state( 22 ) = oo_.steady_state(26)-oo_.steady_state(1)-oo_.steady_state(4);
oo_.steady_state( 25 ) = oo_.steady_state(22)/oo_.steady_state(26);
oo_.steady_state( 23 ) = log(M_.params(7));
oo_.steady_state( 24 ) = log(M_.params(7));
oo_.steady_state( 27 ) = log(oo_.steady_state(26));
oo_.steady_state( 28 ) = log(oo_.steady_state(1));
oo_.steady_state( 29 ) = log(oo_.steady_state(4));
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
resid(1);
oo_.dr.eigval = check(M_,options_,oo_);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
options_.irf = 0;
options_.nodecomposition = 1;
options_.order = 1;
options_.periods = 0;
var_list_ = char();
info = stoch_simul(var_list_);
save('Q502_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Q502_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Q502_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Q502_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Q502_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Q502_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Q502_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
