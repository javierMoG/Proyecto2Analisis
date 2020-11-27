function [jh] = jacobiana(hx,x0)
% Calcula la matriz jacobiana de hx
% Entradas:
% hx.- cadena de caracteres con el nombre de la funci�n
% x0.- vector columna de dimensi�n n
% Salidas:
% jh.- la matriz jacobiana de la funci�n evaluada en el punto x0

n = length(x0);             % dimensi�n de dominio de h   
h = feval(hx, x0);          % valor de la funci�n en el punto x0
m = length(h);              % dimensi�n de la imagen de h
ep = 1e-05;
jh = zeros(m,n);            % inicializamos la matriz jacobiana

for j = 1:n
    y = x0; 
    y(j)=y(j) + ep;         % punto en la direcci�n j
    hy = feval(hx,y);       % evaluaci�n en la direcci�n j
    jh(:,j) = (hy-h)/ep;    % diferencia hacia adelante
end