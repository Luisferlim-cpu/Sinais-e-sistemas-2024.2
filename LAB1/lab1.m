%questao 1 ///////////////////////////////////////////////////////////////////////////////////////
% Limpar todas as variáveis
clear all

% Coeficientes angulares das senoides e cossenoides
b1 = 0.5 * pi;
b2 = 2 * pi;

% Cálculo dos períodos de cada termo
T1 = 2 * pi / b1;
T2 = 2 * pi / b2;

T_1 = int16([T1 T2]);
T = lcm(T_1(1), T_1(2));

% Calcular a frequência em Hz
f_Hz = 1 / T;

% Calcular a frequência angular em rad/s
f_rad_per_s = 2 * pi * f_Hz;

% Exibir resultados
disp(['O período da função é T = ', num2str(T), ' unidades de tempo']);
disp(['A frequência é f = ', num2str(f_Hz), ' Hz']);
disp(['A frequência angular é ω = ', num2str(f_rad_per_s), ' rad/s']);

% Definir valores de n para o sinal discreto
Ts = 0.01;
n_values = -1:Ts:1;

f_discrete = sin(0.5 * pi * n_values) + cos(2 * pi * n_values) + 1;

% Limpar figuras
clf;
figure(1);
plot(n_values, f_discrete, 'LineWidth', 2);
title('Sinal Discreto: f[n] = \sin(0.5 \pi n) + \cos(2 \pi n) + 1');
xlabel('Tempo (s)');
ylabel('f[n]');
grid on;

% Calcular a taxa de amostragem e a frequência angular discreta
taxa_amostragem = 1 / Ts;
f_a = f_Hz / taxa_amostragem;
Wd = 2 * pi * f_a;

% Calcular o período fundamental
T_fundamental = 1 / f_a;
disp(['O período fundamental é T_fundamental = ', num2str(T_fundamental)]);

% Definir o sinal contínuo no tempo
sinal = sin(pi * (-1 : 0.001 : 1));

% Função componente ímpar
function impar = componente_impar(sinal)
    sinal_inverso = sinal(end:-1:1);
    impar = (sinal / 2) - (sinal_inverso / 2);
end

% Função componente par
function par = componente_par(sinal)
    sinal_inverso = sinal(end:-1:1);
    par = (sinal / 2) + (sinal_inverso / 2);
end

% Plotar componentes par e ímpar
figure(2);
plot(componente_par(f_discrete));
title('Componente Par');
grid on;

figure(3);
plot(componente_impar(f_discrete));
title('Componente Ímpar');
grid on;

figure(4);
plot(componente_impar(f_discrete) + componente_par(f_discrete));
title('Sinal Original');
grid on;

#questao 2//////////////////////////////////////////////////////////////////////////

% Definir o caminho do arquivo de áudio
music = 'materiaisLAB\dandadan_15seg.wav';

% Ler o arquivo de áudio
[sinal, fs] = audioread(music);

% Reproduzir o sinal original
sound(sinal, fs);
pause(2);

% Inverter o sinal
sinal_invertido = sinal(end:-1:1);
sound(sinal_invertido, fs);
pause(2);

% Reproduzir o sinal em velocidade lenta
fs_lento = fs / 2;
sound(sinal, fs_lento);
pause(2);

% Reproduzir o sinal em velocidade rápida
fs_rapido = fs * 2;
sound(sinal, fs_rapido);
pause(5);

% Parar a reprodução
clear sound;

% Função para transformar o sinal
function y = transform_signal(x, a, b)
    N = length(x);
    y = zeros(1, N);
    for n = 1:N
        index = a * n + b;
        if index >= 1 && index <= N
            y(n) = x(index);
        else
            y(n) = 0;
        end
    end
end

% Definir o sinal
x = sin(2 * pi * (0:0.01:1));

% Plotar o sinal original
subplot(1, 3, 1);
plot(x);
title('Sinal Original');

% Transformar e plotar o sinal com a = 2, b = 0
x1 = transform_signal(x, 2, 0);
subplot(1, 3, 2);
plot(x1);
title('Transformação: a = 2, b = 0');

% Transformar e plotar o sinal com a = 2, b = 30
x2 = transform_signal(x, 2, 30);
subplot(1, 3, 3);
plot(x2);
title('Transformação: a = 2, b = 30');

