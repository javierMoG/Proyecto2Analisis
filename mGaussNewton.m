function [X, k]=mGaussNewton(x0)
% M�todo de Gauss-Newton
% Entradas:
% fname .- cadena con el nombre de la funci�n.
% x0 .- vector columna de dimension n, es el punto incial
% b .- valores
% Out
% xmin .- vector columna de dimension n, es la aproximaci�n al m�nimo local
% k .- n�mero de iteraciones

% Par�metros del m�todo
tol=1e-5;
kmax=100;

% Calculamos la matriz jacobiana de los residuales
J= jacobiana('R',x0);

% Calculamos el gradiente de f
grad=J'*R(x0);
normG=norm(grad);

k=0;
x=x0;
X=[];
while(normG>tol && k<kmax)
    B=J'*J;
    % Encontramos una direcci�n p
    p=B\(-grad);
    
    % B�squeda de l�nea
    c1 = 0.1;                   % valor para la condici�n de Wolfe
    alfa  = 1;                  % paso completo
    xt = x + alfa*p;            % primer punto de prueba
    f  = feval('ftrigo',x);     % valor de la funci�n
    f1 = feval('ftrigo', xt);   % valor de la funci�n en el punto de prueba
    s  = p'*grad;               % derivada direccional
    maxjter = 30;               % n�mero m�ximo de iteraciones internas de BL permitidas
    jter = 0;                   % iteraciones internas
    
    while( (f1>f+alfa*c1*s) && jter < maxjter)  % b�squeda de l�nea
       alfa = alfa/2;
       xt = x + alfa*p;
       f1 = feval('ftrigo', xt);% valor de la funci�n en el punto de prueba
       jter = jter +1;
    end   
    % Fin de b�squeda de l�nea
    
    % Hacemos un paso del m�todo
    x=xt;
    % Guardamos el valor del paso
    X= [x'; X];
    % Actualizamos los par�metros
    J= jacobiana('R',x);
    grad=J'*R(x);
    normG=norm(grad);
    k=k+1;
end
end