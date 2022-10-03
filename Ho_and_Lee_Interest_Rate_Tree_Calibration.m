% Step1: Given current market price p_0_market of zero-coupon bond with 6-month maturity 
%        Obtain r_0                                                         
%        Using: p_0*exp(r_0*0.5)=100
p_0_market = 99.1338;
r_0 = log(100/p_0_market)/0.5;
sprintf('%.10f',r_0)

% Step2: Given current market price p_1_market of zero-coupon bond with 1-year maturity, knowing fixed annual vol and delta
%        Assuming interest rate tree follows Ho and Lee with varying theta_t with initial guess theta_1=0.012                                                     
%        First get theta_1: by first obtaining r_1u, r_1d; then p_1u, p_1d, p_1_model, next using p_1_model(97.8925)=p_1_market to obtain theta_1
%        Second: using theta_1 obtaining interest_Tree_1

vol = 0.0173;
delta = 0.5;

theta_1 = 0.012;

[theta_1_opt, error1_opt] = fmincon('error1',theta_1,[],[]);
sprintf('%.10f',theta_1_opt)

%Interest Tree 1 with T=1
r_1u = r_0 + theta_1_opt*delta + vol*delta^0.5;
r_1d = r_0 + theta_1_opt*delta - vol*delta^0.5;
sprintf('%.10f',r_1u, "" , r_1d)

% Step3: Given current market price p_2_market of zero-coupon bond(96.1462) with 1.5-year maturity, knowing fixed annual vol and delta
%        Assuming interest rate tree follows Ho and Lee with varying theta_t with initial guess theta_2=0.017   
%        Knowing: r_1u, r_1d; First get: r_2uu, r_2dd, r_2ud(=r_2du); then get: p_2uu, p_2dd, p_2ud(=p_2du), p_2u, p_2d, p_2_model; next: using p_2_model=p_2_market to obtain theta_2
%                 last, using theta_2 obtaining interest_Tree_2 and bond_Tree_2
%        Second: using theta_2 obtaining interest_Tree_2

theta_2 = 0.017;

[theta_2_opt, error2_opt] = fmincon('error2',theta_2,[],[]);
sprintf('%.10f',theta_2_opt)

%Interest Tree 2 with T=1.5
r_1u = 0.0374713845; %already known
r_1d = 0.0130054899; %already known

r_2uu = r_1u + theta_2_opt*delta + vol*delta^0.5;
r_2ud = r_1u + theta_2_opt*delta - vol*delta^0.5;
r_2dd = r_1d + theta_2_opt*delta - vol*delta^0.5;
sprintf('%.10f',r_2uu, "" , r_2ud, "" , r_2dd)

% Step4: Given current market price p_3_market of zero-coupon bond(94.1011) with 2-year maturity, knowing fixed annual vol and delta
%                    Assuming interest rate tree follows Ho and Lee with varying theta_t with initial guess theta_3=0.011   
%                    Knowing: r_1u, r_1d, r_2uu, r_2dd, r_2ud(=r_2du); First get: r_3uuu, r_3ddd, r_3uud(=r_3duu), r_3ddu(=r_3dud); then get: p_3uuu, p_3ddd, p_3uud(=p_3duu), p_3ddu(=p_3dud), p_3uu, p_3dd, p_3ud(=p_3du), p_3u, p_3d, p_3_model; next: using p_3_model=p_3_market to obtain theta_3
%                    Second: using theta_3 obtaining interest_Tree_3

theta_3 = 0.011;

[theta_3_opt, error3_opt] = fmincon('error3',theta_3,[],[]);
sprintf('%.10f',theta_3_opt)

%Interest Tree 3 with T=2
r_1u = 0.0374713845; %already known
r_1d = 0.0130054899; %already known
r_2uu = 0.0606155122; %already known
r_2ud = 0.0361496176; %already known
r_2dd = 0.0116837230; %already known

r_3uuu = r_2uu + theta_3_opt*delta + vol*delta^0.5;
r_3uud = r_2uu + theta_3_opt*delta - vol*delta^0.5;
r_3ddu = r_2dd + theta_3_opt*delta + vol*delta^0.5;
r_3ddd = r_2dd + theta_3_opt*delta - vol*delta^0.5;
sprintf('%.10f',r_3uuu, "" , r_3uud, "" , r_3ddu, "" , r_3ddd)