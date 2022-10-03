function error1 = error1(theta)
% function error1 = error1(theta)
% Monday, 03 Oct, 2022
% Yi Li
% INPUTS: theta
% OUTPUTS: error1

r_0 = 0.0173994664;
p_1_market = 97.8925;
vol = 0.0173;
delta = 0.5;

theta_1 = theta;

r_1u = r_0 + theta_1*delta + vol*delta^0.5;
r_1d = r_0 + theta_1*delta - vol*delta^0.5;

p_1u = 100*exp(-r_1u*delta);
p_1d = 100*exp(-r_1d*delta);

p_1_model = (1/2)*p_1u*exp(-r_0*delta) + (1/2)*p_1d*exp(-r_0*delta);

error1 = (p_1_model - p_1_market)^2;

end