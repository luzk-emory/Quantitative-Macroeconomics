% this function computes the steady state
function f = ss_model(x,param)

    beta    = param.beta;
    gamma   = param.gamma;
    d_bar   = param.d_bar;
    psi     = param.psi;
    alpha_T = param.alpha_T;
    alpha_N = param.alpha_N;
    delta   = param.delta;
    g_bar   = param.g_bar;
    phi     = param.phi;
    miu     = param.miu;
    sigma   = param.sigma;
    yeta    = param.yeta;
    

    a_ss    = x(1);
    c_ss    = x(2);
    i_ss    = x(3);
    a_T_ss  = x(4);
    a_N_ss  = x(5);
    y_T_ss  = x(6);
    k_T_ss  = x(7);
    h_T_ss  = x(8);
    k_N_ss  = x(9);
    h_N_ss  = x(10);
    i_T_ss  = x(11);
    i_N_ss  = x(12);
    y_N_ss  = x(13);
    h_ss    = x(14);
    d_ss    = x(15);
    r_ss    = x(16);

    f = zeros(size(x));
    
    f(1)  = a_ss - c_ss - i_ss;
    f(2)  = a_ss - (yeta*a_T_ss^((miu-1)/miu)+(1-yeta)*a_N_ss^((miu-1)/miu))^(miu/(miu-1));
    f(3)  = y_T_ss - k_T_ss^(1-alpha_T)*(g_bar*h_T_ss)^alpha_T;
    f(4)  = y_N_ss - k_N_ss^(1-alpha_N)*(g_bar*h_N_ss)^alpha_N;
    
    f(5)  = i_T_ss - (g_bar-1+delta)*k_T_ss;
    f(6)  = i_N_ss - (g_bar-1+delta)*k_N_ss;

    f(7)  = i_ss - i_T_ss - i_N_ss;
    f(8)  = y_N_ss - a_N_ss;
    f(9)  = h_ss - h_T_ss - h_N_ss;

    f(10) = d_ss*g_bar/r_ss - d_ss - a_T_ss + y_T_ss;
    f(11) = psi*(exp(d_ss-d_bar)-1);

    f(12) = (1-gamma)*c_ss - gamma*(1-h_ss)*a_ss^(1/miu)*   yeta *a_T_ss^(-1/miu)*alpha_T*g_bar*(k_T_ss/h_T_ss/g_bar)^(1-alpha_T);
    f(13) = (1-gamma)*c_ss - gamma*(1-h_ss)*a_ss^(1/miu)*(1-yeta)*a_N_ss^(-1/miu)*alpha_N*g_bar*(k_N_ss/h_N_ss/g_bar)^(1-alpha_N);
    
    f(14) = r_ss*beta*g_bar^(-gamma*sigma+gamma-1)-1;

    f(15) = 1 - beta*g_bar^(-gamma*sigma+gamma-1)*(a_ss^(1/miu)*   yeta *a_T_ss^(-1/miu)*(1-alpha_T)*y_T_ss/k_T_ss + 1 - delta);
    f(16) = 1 - beta*g_bar^(-gamma*sigma+gamma-1)*(a_ss^(1/miu)*(1-yeta)*a_N_ss^(-1/miu)*(1-alpha_N)*y_N_ss/k_N_ss + 1 - delta);





