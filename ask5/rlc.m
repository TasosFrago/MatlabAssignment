function rlc()
    w = [-20000*pi:20000*pi];

    R = 2500;
    L = 5e-3;
    C = 10e-6;
    V = 310;

    Zf = @(x) sqrt(R^2 + (x*L - 1./(x*C)).^2);
    phif = @(x) atan((x*L - 1./(x*C))/ R);
    Z = Zf(w);

    % Z = mean(Zf(w));
    % phi = mean(phif(w));

    VRf = @(x) (V*R)./Zf(x);
    VLf = @(x) (V*L*x)./Zf(x);
    VCf = @(x) V.*(1./((x*C).*Zf(x)));

    VR = VRf(w);
    VL = VLf(w);
    VC = VCf(w);
    % max(VL)

    % syms x;
    % zf = Zf(x);
    % vrf = VRf(x);
    % vlf = VLf(x);
    % vcf = VCf(x);

    % ex_point = solve(diff(vlf, x)==0, x);
    % double(ex_point)

    hold on
    % ylim([-400 400]);
    % xlim([-1000 1000]);
    ylim([-40 40]);
    xlim([-100 100]);
    % ylim([0 3500]);
    % xlim([-3000 3000]);
    % plot(w, VR);
    plot(w, VL);
    % plot(w, VC);
    grid on;
    line([0,0], ylim, 'Color', 'k', 'LineWidth', 0.5); % Draw line for Y axis.
    line(xlim, [0,0], 'Color', 'k', 'LineWidth', 0.5); % Draw line for X axis.
    hold off

end
