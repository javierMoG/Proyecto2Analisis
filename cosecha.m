% Script cosecha.m
clear all; clc; close all;

t= [1:24]'; % L�nea del tiempo
% Datos de la cosecha por a�o por tonelada por hect�rea
y = [11.72 13.38 14.1 13.87 14.8 15.58 14.36 16.3 16.91 18.16 18.43 18.7 ];
y =[y 20.46 19.16 20.01 22.41 21.21 22.81 23.97 23.27 23.8 25.59 24.93 26.59]';

%% Gr�fica de los datos
plot(t,y,'rd','Linewidth',3);
title('Problema de agricultura', 'Fontsize', 16)
hold on

% Punto inicial
xin=[0.1 1 30]';

%[x, fx, exitflag, output]=fminunc('ftrigo', xin);
%% Aplicamos el m�todo de Gauss-Newton
[X, k]=mGaussNewton(xin);

% Resultados
fprintf('El valor �ptimo x* es (%2.4f, %2.4f, %2.4f) \n', X(1,1), X(1,2), X(1,3));
fprintf('El m�todo de Gauss-Newton tard� %2.0f iteraciones en encontrar el m�nimo', k);

% Valores de los par�metros que mejor ajustan la curva a los datos
a=X(1,1); b=X(1,2); c1=X(1,3);

% Partici�n del eje de las abscisas
tt=linspace(1,24,200)';
% Valores de la funci�n c(tt)
vv= c1./(1+b.*exp(-a*tt));

%% Gr�fica de la funci�n soluci�n
plot(tt,vv,'b','Linewidth', 3)
xlabel('A�os') 
ylabel('Cosecha (tonelada x hect�rea)') 
legend({'Datos', 'Soluci�n'},'Location','northwest')

%% Gr�fica de la soluci�n obtenida en cada iteraci�n
figure (2)
n=length(X);

for i=1:n
    stem3(X(n+1-i,1), X(n+1-i,2), X(n+1-i,3));
    hold on;
end
legend({'k = 1','k = 2','k = 3', 'k = 4', 'k = 5'},'Location','northeast')
title('Valores de x en cada iteraci�n k')

%% Gr�fica de la funci�n de ajuste
figure(3)

t= [1:24]'; % L�nea del tiempo
% Datos de la cosecha por a�o por tonelada por hect�rea
y = [11.72 13.38 14.1 13.87 14.8 15.58 14.36 16.3 16.91 18.16 18.43 18.7 ];
y =[y 20.46 19.16 20.01 22.41 21.21 22.81 23.97 23.27 23.8 25.59 24.93 26.59]';

% Gr�fica de los datos
plot(t,y,'rd','Linewidth',3);
title('Problema de agricultura', 'Fontsize', 16)
hold on

% Valores de los par�metros que mejor ajustan la curva a los datos
for j=1:n
    %Valores de los par�metros en la j-�sima iteraci�n
    a=X(n+1-j,1); b=X(n+1-j,2); c1=X(n+1-j,3);
    % Partici�n del eje de las abscisas
    tt=linspace(1,24,200)';
    % Valores de la funci�n c(tt)
    vv= c1./(1+b.*exp(-a*tt));

    % Gr�fica de la funci�n soluci�n
    plot(tt,vv,'Linewidth', 1)
    hold on;
end
xlabel('A�os') 
ylabel('Cosecha (tonelada x hect�rea)') 
legend({'Datos','k = 1', 'k = 2','k = 3', 'k = 4', 'k = 5'},'Location','northeast')
title('Funci�n de ajuste en la k-�sima iteraci�n')