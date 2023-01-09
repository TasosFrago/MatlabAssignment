function rlc()
    w = [-20000*pi:100*pi:20000*pi];

    R = 2500;
    L = 5e-3;
    C = 10e-6;
    V = 310;

    Zf = @(x) sqrt(R^2 + (x*L - 1./(x*C)).^2);
    phif = @(x) atan((x*L - 1./(x*C))/ R);

    Z = Zf(w);
    phi = phif(w);

    VRf = @(x) V*R./Zf(x);
    VLf = @(x) V.*x*L./Zf(x);
    VCf = @(x) V./(x.*C.*Zf(x));

    VR = VRf(w);
    VL = VLf(w);
    VC = VCf(w);

    hold on
    plot(VR, w);
    plot(VL, w);
    plot(VC, w);
    hold off

end
