function [residual, g1, g2, g3] = Q502_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 29, 1);

%
% Model equations
%

T17 = 1/params(2);
T18 = y(3)^T17;
T19 = params(10)*(1-y(2))*T18;
T23 = (-1)/params(2);
T24 = y(7)^T23;
T35 = y(11)/y(15)/y(19);
T37 = T35^(1-params(3));
T43 = y(8)^T23;
T52 = y(12)/y(16)/y(19);
T54 = T52^(1-params(4));
T58 = (1-y(2))^(1-params(10));
T59 = y(1)^params(10);
T60 = T58*T59;
T63 = T60^(-params(17));
T65 = params(10)*T58*T63;
T67 = y(1)^(params(10)-1);
T81 = y(19)^(params(10)+params(17)*(-params(10))-1);
T82 = y(17)*params(11)*T81;
T108 = params(6)/2*(y(19)-params(7))^2;
T109 = 1+(1-params(3))*T24*T18*params(1)*y(9)/y(11)-params(5)+y(19)*y(11)*params(6)*(y(19)-params(7))/y(11)-T108;
T124 = 1+(1-params(4))*T43*T18*(1-params(1))*y(10)/y(12)-params(5)+y(19)*y(12)*params(6)*(y(19)-params(7))/y(12)-T108;
T131 = (params(2)-1)/params(2);
T136 = params(1)*y(7)^T131+(1-params(1))*y(8)^T131;
T146 = y(11)^(1-params(3));
T147 = y(18)*T146;
T149 = (y(19)*y(15))^params(3);
T152 = y(12)^(1-params(4));
T153 = y(18)*T152;
T155 = (y(19)*y(16))^params(4);
T206 = y(3)^T23/params(1);
T207 = y(7)^T17;
lhs =(1-params(10))*y(1);
rhs =T19*params(1)*T24*params(3)*y(18)*y(19)*T37;
residual(1)= lhs-rhs;
lhs =(1-params(10))*y(1);
rhs =y(19)*y(18)*T19*(1-params(1))*T43*params(4)*T54;
residual(2)= lhs-rhs;
lhs =y(17);
rhs =T65*T67;
residual(3)= lhs-rhs;
lhs =T24*params(1)*T18*y(17)/y(6);
rhs =T24*params(1)*T18*T82;
residual(4)= lhs-rhs;
lhs =y(17)*(1+params(6)*(y(19)-params(7)));
rhs =T82*T109;
residual(5)= lhs-rhs;
lhs =y(17)*(1+params(6)*(y(19)-params(7)));
rhs =T82*T124;
residual(6)= lhs-rhs;
lhs =y(3);
rhs =y(1)+y(4);
residual(7)= lhs-rhs;
lhs =y(3);
rhs =T136^(params(2)/(params(2)-1));
residual(8)= lhs-rhs;
lhs =y(4);
rhs =y(13)+y(14);
residual(9)= lhs-rhs;
lhs =y(2);
rhs =y(15)+y(16);
residual(10)= lhs-rhs;
lhs =y(9);
rhs =T147*T149;
residual(11)= lhs-rhs;
lhs =y(10);
rhs =T153*T155;
residual(12)= lhs-rhs;
lhs =y(10);
rhs =y(8);
residual(13)= lhs-rhs;
lhs =y(9);
rhs =y(7)+y(5)-y(19)*y(5)/y(6);
residual(14)= lhs-rhs;
lhs =y(11);
rhs =(y(13)+y(11)*(1-params(5))-y(11)*T108)/y(19);
residual(15)= lhs-rhs;
lhs =y(12);
rhs =(y(14)+y(12)*(1-params(5))-y(12)*T108)/y(19);
residual(16)= lhs-rhs;
lhs =y(6);
rhs =params(12)+params(8)*(exp(y(5)-params(9))-1);
residual(17)= lhs-rhs;
lhs =log(y(18));
rhs =log(y(18))*params(13)+params(15)*x(1);
residual(18)= lhs-rhs;
lhs =log(y(19)/params(7));
rhs =log(y(19)/params(7))*params(14)+params(16)*x(2);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =T206*T207;
residual(20)= lhs-rhs;
lhs =y(21);
rhs =(1-params(1))/params(1)*(y(8)/y(7))^T23;
residual(21)= lhs-rhs;
lhs =y(26);
rhs =(y(9)+y(10)*y(21))/y(20);
residual(22)= lhs-rhs;
lhs =y(22);
rhs =y(26)-y(1)-y(4);
residual(23)= lhs-rhs;
lhs =y(25);
rhs =y(22)/y(26);
residual(24)= lhs-rhs;
lhs =y(23);
rhs =log(y(19));
residual(25)= lhs-rhs;
lhs =y(24);
rhs =log(y(19));
residual(26)= lhs-rhs;
lhs =y(27);
rhs =log(y(26));
residual(27)= lhs-rhs;
lhs =y(28);
rhs =log(y(1));
residual(28)= lhs-rhs;
lhs =y(29);
rhs =log(y(4));
residual(29)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(29, 29);

  %
  % Jacobian matrix
  %

T244 = getPowerDeriv(T60,(-params(17)),1);
T271 = (-(getPowerDeriv(1-y(2),1-params(10),1)));
T280 = getPowerDeriv(y(3),T17,1);
T281 = params(10)*(1-y(2))*T280;
T335 = getPowerDeriv(y(7),T23,1);
T354 = getPowerDeriv(T136,params(2)/(params(2)-1),1);
T363 = getPowerDeriv(y(8)/y(7),T23,1);
T367 = getPowerDeriv(y(8),T23,1);
T400 = getPowerDeriv(T35,1-params(3),1);
T418 = getPowerDeriv(T52,1-params(4),1);
T432 = (-(1/y(19)));
T440 = getPowerDeriv(y(19)*y(15),params(3),1);
T451 = getPowerDeriv(y(19)*y(16),params(4),1);
T494 = y(17)*params(11)*getPowerDeriv(y(19),params(10)+params(17)*(-params(10))-1,1);
T505 = params(6)/2*2*(y(19)-params(7));
T541 = 1/params(7)/(y(19)/params(7));
  g1(1,1)=1-params(10);
  g1(1,2)=(-(T37*y(19)*y(18)*params(3)*T24*params(1)*T18*(-params(10))));
  g1(1,3)=(-(T37*y(19)*y(18)*params(3)*T24*params(1)*T281));
  g1(1,7)=(-(T37*y(19)*y(18)*params(3)*T19*params(1)*T335));
  g1(1,11)=(-(T19*params(1)*T24*params(3)*y(18)*y(19)*1/y(15)/y(19)*T400));
  g1(1,15)=(-(T19*params(1)*T24*params(3)*y(18)*y(19)*T400*(-y(11))/(y(15)*y(15))/y(19)));
  g1(1,18)=(-(T37*T19*params(1)*T24*params(3)*y(19)));
  g1(1,19)=(-(T19*params(1)*T24*params(3)*y(18)*T37+T19*params(1)*T24*params(3)*y(18)*y(19)*T400*(-(y(11)/y(15)))/(y(19)*y(19))));
  g1(2,1)=1-params(10);
  g1(2,2)=(-(T54*y(19)*y(18)*params(4)*T43*(1-params(1))*T18*(-params(10))));
  g1(2,3)=(-(T54*y(19)*y(18)*params(4)*T43*(1-params(1))*T281));
  g1(2,8)=(-(T54*y(19)*y(18)*params(4)*T19*(1-params(1))*T367));
  g1(2,12)=(-(y(19)*y(18)*T19*(1-params(1))*T43*params(4)*1/y(16)/y(19)*T418));
  g1(2,16)=(-(y(19)*y(18)*T19*(1-params(1))*T43*params(4)*T418*(-y(12))/(y(16)*y(16))/y(19)));
  g1(2,18)=(-(T54*y(19)*T19*(1-params(1))*T43*params(4)));
  g1(2,19)=(-(y(18)*T19*(1-params(1))*T43*params(4)*T54+y(19)*y(18)*T19*(1-params(1))*T43*params(4)*T418*(-(y(12)/y(16)))/(y(19)*y(19))));
  g1(3,1)=(-(T67*params(10)*T58*T58*getPowerDeriv(y(1),params(10),1)*T244+T65*getPowerDeriv(y(1),params(10)-1,1)));
  g1(3,2)=(-(T67*params(10)*(T63*T271+T58*T244*T59*T271)));
  g1(3,17)=1;
  g1(4,3)=T24*params(1)*y(17)*T280/y(6)-T24*params(1)*T82*T280;
  g1(4,6)=(-(T24*params(1)*T18*y(17)))/(y(6)*y(6));
  g1(4,7)=params(1)*T18*y(17)*T335/y(6)-params(1)*T18*T82*T335;
  g1(4,17)=T24*T18*params(1)/y(6)-T24*params(1)*T18*params(11)*T81;
  g1(4,19)=(-(T24*params(1)*T18*T494));
  g1(5,3)=(-(T82*y(9)*(1-params(3))*T24*params(1)*T280/y(11)));
  g1(5,7)=(-(T82*y(9)*(1-params(3))*T18*params(1)*T335/y(11)));
  g1(5,9)=(-(T82*(1-params(3))*T24*T18*params(1)/y(11)));
  g1(5,11)=(-(T82*(-((1-params(3))*T24*T18*params(1)*y(9)))/(y(11)*y(11))));
  g1(5,17)=1+params(6)*(y(19)-params(7))-T109*params(11)*T81;
  g1(5,19)=y(17)*params(6)-(T109*T494+T82*(y(11)*params(6)*(y(19)-params(7))/y(11)+y(19)*y(11)*params(6)/y(11)-T505));
  g1(6,3)=(-(T82*y(10)*(1-params(4))*T43*(1-params(1))*T280/y(12)));
  g1(6,8)=(-(T82*y(10)*(1-params(4))*T18*(1-params(1))*T367/y(12)));
  g1(6,10)=(-(T82*(1-params(4))*T43*T18*(1-params(1))/y(12)));
  g1(6,12)=(-(T82*(-((1-params(4))*T43*T18*(1-params(1))*y(10)))/(y(12)*y(12))));
  g1(6,17)=1+params(6)*(y(19)-params(7))-T124*params(11)*T81;
  g1(6,19)=y(17)*params(6)-(T124*T494+T82*(y(12)*params(6)*(y(19)-params(7))/y(12)+y(19)*y(12)*params(6)/y(12)-T505));
  g1(7,1)=(-1);
  g1(7,3)=1;
  g1(7,4)=(-1);
  g1(8,3)=1;
  g1(8,7)=(-(params(1)*getPowerDeriv(y(7),T131,1)*T354));
  g1(8,8)=(-(T354*(1-params(1))*getPowerDeriv(y(8),T131,1)));
  g1(9,4)=1;
  g1(9,13)=(-1);
  g1(9,14)=(-1);
  g1(10,2)=1;
  g1(10,15)=(-1);
  g1(10,16)=(-1);
  g1(11,9)=1;
  g1(11,11)=(-(T149*y(18)*getPowerDeriv(y(11),1-params(3),1)));
  g1(11,15)=(-(T147*y(19)*T440));
  g1(11,18)=(-(T146*T149));
  g1(11,19)=(-(T147*y(15)*T440));
  g1(12,10)=1;
  g1(12,12)=(-(T155*y(18)*getPowerDeriv(y(12),1-params(4),1)));
  g1(12,16)=(-(T153*y(19)*T451));
  g1(12,18)=(-(T152*T155));
  g1(12,19)=(-(T153*y(16)*T451));
  g1(13,8)=(-1);
  g1(13,10)=1;
  g1(14,5)=(-(1-y(19)/y(6)));
  g1(14,6)=(-(y(19)*y(5)))/(y(6)*y(6));
  g1(14,7)=(-1);
  g1(14,9)=1;
  g1(14,19)=y(5)/y(6);
  g1(15,11)=1-(1-params(5)-T108)/y(19);
  g1(15,13)=T432;
  g1(15,19)=(-((y(19)*(-(y(11)*T505))-(y(13)+y(11)*(1-params(5))-y(11)*T108))/(y(19)*y(19))));
  g1(16,12)=1-(1-params(5)-T108)/y(19);
  g1(16,14)=T432;
  g1(16,19)=(-((y(19)*(-(y(12)*T505))-(y(14)+y(12)*(1-params(5))-y(12)*T108))/(y(19)*y(19))));
  g1(17,5)=(-(params(8)*exp(y(5)-params(9))));
  g1(17,6)=1;
  g1(18,18)=1/y(18)-params(13)*1/y(18);
  g1(19,19)=T541-params(14)*T541;
  g1(20,3)=(-(T207*getPowerDeriv(y(3),T23,1)/params(1)));
  g1(20,7)=(-(T206*getPowerDeriv(y(7),T17,1)));
  g1(20,20)=1;
  g1(21,7)=(-((1-params(1))/params(1)*(-y(8))/(y(7)*y(7))*T363));
  g1(21,8)=(-((1-params(1))/params(1)*T363*1/y(7)));
  g1(21,21)=1;
  g1(22,9)=(-(1/y(20)));
  g1(22,10)=(-(y(21)/y(20)));
  g1(22,20)=(-((-(y(9)+y(10)*y(21)))/(y(20)*y(20))));
  g1(22,21)=(-(y(10)/y(20)));
  g1(22,26)=1;
  g1(23,1)=1;
  g1(23,4)=1;
  g1(23,22)=1;
  g1(23,26)=(-1);
  g1(24,22)=(-(1/y(26)));
  g1(24,25)=1;
  g1(24,26)=(-((-y(22))/(y(26)*y(26))));
  g1(25,19)=T432;
  g1(25,23)=1;
  g1(26,19)=T432;
  g1(26,24)=1;
  g1(27,26)=(-(1/y(26)));
  g1(27,27)=1;
  g1(28,1)=(-(1/y(1)));
  g1(28,28)=1;
  g1(29,4)=(-(1/y(4)));
  g1(29,29)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],29,841);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],29,24389);
end
end
end
end
