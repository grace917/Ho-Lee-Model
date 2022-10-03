function error3 = error3(theta)
% function error3 = error3(theta)
% Monday, 03 Oct, 2022
% Yi Li
% INPUTS: theta
% OUTPUTS: error2

r_0 = 0.0173994664;
r_1u = 0.0374713845;
r_1d = 0.0130054899;
r_2uu = 0.0606155122;
r_2ud = 0.0361496176;
r_2dd = 0.0116837230;
p_3_market = 94.1011;
vol = 0.0173;
delta = 0.5;

theta_3 = theta;

r_3uuu = r_2uu + theta_3*delta + vol*delta^0.5;
r_3uud = r_2uu + theta_3*delta - vol*delta^0.5;
r_3ddu = r_2dd + theta_3*delta + vol*delta^0.5;
r_3ddd = r_2dd + theta_3*delta - vol*delta^0.5;

p_3uuu = 100*exp(-r_3uuu*delta);
p_3uud = 100*exp(-r_3uud*delta);
p_3ddu = 100*exp(-r_3ddu*delta);
p_3ddd = 100*exp(-r_3ddd*delta);

p_3uu = (1/2)*p_3uuu*exp(-r_2uu*delta) + (1/2)*p_3uud*exp(-r_2uu*delta);
p_3ud = (1/2)*p_3uud*exp(-r_2ud*delta) + (1/2)*p_3ddu*exp(-r_2ud*delta);
p_3dd = (1/2)*p_3ddu*exp(-r_2dd*delta) + (1/2)*p_3ddd*exp(-r_2dd*delta);

p_3u = (1/2)*p_3uu*exp(-r_1u*delta) + (1/2)*p_3ud*exp(-r_1u*delta);
p_3d = (1/2)*p_3ud*exp(-r_1d*delta) + (1/2)*p_3dd*exp(-r_1d*delta);

p_3_model = (1/2)*p_3u*exp(-r_0*delta) + (1/2)*p_3d*exp(-r_0*delta);

error3 = (p_3_model - p_3_market)^2;

end