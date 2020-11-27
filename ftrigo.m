function [fx] = ftrigo(x)
% Función f: R^n--->R con la cosecha del trigo
t= [1:24]'; % Línea del tiempo
% Datos de la cosecha por año por tonelada por hectárea
y=[11.72 13.38 14.1 13.87 14.8 15.58 14.36 16.3 16.91 18.16 18.43 18.7];
y=[y 20.46 19.16 20.01 22.41 21.21 22.81 23.97 23.27 23.8 25.59 24.93 26.59]';

% función c(t) = x(3)/(1+x(2)*exp(-x(1)*t));

fx=0;
a = x(1); b= x(2); c1= x(3);
for k=1:24
    % Calculamos el valor de la función logística en el tiempo k
    nv= c1/(1+b*exp(-a*t(k)));
    % Calculamos la diferencia con respecto al valor observado en el tiempo
    % k
    nv= nv - y(k);
    % k-ésimo residual al cuadrado
    nv=nv*nv;
    fx= fx+nv;
end
fx = fx/2;
end