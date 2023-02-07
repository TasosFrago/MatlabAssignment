function rlc()
% RLC - The function models the behavior of a simple RLC circuit
% by calculating the impedance magnitude and angle, voltages across
% the resistor, inductor, and capacitor and the resonant frequency.
% The results are plotted and displayed in the console

    % Define the circuit parameters
    R = 2500;
    L = 5e-3;
    C = 10e-6;
    V = 310;

    % Define angular frequency range
    omega = [-20000*pi:20000*pi];

    % Define functions with the formulas given for the Z
    Zf = @(x) sqrt(R^2 + (x*L - 1./(x*C)).^2);
    phif = @(x) atan((x*L - 1./(x*C))/ R);

    % Calculate the impedance magnitude and angle
    Z = Zf(omega);
    phi = phif(omega);

    % Define functions with the formulas given for the voltages
    VRf = @(x) (V*R)./Zf(x);
    VLf = @(x) (V*L*x)./Zf(x);
    VCf = @(x) V.*(1./((x*C).*Zf(x)));

    % Calculate the voltages across R, L and C
    VR = VRf(omega);
    VL = VLf(omega);
    VC = VCf(omega);

    % Plot impedance magnitude and angle
    figure;
    subplot(1,2,1);
    hold on
    ylim([2497 2530])
    xlim([-6e4 6e4])
    plot(omega, Z);
    title('Impedance Magnitude');
    xlabel('\omega (rad/s)');
    ylabel('Impedance (Ohms)');
    grid on;
    hold off

    subplot(1,2,2);
    hold on
    ylim([-0.15 0.3])
    xlim([-6e4 6e4]);
    plot(omega, phi);
    title('Impedance Angle');
    xlabel('\omega (rad/s)');
    ylabel('Impedance Angle (rad)');
    grid on;
    hold off

    % Plot voltages
    figure;
    hold on
    ylim([-400 400]);
    xlim([-1000 1000]);
    plot(omega, VR, 'r', omega, VL, 'g', omega, VC, 'b');
    legend('VR', 'VL', 'VC');
    title('Voltages across R, L and C');
    xlabel('\omega (rad/s)');
    ylabel('Voltage (V)');
    grid on;
    hold off

    % Find resonant frequency
    [~, idx] = max(abs(VL));
    omega_r = omega(idx);

    % Calculate voltages at resonant frequency
    Z_r = Z(idx);
    VR_r = VR(idx);
    VL_r = VL(idx);
    VC_r = VC(idx);

    % Display results
    fprintf("Resonant Angular Frequency: %.4f rad/s\n", omega_r);
    fprintf("Voltage Across R at Resonance: %.4f V\n", VR_r);
    fprintf("Voltage Across L at Resonance: %.4f V\n", VL_r);
    fprintf("Voltage Across C at Resonance: %.4f V\n", VC_r);
end
