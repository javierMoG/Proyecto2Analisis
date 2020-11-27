function [r]=R(x)
% Funci�n de residuales de los valores observados contra el valor de c(t)
% Entradas:
% fname.-cadena de caracteres con el nombre de la funci�n
% x.-vector columna de dimensi�n m del valor del punto inicial
% Salidas:
% r.- vector columna de dimensi�n n del valor de los residuales

% Datos de la cosecha por a�o por tonelada por hect�rea
y=[11.72 13.38 14.1 13.87 14.8 15.58 14.36 16.3 16.91 18.16 18.43 18.7];
y= [y 20.46 19.16 20.01 22.41 21.21 22.81 23.97 23.27 23.8 25.59 24.93 26.59]';
% Definimos los par�metros de la funci�n log�stica
a = x(1); b= x(2); c1= x(3);

n=length(y);
for i=1:n
    % Calculamos el i-�simo residual 
    r(i)=c1/(1+b*exp(-a*i))-y(i);
end
r=r';
end