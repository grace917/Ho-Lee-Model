% Calibrate theta_1: Given current market price p_1_market of zero-coupon bond with 1-year maturity, knowing fixed annual vol and delta
%                    Assuming interest rate tree follows Ho and Lee with varying theta_t with initial guess theta_1=0.012                                                     
%                    First get: r_1u, r_1d
%                    Second get: p_1u, p_1d, p_1_model
%                    Third: using p_1_model=p_1_market to obtain theta_1
%                    Forth: using theta_1 obtaining interest_Tree_1 and bond_Tree_1
p_1_market = 97.8925;
vol = 0.0173;
delta = 0.5;

theta_1 = 0.012;

r_1u = r_0 + theta_1*delta + vol*delta^0.5;
r_1d = r_0 + theta_1*delta - vol*delta^0.5;

p_1u = 100*exp(-r_1u*delta);
p_1d = 100*exp(-r_1d*delta);

p_1_model = (1/2)*p_1u*exp(-r_0*delta) + (1/2)*p_1d*exp(-r_0*delta);

error1 = (p_1_model - p_1_market)^2;

% We write the function for error1 following the above steps