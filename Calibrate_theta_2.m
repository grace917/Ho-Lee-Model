% Calibrate theta_2: Given current market price p_2_market of zero-coupon bond(96.1462) with 1.5-year maturity, knowing fixed annual vol and delta
%                    Assuming interest rate tree follows Ho and Lee with varying theta_t with initial guess theta_2=0.017   
%                    Knowing: r_1u, r_1d
%                    First get: r_2uu, r_2dd, r_2ud(=r_2du)
%                    Second get: p_2uu, p_2dd, p_2ud(=p_2du), p_2u, p_2d, p_2_model
%                    Third: using p_2_model=p_2_market to obtain theta_2
%                    Forth: using theta_2 obtaining interest_Tree_2 and bond_Tree_2
p_2_market = 96.1462;
vol = 0.0173;
delta = 0.5;
r_0 = 0.0173994664;

r_1u = 0.0374713845;
r_1d = 0.0130054899;

theta_2 = 0.017;

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

% We write the function for error2 following the above steps