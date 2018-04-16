function [residual, g1, g2, g3] = junk_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(11, 1);
T28 = params(1)*exp(y(9))*y(1)^(params(1)-1);
T31 = y(7)^(1-params(1));
T36 = y(1)^params(1);
T39 = y(7)^(-params(1));
lhs =y(11);
rhs =y(5)^(-params(4));
residual(1)= lhs-rhs;
lhs =y(12);
rhs =params(10)*exp(y(10));
residual(2)= lhs-rhs;
lhs =y(13);
rhs =T28*T31;
residual(3)= lhs-rhs;
lhs =y(14);
rhs =exp(y(9))*(1-params(1))*T36*T39;
residual(4)= lhs-rhs;
lhs =y(11);
rhs =params(2)*y(15)*(1+y(16)-params(3));
residual(5)= lhs-rhs;
lhs =y(12)/y(11);
rhs =y(14);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =params(6)*y(2)+params(7)*x(it_, 1);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =params(8)*y(3)+params(9)*x(it_, 2);
residual(8)= lhs-rhs;
lhs =y(4);
rhs =T31*exp(y(9))*T36;
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(4)-y(5);
residual(10)= lhs-rhs;
lhs =y(6);
rhs =y(8)+y(1)*(1-params(3));
residual(11)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(11, 18);

  %
  % Jacobian matrix
  %

T84 = params(1)*exp(y(9))*getPowerDeriv(y(1),params(1)-1,1);
T87 = getPowerDeriv(y(1),params(1),1);
T95 = getPowerDeriv(y(7),1-params(1),1);
T98 = getPowerDeriv(y(7),(-params(1)),1);
  g1(1,5)=(-(getPowerDeriv(y(5),(-params(4)),1)));
  g1(1,11)=1;
  g1(2,10)=(-(params(10)*exp(y(10))));
  g1(2,12)=1;
  g1(3,1)=(-(T31*T84));
  g1(3,7)=(-(T28*T95));
  g1(3,9)=(-(T28*T31));
  g1(3,13)=1;
  g1(4,1)=(-(T39*exp(y(9))*(1-params(1))*T87));
  g1(4,7)=(-(exp(y(9))*(1-params(1))*T36*T98));
  g1(4,9)=(-(exp(y(9))*(1-params(1))*T36*T39));
  g1(4,14)=1;
  g1(5,11)=1;
  g1(5,15)=(-(params(2)*(1+y(16)-params(3))));
  g1(5,16)=(-(params(2)*y(15)));
  g1(6,11)=(-y(12))/(y(11)*y(11));
  g1(6,12)=1/y(11);
  g1(6,14)=(-1);
  g1(7,2)=(-params(6));
  g1(7,9)=1;
  g1(7,17)=(-params(7));
  g1(8,3)=(-params(8));
  g1(8,10)=1;
  g1(8,18)=(-params(9));
  g1(9,4)=1;
  g1(9,1)=(-(T31*exp(y(9))*T87));
  g1(9,7)=(-(exp(y(9))*T36*T95));
  g1(9,9)=(-(T31*exp(y(9))*T36));
  g1(10,4)=(-1);
  g1(10,5)=1;
  g1(10,8)=1;
  g1(11,1)=(-(1-params(3)));
  g1(11,6)=1;
  g1(11,8)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(34,3);
T121 = params(1)*exp(y(9))*getPowerDeriv(y(1),params(1)-1,2);
T126 = getPowerDeriv(y(7),1-params(1),2);
T129 = getPowerDeriv(y(1),params(1),2);
T135 = getPowerDeriv(y(7),(-params(1)),2);
  v2(1,1)=1;
  v2(1,2)=77;
  v2(1,3)=(-(getPowerDeriv(y(5),(-params(4)),2)));
  v2(2,1)=2;
  v2(2,2)=172;
  v2(2,3)=(-(params(10)*exp(y(10))));
  v2(3,1)=3;
  v2(3,2)=1;
  v2(3,3)=(-(T31*T121));
  v2(4,1)=3;
  v2(4,2)=109;
  v2(4,3)=(-(T84*T95));
  v2(5,1)=3;
  v2(5,2)=7;
  v2(5,3)=  v2(4,3);
  v2(6,1)=3;
  v2(6,2)=115;
  v2(6,3)=(-(T28*T126));
  v2(7,1)=3;
  v2(7,2)=145;
  v2(7,3)=(-(T31*T84));
  v2(8,1)=3;
  v2(8,2)=9;
  v2(8,3)=  v2(7,3);
  v2(9,1)=3;
  v2(9,2)=151;
  v2(9,3)=(-(T28*T95));
  v2(10,1)=3;
  v2(10,2)=117;
  v2(10,3)=  v2(9,3);
  v2(11,1)=3;
  v2(11,2)=153;
  v2(11,3)=(-(T28*T31));
  v2(12,1)=4;
  v2(12,2)=1;
  v2(12,3)=(-(T39*exp(y(9))*(1-params(1))*T129));
  v2(13,1)=4;
  v2(13,2)=109;
  v2(13,3)=(-(exp(y(9))*(1-params(1))*T87*T98));
  v2(14,1)=4;
  v2(14,2)=7;
  v2(14,3)=  v2(13,3);
  v2(15,1)=4;
  v2(15,2)=115;
  v2(15,3)=(-(exp(y(9))*(1-params(1))*T36*T135));
  v2(16,1)=4;
  v2(16,2)=145;
  v2(16,3)=(-(T39*exp(y(9))*(1-params(1))*T87));
  v2(17,1)=4;
  v2(17,2)=9;
  v2(17,3)=  v2(16,3);
  v2(18,1)=4;
  v2(18,2)=151;
  v2(18,3)=(-(exp(y(9))*(1-params(1))*T36*T98));
  v2(19,1)=4;
  v2(19,2)=117;
  v2(19,3)=  v2(18,3);
  v2(20,1)=4;
  v2(20,2)=153;
  v2(20,3)=(-(exp(y(9))*(1-params(1))*T36*T39));
  v2(21,1)=5;
  v2(21,2)=285;
  v2(21,3)=(-params(2));
  v2(22,1)=5;
  v2(22,2)=268;
  v2(22,3)=  v2(21,3);
  v2(23,1)=6;
  v2(23,2)=191;
  v2(23,3)=(-((-y(12))*(y(11)+y(11))))/(y(11)*y(11)*y(11)*y(11));
  v2(24,1)=6;
  v2(24,2)=209;
  v2(24,3)=(-1)/(y(11)*y(11));
  v2(25,1)=6;
  v2(25,2)=192;
  v2(25,3)=  v2(24,3);
  v2(26,1)=9;
  v2(26,2)=1;
  v2(26,3)=(-(T31*exp(y(9))*T129));
  v2(27,1)=9;
  v2(27,2)=109;
  v2(27,3)=(-(exp(y(9))*T87*T95));
  v2(28,1)=9;
  v2(28,2)=7;
  v2(28,3)=  v2(27,3);
  v2(29,1)=9;
  v2(29,2)=115;
  v2(29,3)=(-(exp(y(9))*T36*T126));
  v2(30,1)=9;
  v2(30,2)=145;
  v2(30,3)=(-(T31*exp(y(9))*T87));
  v2(31,1)=9;
  v2(31,2)=9;
  v2(31,3)=  v2(30,3);
  v2(32,1)=9;
  v2(32,2)=151;
  v2(32,3)=(-(exp(y(9))*T36*T95));
  v2(33,1)=9;
  v2(33,2)=117;
  v2(33,3)=  v2(32,3);
  v2(34,1)=9;
  v2(34,2)=153;
  v2(34,3)=(-(T31*exp(y(9))*T36));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),11,324);
if nargout >= 4,
  %
  % Third order derivatives
  %

  v3 = zeros(87,3);
T162 = getPowerDeriv(y(7),1-params(1),3);
T165 = getPowerDeriv(y(1),params(1),3);
  v3(1,1)=1;
  v3(1,2)=1373;
  v3(1,3)=(-(getPowerDeriv(y(5),(-params(4)),3)));
  v3(2,1)=2;
  v3(2,2)=3088;
  v3(2,3)=(-(params(10)*exp(y(10))));
  v3(3,1)=3;
  v3(3,2)=1;
  v3(3,3)=(-(T31*params(1)*exp(y(9))*getPowerDeriv(y(1),params(1)-1,3)));
  v3(4,1)=3;
  v3(4,2)=1945;
  v3(4,3)=(-(T95*T121));
  v3(5,1)=3;
  v3(5,2)=7;
  v3(5,3)=  v3(4,3);
  v3(6,1)=3;
  v3(6,2)=109;
  v3(6,3)=  v3(4,3);
  v3(7,1)=3;
  v3(7,2)=2053;
  v3(7,3)=(-(T84*T126));
  v3(8,1)=3;
  v3(8,2)=115;
  v3(8,3)=  v3(7,3);
  v3(9,1)=3;
  v3(9,2)=1951;
  v3(9,3)=  v3(7,3);
  v3(10,1)=3;
  v3(10,2)=2059;
  v3(10,3)=(-(T28*T162));
  v3(11,1)=3;
  v3(11,2)=2593;
  v3(11,3)=(-(T31*T121));
  v3(12,1)=3;
  v3(12,2)=9;
  v3(12,3)=  v3(11,3);
  v3(13,1)=3;
  v3(13,2)=145;
  v3(13,3)=  v3(11,3);
  v3(14,1)=3;
  v3(14,2)=2701;
  v3(14,3)=(-(T84*T95));
  v3(15,1)=3;
  v3(15,2)=117;
  v3(15,3)=  v3(14,3);
  v3(16,1)=3;
  v3(16,2)=151;
  v3(16,3)=  v3(14,3);
  v3(17,1)=3;
  v3(17,2)=1953;
  v3(17,3)=  v3(14,3);
  v3(18,1)=3;
  v3(18,2)=2089;
  v3(18,3)=  v3(14,3);
  v3(19,1)=3;
  v3(19,2)=2599;
  v3(19,3)=  v3(14,3);
  v3(20,1)=3;
  v3(20,2)=2707;
  v3(20,3)=(-(T28*T126));
  v3(21,1)=3;
  v3(21,2)=2061;
  v3(21,3)=  v3(20,3);
  v3(22,1)=3;
  v3(22,2)=2095;
  v3(22,3)=  v3(20,3);
  v3(23,1)=3;
  v3(23,2)=2737;
  v3(23,3)=(-(T31*T84));
  v3(24,1)=3;
  v3(24,2)=153;
  v3(24,3)=  v3(23,3);
  v3(25,1)=3;
  v3(25,2)=2601;
  v3(25,3)=  v3(23,3);
  v3(26,1)=3;
  v3(26,2)=2743;
  v3(26,3)=(-(T28*T95));
  v3(27,1)=3;
  v3(27,2)=2097;
  v3(27,3)=  v3(26,3);
  v3(28,1)=3;
  v3(28,2)=2709;
  v3(28,3)=  v3(26,3);
  v3(29,1)=3;
  v3(29,2)=2745;
  v3(29,3)=(-(T28*T31));
  v3(30,1)=4;
  v3(30,2)=1;
  v3(30,3)=(-(T39*exp(y(9))*(1-params(1))*T165));
  v3(31,1)=4;
  v3(31,2)=1945;
  v3(31,3)=(-(T98*exp(y(9))*(1-params(1))*T129));
  v3(32,1)=4;
  v3(32,2)=7;
  v3(32,3)=  v3(31,3);
  v3(33,1)=4;
  v3(33,2)=109;
  v3(33,3)=  v3(31,3);
  v3(34,1)=4;
  v3(34,2)=2053;
  v3(34,3)=(-(exp(y(9))*(1-params(1))*T87*T135));
  v3(35,1)=4;
  v3(35,2)=115;
  v3(35,3)=  v3(34,3);
  v3(36,1)=4;
  v3(36,2)=1951;
  v3(36,3)=  v3(34,3);
  v3(37,1)=4;
  v3(37,2)=2059;
  v3(37,3)=(-(exp(y(9))*(1-params(1))*T36*getPowerDeriv(y(7),(-params(1)),3)));
  v3(38,1)=4;
  v3(38,2)=2593;
  v3(38,3)=(-(T39*exp(y(9))*(1-params(1))*T129));
  v3(39,1)=4;
  v3(39,2)=9;
  v3(39,3)=  v3(38,3);
  v3(40,1)=4;
  v3(40,2)=145;
  v3(40,3)=  v3(38,3);
  v3(41,1)=4;
  v3(41,2)=2701;
  v3(41,3)=(-(exp(y(9))*(1-params(1))*T87*T98));
  v3(42,1)=4;
  v3(42,2)=117;
  v3(42,3)=  v3(41,3);
  v3(43,1)=4;
  v3(43,2)=151;
  v3(43,3)=  v3(41,3);
  v3(44,1)=4;
  v3(44,2)=1953;
  v3(44,3)=  v3(41,3);
  v3(45,1)=4;
  v3(45,2)=2089;
  v3(45,3)=  v3(41,3);
  v3(46,1)=4;
  v3(46,2)=2599;
  v3(46,3)=  v3(41,3);
  v3(47,1)=4;
  v3(47,2)=2707;
  v3(47,3)=(-(exp(y(9))*(1-params(1))*T36*T135));
  v3(48,1)=4;
  v3(48,2)=2061;
  v3(48,3)=  v3(47,3);
  v3(49,1)=4;
  v3(49,2)=2095;
  v3(49,3)=  v3(47,3);
  v3(50,1)=4;
  v3(50,2)=2737;
  v3(50,3)=(-(T39*exp(y(9))*(1-params(1))*T87));
  v3(51,1)=4;
  v3(51,2)=153;
  v3(51,3)=  v3(50,3);
  v3(52,1)=4;
  v3(52,2)=2601;
  v3(52,3)=  v3(50,3);
  v3(53,1)=4;
  v3(53,2)=2743;
  v3(53,3)=(-(exp(y(9))*(1-params(1))*T36*T98));
  v3(54,1)=4;
  v3(54,2)=2097;
  v3(54,3)=  v3(53,3);
  v3(55,1)=4;
  v3(55,2)=2709;
  v3(55,3)=  v3(53,3);
  v3(56,1)=4;
  v3(56,2)=2745;
  v3(56,3)=(-(exp(y(9))*(1-params(1))*T36*T39));
  v3(57,1)=6;
  v3(57,2)=3431;
  v3(57,3)=(y(11)*y(11)*y(11)*y(11)*(-(2*(-y(12))))-(-((-y(12))*(y(11)+y(11))))*(y(11)*y(11)*(y(11)+y(11))+y(11)*y(11)*(y(11)+y(11))))/(y(11)*y(11)*y(11)*y(11)*y(11)*y(11)*y(11)*y(11));
  v3(58,1)=6;
  v3(58,2)=3755;
  v3(58,3)=(y(11)+y(11))/(y(11)*y(11)*y(11)*y(11));
  v3(59,1)=6;
  v3(59,2)=3432;
  v3(59,3)=  v3(58,3);
  v3(60,1)=6;
  v3(60,2)=3449;
  v3(60,3)=  v3(58,3);
  v3(61,1)=9;
  v3(61,2)=1;
  v3(61,3)=(-(T31*exp(y(9))*T165));
  v3(62,1)=9;
  v3(62,2)=1945;
  v3(62,3)=(-(T95*exp(y(9))*T129));
  v3(63,1)=9;
  v3(63,2)=7;
  v3(63,3)=  v3(62,3);
  v3(64,1)=9;
  v3(64,2)=109;
  v3(64,3)=  v3(62,3);
  v3(65,1)=9;
  v3(65,2)=2053;
  v3(65,3)=(-(exp(y(9))*T87*T126));
  v3(66,1)=9;
  v3(66,2)=115;
  v3(66,3)=  v3(65,3);
  v3(67,1)=9;
  v3(67,2)=1951;
  v3(67,3)=  v3(65,3);
  v3(68,1)=9;
  v3(68,2)=2059;
  v3(68,3)=(-(exp(y(9))*T36*T162));
  v3(69,1)=9;
  v3(69,2)=2593;
  v3(69,3)=(-(T31*exp(y(9))*T129));
  v3(70,1)=9;
  v3(70,2)=9;
  v3(70,3)=  v3(69,3);
  v3(71,1)=9;
  v3(71,2)=145;
  v3(71,3)=  v3(69,3);
  v3(72,1)=9;
  v3(72,2)=2701;
  v3(72,3)=(-(exp(y(9))*T87*T95));
  v3(73,1)=9;
  v3(73,2)=117;
  v3(73,3)=  v3(72,3);
  v3(74,1)=9;
  v3(74,2)=151;
  v3(74,3)=  v3(72,3);
  v3(75,1)=9;
  v3(75,2)=1953;
  v3(75,3)=  v3(72,3);
  v3(76,1)=9;
  v3(76,2)=2089;
  v3(76,3)=  v3(72,3);
  v3(77,1)=9;
  v3(77,2)=2599;
  v3(77,3)=  v3(72,3);
  v3(78,1)=9;
  v3(78,2)=2707;
  v3(78,3)=(-(exp(y(9))*T36*T126));
  v3(79,1)=9;
  v3(79,2)=2061;
  v3(79,3)=  v3(78,3);
  v3(80,1)=9;
  v3(80,2)=2095;
  v3(80,3)=  v3(78,3);
  v3(81,1)=9;
  v3(81,2)=2737;
  v3(81,3)=(-(T31*exp(y(9))*T87));
  v3(82,1)=9;
  v3(82,2)=153;
  v3(82,3)=  v3(81,3);
  v3(83,1)=9;
  v3(83,2)=2601;
  v3(83,3)=  v3(81,3);
  v3(84,1)=9;
  v3(84,2)=2743;
  v3(84,3)=(-(exp(y(9))*T36*T95));
  v3(85,1)=9;
  v3(85,2)=2097;
  v3(85,3)=  v3(84,3);
  v3(86,1)=9;
  v3(86,2)=2709;
  v3(86,3)=  v3(84,3);
  v3(87,1)=9;
  v3(87,2)=2745;
  v3(87,3)=(-(T31*exp(y(9))*T36));
  g3 = sparse(v3(:,1),v3(:,2),v3(:,3),11,5832);
end
end
end
end