function [resX, resY, n] = newtonRaphson(f, g, x0, y0)

    tol = 1e-6;
    n = 1; % number of iterations

    resX = [];
    resY = [];

    syms x y;

    fdirX = diff(f, x);
    fdirY = diff(f, y);

    gdirX = diff(g, x);
    gdirY = diff(g, y);

    pX = 0;
    pY = 0;
    denom = 0;
    while(abs(pX - x0) < tol) || (abs(pY - y0) < tol)
        fC = double(subs(f, [x , y], [x0, y0]));
        gC = double(subs(g, [x , y], [x0, y0]));

        fdCX = double(subs(fdirX, [x , y], [x0, y0]));
        fdCY = double(subs(fdirY, [x , y], [x0, y0]));

        gdCX = double(subs(gdirX, [x , y], [x0, y0]));
        gdCY = double(subs(gdirY, [x , y], [x0, y0]));

        denom = fdCX * gdCY - gdCX * fdCY;
        pX = x0 - (fC * gdCY - gC * fdCY)/denom
        pY = y0 - (gC * fdCX - fC * gdCX)/denom

        resX(n) = double(pX);
        resY(n) = double(pY);

        x0 = pX;
        y0 = pY;
        n = n + 1;
        if(n > 2)
            disp('break');
            break
        end
    end
end
