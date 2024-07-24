function output=emf_decoupling(V,X,SF_option)
sx=2.8343449828894879741695254920174/1000;
X_=max(sx,X);
h=0.0015;a=0.004; %unit m
y=(X_.^2+a^2).^(-1.5)-((X_-h).^2+a^2).^(-1.5);
Term = 2180*pi*(0.009^2+0.0015^2)/2*1.032*4*pi*1.05/10*a^2/2;
emf = -V.*y.*Term; %unit mV
if SF_option==1
    d=X*1000;%unit mm
    v=V*1000;
    P=[0.2170  -11.8572];
    x2_d=[3.794558e+01,1.104246e+00];
    x2_k=[-4.338194e+00,-5.936298e-02];
    sf_d=x2_d(1)*exp(-d)+x2_d(2);
    sf_k=(x2_k(1)*exp(-d)+x2_k(2)).*(v+P(1)*d+P(2));
    sf=sf_d+sf_k;
    emf_sf=sf.*emf;
    output=emf_sf;
else
    output=emf;
end
end