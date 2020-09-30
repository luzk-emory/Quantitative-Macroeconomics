function [M_dist] = m_dist(param)

    global M_ options_ oo_ var_list_

    set_param_value('rho',param(1)); 
    set_param_value('eta',param(2));
    set_param_value('phi',param(3)); 
    set_param_value('psi_1',param(4));

    [info,oo_,options_,M_] = stoch_simul(M_,options_,oo_,var_list_);

    % extract theoretical moments
    sd_list = sqrt(diag(oo_.var))*100;
    sd_y    = sd_list(8);
    sc_y    = oo_.autocorr{1}(8,8); % 1st order aotuocorr of y
    sd_i    = sd_list(5);
    sd_tby  = sd_list(10);

    M_simu = [sd_y sc_y sd_i sd_tby];
    M_targ = [3.71 0.86 10.31 1.72];
    
    W_mat = diag(ones(size(param)));

    M_dist = sqrt((M_simu-M_targ)*W_mat*(M_simu-M_targ)');
    
    fprintf('current distance = %.6f.\n', M_dist);
    
end 














