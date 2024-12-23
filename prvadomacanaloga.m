% 1. DOMAČA NALOGA 

% 1.NALOGA - DELO Z DATOTEKAMI

%Za prikaz vseh decimalk, ki jih imamo v zapisu
format long;

%Odprem datoteko za branje
file1 = fopen('naloga1_1.txt','r');

%Preberem 1. in 2. vrstico in določim število vrednosti vrstic in stolpcev
ime = fgetl(file1);
dimenzije = fscanf(file1,'stevilo preostalih vrstic: %d; stevilo podatkov v vrstici: %d',[1,2]);
Stevilo_vrstic=dimenzije(1);
Stevilo_podatkov = dimenzije(2);

Matrika_podatkov = fscanf(file1,'%f', [Stevilo_podatkov, Stevilo_vrstic]);

%Matriko preberem kot vektor
Matrika_podatkov = Matrika_podatkov';

%Zaprem file1
fclose(file1);

% Pretvorim matriko v vektor
Vektor_t = Matrika_podatkov(:);



% 2. NALOGA

%Odprem file2
file2 = fopen('naloga1_2.txt', 'r');

%Skeniram podatke enega po enega in zapišem koliko podatkov imam
Stevilo_vrednosti = fscanf(file2, 'stevilo_podatkov_P: %d', 1);

%Ustvarim prazen vektor v velikosti Stevila_vrednosti
P = zeros(Stevilo_vrednosti,1);

%For loop za ustvarjanje P(i) vrednosti
for i = 1:Stevilo_vrednosti
    P(i)= fscanf(file2,'%f', 1);
end

%Zaprem file2
fclose(file2);

%Rezultate podam grafično
plot(Vektor_t,P,'b-', 'LineWidth',2);
xlabel('t[s]');
ylabel('P[W]');
title('Graf P(t)');

%Prikažem še graf
grid on 



% 3. NALOGA

%Najdem minimalne in maksimalne vrednosti območja integriranja
tmin = min(Vektor_t);
tmax = max(Vektor_t);

%Prilagodim območje integriranja
n = length(Vektor_t) - 1;

%Razmak za integracijo
dx = (tmax-tmin)/n;

%Določim začetno vrednost integrala
integral = 0; 

%For zanka, ki izračuna vrednost integrala
for i = 1:n
    integral = integral +  (P(i) + P(i+1))*(dx / 2);
end

%Izpišem primerjavo vrednosti obeh integracij 
disp(['Ročno izračunan integral:', num2str(integral, '%.10f')]);

%Še uporaba integrirane funkcije za integriranje
trapz_integral = trapz(Vektor_t,P);
disp(['Integral s trapz funkcijo :', num2str(trapz_integral,'%.10f')]);

saveas(gcf, 'Graf_P_t.png'); % Shranim kot PNG za uporabo v Latek





