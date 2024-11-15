close all;
home;
clear;
pkg load symbolic
syms t;
function OperaSinal(x,Ix,y,Iy)
% &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%.
% Código - entrada: um sinal e sua transformação no Tempo
%
% Saída: Gráficos do sinal e da sua transformação
%
% ARGUMENTOS:
% x - Sinal Original (Entrada).
% Ix - Intervalo de Visualização do Sinal Original.
% y - Sinal Transformado.
% Iy - Intervalo de Visualização do Sinal.
%
% Observação:
% O sinal deve ser uma função simbólica, com uma variável independente única,
% que tem que ser t.
%
% &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
syms t;


F = figure;
set(F,'name','OPERAÇÕES BÁSICAS COM SINAIS CONTÍNUOS');
subplot(211)
ezplot(x,Ix);
xlim([-2, 4]);
title('x(t)');
axis equal
grid
subplot(212)
ezplot(y,Iy);
ylim([-2, 4]);
title('y(t)');
axis equal
grid

end

x =(heaviside(t - 2) - heaviside(t - 3)) + 2 * (heaviside(t - 3) - heaviside(t -4));
Ix = [-6 6];
Iy = [-6 6];


%1
y = subs(x,t,-t+1);
OperaSinal(x,Ix,y,Iy);

%2
y = subs(x,t,2*t-1);
OperaSinal(x,Ix,y,Iy);

%3
y = subs(x,t,-2*t+4);
OperaSinal(x,Ix,y,Iy);

%4
y = subs(x,t,-t-2);
OperaSinal(x,Ix,y,Iy);

%5
y = subs(x,t,(t+6)/3);
OperaSinal(x,Ix,y,Iy);

%6
y = subs(-(1/2)*x-1,t,-(t/3)+2);
OperaSinal(x,Ix,y,Iy)
