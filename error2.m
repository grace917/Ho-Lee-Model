function error2 = error2(theta)
% function error2 = error2(theta)
% Monday, 03 Oct, 2022
% Yi Li
% INPUTS: theta
% OUTPUTS: error2

r_0 = 0.0173994664;
r_1u = 0.0374713845;
r_1d = 0.0130054899;
p_2_market = 96.1462;
vol = 0.0173;
delta = 0.5;

theta_2 = theta;

r_2uu = r_1u + theta_2*delta + vol*delta^0.5;
r_2ud = r_1u + theta_2*delta - vol*delta^0.5;
r_2dd = r_1d + theta_2*delta - vol*delta^0.5;

p_2uu = 100*exp(-r_2uu*delta);
p_2ud = 100*exp(-r_2ud*delta);
p_2dd = 100*exp(-r_2dd*delta);

p_2u = (1/2)*p_2uu*exp(-r_1u*delta) + (1/2)*p_2ud*exp(-r_1u*delta);
p_2d = (1/2)*p_2ud*exp(-r_1d*delta) + (1/2)*p_2dd*exp(-r_1d*delta);

p_2_model = (1/2)*p_2u*exp(-r_0*delta) + (1/2)*p_2d*exp(-r_0*delta);

error2 = (p_2_model - p_2_market)^2;

end