function [jh] = jacobiana(hx,x0)
% Calcula la matriz jacobiana de hx
% Entradas:
% hx.- cadena de caracteres con el nombre de la función
% x0.- vector columna de dimensión n
% Salidas:
% jh.- la matriz jacobiana de la función evaluada en el punto x0

n = length(x0);             % dimensión de dominio de h   
h = feval(hx, x0);          % valor de la función en el punto x0
m = length(h);              % dimensión de la imagen de h
ep = 1e-05;
jh = zeros(m,n);            % inicializamos la matriz jacobiana

for j = 1:n
    y = x0; 
    y(j)=y(j) + ep;         % punto en la dirección j
    hy = feval(hx,y);       % evaluación en la dirección j
    jh(:,j) = (hy-h)/ep;    % diferencia hacia adelante
end