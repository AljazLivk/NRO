%% 2. DOMAČA NALOGA - NAPREDNA RAČUNALNIŠKA ORODJA 

%1. Naloga - Metoda scatteredInterpolant
tic
%Preberem podatke iz podanih datotek
data = readmatrix("vozlisca_temperature_dn2.txt","NumHeaderLines",4);
x = data(:,1);
y = data(:,2);
T = data(:,3);

celice = readmatrix("celice_dn2.txt", "NumHeaderLines",2);

%Uporabim scatteredInterpolant metodo
F1 = scatteredInterpolant(x,y,T,'linear','none');
T1 = F1(0.403, 0.503);

%Prikaz izraza
fprintf('Interpolirana temperatura z metodo scatteredInterpolant T = %.4f °C.\n ', T1);
toc

%2. Naloga - Metoda griddedInterpolant
% Pridobim unikatne vrednosti za mrežo
tic
x_mreza = unique(x);
y_mreza = unique(y);

% Ustvarim mrežo z ndgrid
[X_mreza, Y_mreza] = ndgrid(x_mreza, y_mreza);

% Pretvorim T v 2D matriko
T_mreza = griddata(x, y, T, X_mreza, Y_mreza, 'linear');

% Ustvarim griddedInterpolant z NDGRID strukturo
F2 = griddedInterpolant(X_mreza, Y_mreza, T_mreza, 'linear', 'none');

T2 = F2(0.403, 0.503);

% Prikaz rezultata
fprintf('Interpolirana temperatura z metodo griddedInterpolant T = %.4f °C.\n ', T2);
toc

% 3. Naloga - Samostojna metoda interpolacije 
tic
%Definiram točke
x1 = 0.403;
y1 = 0.503;

% Izračun razdalje med točko in vsemi vozlišči
razdaljadotocke = sqrt((x - x1).^2 + (y - y1).^2);

% Iskanje najbližjega vozlišča
[~, idx_min] = min(razdaljadotocke);  

% Temperatura najbližjega vozlišča
Temp_najblizja = T(idx_min);

% Prikaz rezultata
fprintf('Temperatura v točki (%.4f, %.4f) z samostojno metodo je %.4f.°C.\n', x1, y1, Temp_najblizja);
toc

%Na koncu sem ugotovil, da je numerično najhitrejša metoda zadnja oz.
%tista, ki sem jo ustaril sam. 
%Če pa primerjam prve dve metode, z obema pridobim identično vrednost, vendar je metoda
%griddedInterpolant za 0.08 sekunde hitrejša kot metodascatteredInterpolant. 

%4. Naloga - Iskanje najvišje temperature
% Vozlišče z največjo temperaturo

[max_temp, idx_max] = max(T);

% Koordinate vozlišča z največjo temperaturo
x_max = x(idx_max);
y_max = y(idx_max);

% Izpis rezultata
fprintf('Največja temperatura T_max = %.4f °C se pojavi pri koordinatah (x = %.2f mm, y = %.2f mm).\n', max_temp, x_max, y_max);






