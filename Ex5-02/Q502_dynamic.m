function [residual, g1, g2, g3] = Q502_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(29, 1);
T17 = 1/params(2);
T18 = y(10)^T17;
T19 = params(10)*(1-y(9))*T18;
T23 = (-1)/params(2);
T24 = y(14)^T23;
T35 = y(3)/y(22)/y(26);
T37 = T35^(1-params(3));
T43 = y(15)^T23;
T52 = y(4)/y(23)/y(26);
T54 = T52^(1-params(4));
T58 = y(8)^params(10);
T59 = (1-y(9))^(1-params(10));
T60 = T58*T59;
T63 = T60^(-params(17));
T65 = params(10)*T59*T63;
T67 = y(8)^(params(10)-1);
T82 = y(26)^(params(10)+params(17)*(-params(10))-1);
T83 = params(11)*y(45)*T82;
T85 = y(37)^T17;
T89 = y(39)^T23;
T117 = y(43)*params(6)*(y(43)/y(18)*y(46)-params(7))/y(18);
T120 = params(6)/2;
T123 = 1+(1-params(3))*T89*params(1)*T85*y(41)/y(18)-params(5)+y(46)*T117-T120*(y(43)/y(18)*y(46)-params(7))^2;
T135 = y(40)^T23;
T149 = y(44)*params(6)*(y(46)*y(44)/y(19)-params(7))/y(19);
T154 = 1+(1-params(4))*(1-params(1))*T85*T135*y(42)/y(19)-params(5)+y(46)*T149-T120*(y(46)*y(44)/y(19)-params(7))^2;
T161 = (params(2)-1)/params(2);
T166 = params(1)*y(14)^T161+(1-params(1))*y(15)^T161;
T177 = y(3)^(1-params(3));
T178 = y(25)*T177;
T180 = (y(26)*y(22))^params(3);
T184 = y(4)^(1-params(4));
T185 = y(25)*T184;
T187 = (y(26)*y(23))^params(4);
T202 = T120*(y(26)*y(18)/y(3)-params(7))^2;
T210 = T120*(y(26)*y(19)/y(4)-params(7))^2;
T249 = y(10)^T23/params(1);
T250 = y(14)^T17;
T274 = y(6)*y(8)/y(1);
T280 = y(6)*y(33)/y(7);
lhs =(1-params(10))*y(8);
rhs =T19*params(1)*T24*params(3)*y(25)*y(26)*T37;
residual(1)= lhs-rhs;
lhs =(1-params(10))*y(8);
rhs =y(26)*y(25)*T19*(1-params(1))*T43*params(4)*T54;
residual(2)= lhs-rhs;
lhs =y(24);
rhs =T65*T67;
residual(3)= lhs-rhs;
lhs =T24*params(1)*T18*y(24)/y(13);
rhs =params(1)*T83*T85*T89;
residual(4)= lhs-rhs;
lhs =y(24)*(1+params(6)*(y(26)*y(18)/y(3)-params(7)));
rhs =T83*T123;
residual(5)= lhs-rhs;
lhs =y(24)*(1+params(6)*(y(26)*y(19)/y(4)-params(7)));
rhs =T83*T154;
residual(6)= lhs-rhs;
lhs =y(10);
rhs =y(8)+y(11);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =T166^(params(2)/(params(2)-1));
residual(8)= lhs-rhs;
lhs =y(11);
rhs =y(20)+y(21);
residual(9)= lhs-rhs;
lhs =y(9);
rhs =y(22)+y(23);
residual(10)= lhs-rhs;
lhs =y(16);
rhs =T178*T180;
residual(11)= lhs-rhs;
lhs =y(17);
rhs =T185*T187;
residual(12)= lhs-rhs;
lhs =y(17);
rhs =y(15);
residual(13)= lhs-rhs;
lhs =y(16);
rhs =y(14)+y(2)-y(26)*y(12)/y(13);
residual(14)= lhs-rhs;
lhs =y(18);
rhs =(y(20)+y(3)*(1-params(5))-y(3)*T202)/y(26);
residual(15)= lhs-rhs;
lhs =y(19);
rhs =(y(21)+y(4)*(1-params(5))-y(4)*T210)/y(26);
residual(16)= lhs-rhs;
lhs =y(13);
rhs =params(12)+params(8)*(exp(y(38)-params(9))-1);
residual(17)= lhs-rhs;
lhs =log(y(25));
rhs =params(13)*log(y(5))+params(15)*x(it_, 1);
residual(18)= lhs-rhs;
lhs =log(y(26)/params(7));
rhs =params(14)*log(y(6)/params(7))+params(16)*x(it_, 2);
residual(19)= lhs-rhs;
lhs =y(27);
rhs =T249*T250;
residual(20)= lhs-rhs;
lhs =y(28);
rhs =(1-params(1))/params(1)*(y(15)/y(14))^T23;
residual(21)= lhs-rhs;
lhs =y(33);
rhs =(y(16)+y(17)*y(28))/y(27);
residual(22)= lhs-rhs;
lhs =y(29);
rhs =y(33)-y(8)-y(11);
residual(23)= lhs-rhs;
lhs =y(32);
rhs =y(29)/y(33);
residual(24)= lhs-rhs;
lhs =y(30);
rhs =log(T274);
residual(25)= lhs-rhs;
lhs =y(31);
rhs =log(T280);
residual(26)= lhs-rhs;
lhs =y(34);
rhs =log(y(33));
residual(27)= lhs-rhs;
lhs =y(35);
rhs =log(y(8));
residual(28)= lhs-rhs;
lhs =y(36);
rhs =log(y(11));
residual(29)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(29, 48);

  %
  % Jacobian matrix
  %

T300 = getPowerDeriv(T60,(-params(17)),1);
T331 = (-(getPowerDeriv(1-y(9),1-params(10),1)));
T340 = getPowerDeriv(y(10),T17,1);
T341 = params(10)*(1-y(9))*T340;
T364 = getPowerDeriv(y(37),T17,1);
T395 = getPowerDeriv(y(14),T23,1);
T406 = getPowerDeriv(T166,params(2)/(params(2)-1),1);
T415 = getPowerDeriv(y(15)/y(14),T23,1);
T419 = getPowerDeriv(y(39),T23,1);
T462 = getPowerDeriv(T35,1-params(3),1);
T476 = 2*(y(26)*y(18)/y(3)-params(7));
T501 = 2*(y(43)/y(18)*y(46)-params(7));
T527 = getPowerDeriv(T52,1-params(4),1);
T541 = 2*(y(26)*y(19)/y(4)-params(7));
T566 = 2*(y(46)*y(44)/y(19)-params(7));
T599 = getPowerDeriv(y(26)*y(22),params(3),1);
T610 = getPowerDeriv(y(26)*y(23),params(4),1);
T664 = params(11)*y(45)*getPowerDeriv(y(26),params(10)+params(17)*(-params(10))-1,1);
  g1(1,8)=1-params(10);
  g1(1,9)=(-(T37*y(26)*y(25)*params(3)*T24*params(1)*T18*(-params(10))));
  g1(1,10)=(-(T37*y(26)*y(25)*params(3)*T24*params(1)*T341));
  g1(1,14)=(-(T37*y(26)*y(25)*params(3)*T19*params(1)*T395));
  g1(1,3)=(-(T19*params(1)*T24*params(3)*y(25)*y(26)*1/y(22)/y(26)*T462));
  g1(1,22)=(-(T19*params(1)*T24*params(3)*y(25)*y(26)*T462*(-y(3))/(y(22)*y(22))/y(26)));
  g1(1,25)=(-(T37*T19*params(1)*T24*params(3)*y(26)));
  g1(1,26)=(-(T19*params(1)*T24*params(3)*y(25)*T37+T19*params(1)*T24*params(3)*y(25)*y(26)*T462*(-(y(3)/y(22)))/(y(26)*y(26))));
  g1(2,8)=1-params(10);
  g1(2,9)=(-(T54*y(26)*y(25)*params(4)*T43*(1-params(1))*T18*(-params(10))));
  g1(2,10)=(-(T54*y(26)*y(25)*params(4)*T43*(1-params(1))*T341));
  g1(2,15)=(-(T54*y(26)*y(25)*params(4)*T19*(1-params(1))*getPowerDeriv(y(15),T23,1)));
  g1(2,4)=(-(y(26)*y(25)*T19*(1-params(1))*T43*params(4)*1/y(23)/y(26)*T527));
  g1(2,23)=(-(y(26)*y(25)*T19*(1-params(1))*T43*params(4)*T527*(-y(4))/(y(23)*y(23))/y(26)));
  g1(2,25)=(-(T54*y(26)*T19*(1-params(1))*T43*params(4)));
  g1(2,26)=(-(y(25)*T19*(1-params(1))*T43*params(4)*T54+y(26)*y(25)*T19*(1-params(1))*T43*params(4)*T527*(-(y(4)/y(23)))/(y(26)*y(26))));
  g1(3,8)=(-(T67*params(10)*T59*T59*getPowerDeriv(y(8),params(10),1)*T300+T65*getPowerDeriv(y(8),params(10)-1,1)));
  g1(3,9)=(-(T67*params(10)*(T63*T331+T59*T300*T58*T331)));
  g1(3,24)=1;
  g1(4,10)=T24*params(1)*y(24)*T340/y(13);
  g1(4,37)=(-(T89*params(1)*T83*T364));
  g1(4,13)=(-(T24*params(1)*T18*y(24)))/(y(13)*y(13));
  g1(4,14)=params(1)*T18*y(24)*T395/y(13);
  g1(4,39)=(-(params(1)*T83*T85*T419));
  g1(4,24)=T24*T18*params(1)/y(13);
  g1(4,45)=(-(T89*params(1)*T85*params(11)*T82));
  g1(4,26)=(-(T89*params(1)*T85*T664));
  g1(5,37)=(-(T83*y(41)*(1-params(3))*T89*params(1)*T364/y(18)));
  g1(5,39)=(-(T83*y(41)*(1-params(3))*params(1)*T85*T419/y(18)));
  g1(5,41)=(-(T83*(1-params(3))*T89*params(1)*T85/y(18)));
  g1(5,3)=y(24)*params(6)*y(26)*(-y(18))/(y(3)*y(3));
  g1(5,18)=y(24)*params(6)*y(26)*1/y(3)-T83*((-((1-params(3))*T89*params(1)*T85*y(41)))/(y(18)*y(18))+y(46)*(y(18)*y(43)*params(6)*y(46)*(-y(43))/(y(18)*y(18))-y(43)*params(6)*(y(43)/y(18)*y(46)-params(7)))/(y(18)*y(18))-T120*y(46)*(-y(43))/(y(18)*y(18))*T501);
  g1(5,43)=(-(T83*(y(46)*(params(6)*(y(43)/y(18)*y(46)-params(7))+y(43)*params(6)*y(46)*1/y(18))/y(18)-T120*T501*y(46)*1/y(18))));
  g1(5,24)=1+params(6)*(y(26)*y(18)/y(3)-params(7));
  g1(5,45)=(-(T123*params(11)*T82));
  g1(5,26)=y(24)*params(6)*y(18)/y(3)-T123*T664;
  g1(5,46)=(-(T83*(T117+y(46)*y(43)*params(6)*y(43)/y(18)/y(18)-T120*y(43)/y(18)*T501)));
  g1(6,37)=(-(T83*y(42)*(1-params(4))*T135*(1-params(1))*T364/y(19)));
  g1(6,40)=(-(T83*y(42)*(1-params(4))*(1-params(1))*T85*getPowerDeriv(y(40),T23,1)/y(19)));
  g1(6,42)=(-(T83*(1-params(4))*(1-params(1))*T85*T135/y(19)));
  g1(6,4)=y(24)*params(6)*y(26)*(-y(19))/(y(4)*y(4));
  g1(6,19)=y(24)*params(6)*y(26)*1/y(4)-T83*((-((1-params(4))*(1-params(1))*T85*T135*y(42)))/(y(19)*y(19))+y(46)*(y(19)*y(44)*params(6)*y(46)*(-y(44))/(y(19)*y(19))-y(44)*params(6)*(y(46)*y(44)/y(19)-params(7)))/(y(19)*y(19))-T120*y(46)*(-y(44))/(y(19)*y(19))*T566);
  g1(6,44)=(-(T83*(y(46)*(params(6)*(y(46)*y(44)/y(19)-params(7))+y(44)*params(6)*y(46)*1/y(19))/y(19)-T120*T566*y(46)*1/y(19))));
  g1(6,24)=1+params(6)*(y(26)*y(19)/y(4)-params(7));
  g1(6,45)=(-(T154*params(11)*T82));
  g1(6,26)=y(24)*params(6)*y(19)/y(4)-T154*T664;
  g1(6,46)=(-(T83*(T149+y(46)*y(44)*params(6)*y(44)/y(19)/y(19)-T120*y(44)/y(19)*T566)));
  g1(7,8)=(-1);
  g1(7,10)=1;
  g1(7,11)=(-1);
  g1(8,10)=1;
  g1(8,14)=(-(params(1)*getPowerDeriv(y(14),T161,1)*T406));
  g1(8,15)=(-(T406*(1-params(1))*getPowerDeriv(y(15),T161,1)));
  g1(9,11)=1;
  g1(9,20)=(-1);
  g1(9,21)=(-1);
  g1(10,9)=1;
  g1(10,22)=(-1);
  g1(10,23)=(-1);
  g1(11,16)=1;
  g1(11,3)=(-(T180*y(25)*getPowerDeriv(y(3),1-params(3),1)));
  g1(11,22)=(-(T178*y(26)*T599));
  g1(11,25)=(-(T177*T180));
  g1(11,26)=(-(T178*y(22)*T599));
  g1(12,17)=1;
  g1(12,4)=(-(T187*y(25)*getPowerDeriv(y(4),1-params(4),1)));
  g1(12,23)=(-(T185*y(26)*T610));
  g1(12,25)=(-(T184*T187));
  g1(12,26)=(-(T185*y(23)*T610));
  g1(13,15)=(-1);
  g1(13,17)=1;
  g1(14,2)=(-1);
  g1(14,12)=y(26)/y(13);
  g1(14,13)=(-(y(26)*y(12)))/(y(13)*y(13));
  g1(14,14)=(-1);
  g1(14,16)=1;
  g1(14,26)=y(12)/y(13);
  g1(15,3)=(-((1-params(5)-(T202+y(3)*T120*y(26)*(-y(18))/(y(3)*y(3))*T476))/y(26)));
  g1(15,18)=1-(-(y(3)*T120*T476*y(26)*1/y(3)))/y(26);
  g1(15,20)=(-(1/y(26)));
  g1(15,26)=(-((y(26)*(-(y(3)*T120*y(18)/y(3)*T476))-(y(20)+y(3)*(1-params(5))-y(3)*T202))/(y(26)*y(26))));
  g1(16,4)=(-((1-params(5)-(T210+y(4)*T120*y(26)*(-y(19))/(y(4)*y(4))*T541))/y(26)));
  g1(16,19)=1-(-(y(4)*T120*T541*y(26)*1/y(4)))/y(26);
  g1(16,21)=(-(1/y(26)));
  g1(16,26)=(-((y(26)*(-(y(4)*T120*y(19)/y(4)*T541))-(y(21)+y(4)*(1-params(5))-y(4)*T210))/(y(26)*y(26))));
  g1(17,38)=(-(params(8)*exp(y(38)-params(9))));
  g1(17,13)=1;
  g1(18,5)=(-(params(13)*1/y(5)));
  g1(18,25)=1/y(25);
  g1(18,47)=(-params(15));
  g1(19,6)=(-(params(14)*1/params(7)/(y(6)/params(7))));
  g1(19,26)=1/params(7)/(y(26)/params(7));
  g1(19,48)=(-params(16));
  g1(20,10)=(-(T250*getPowerDeriv(y(10),T23,1)/params(1)));
  g1(20,14)=(-(T249*getPowerDeriv(y(14),T17,1)));
  g1(20,27)=1;
  g1(21,14)=(-((1-params(1))/params(1)*(-y(15))/(y(14)*y(14))*T415));
  g1(21,15)=(-((1-params(1))/params(1)*T415*1/y(14)));
  g1(21,28)=1;
  g1(22,16)=(-(1/y(27)));
  g1(22,17)=(-(y(28)/y(27)));
  g1(22,27)=(-((-(y(16)+y(17)*y(28)))/(y(27)*y(27))));
  g1(22,28)=(-(y(17)/y(27)));
  g1(22,33)=1;
  g1(23,8)=1;
  g1(23,11)=1;
  g1(23,29)=1;
  g1(23,33)=(-1);
  g1(24,29)=(-(1/y(33)));
  g1(24,32)=1;
  g1(24,33)=(-((-y(29))/(y(33)*y(33))));
  g1(25,1)=(-(y(6)*(-y(8))/(y(1)*y(1))/T274));
  g1(25,8)=(-(y(6)*1/y(1)/T274));
  g1(25,6)=(-(y(8)/y(1)/T274));
  g1(25,30)=1;
  g1(26,6)=(-(y(33)/y(7)/T280));
  g1(26,31)=1;
  g1(26,7)=(-(y(6)*(-y(33))/(y(7)*y(7))/T280));
  g1(26,33)=(-(y(6)*1/y(7)/T280));
  g1(27,33)=(-(1/y(33)));
  g1(27,34)=1;
  g1(28,8)=(-(1/y(8)));
  g1(28,35)=1;
  g1(29,11)=(-(1/y(11)));
  g1(29,36)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],29,2304);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],29,110592);
end
end
end
end
