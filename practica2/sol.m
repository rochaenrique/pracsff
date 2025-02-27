% datos
k = 9*10^9;                            % constante de Coulomb

qa = input('Valor de la carga (A) en nC, q: ') * 10^-9;
qb = input('Valor de la carga (B) en nC, q: ') * 10^-9;

d = input('Distancia X entre las cargas en m, ds: ');
delta = d * 1.5;
x0a = -d / 2;                         % posición x carga a
y0a = 0.0;                             % posición y carga a

x0b = d / 2;                          % posición x carga b
y0b = 0.0;                             % posición y carga b

n = input('Numero de pasos, n: ');
p = delta * 2 / n;
dx = -delta:p:delta;
dy = -delta:p:delta;
[x, y] = meshgrid(dx, dy);

l = input('Numero de lineas equipotenciales, l: ');
s = input('Escala de los vectores de campo, s: ');

% carga (A)
ra = abs(sqrt((x-x0a).^2+(y-y0a).^2)); % módulo del vector posición
Exa = k*(qa*(x-x0a)./ra.^3);           % componente x del campo eléctrico
Eya = k*(qb*(y-y0a)./ra.^3);           % componente y del campo eléctrico
Va =  k*qa./ra;                        % valor del potencial

% carga (B)
rb = abs(sqrt((x-x0b).^2+(y-y0b).^2)); 
Exb = k*(qb*(x-x0b)./rb.^3);           
Eyb = k*(qb*(y-y0b)./rb.^3);           
Vb =  k*qb./rb;

% resultante
Exr = Exa + Exb;
Eyr = Eya + Eyb;
Vr = Va + Vb;

quiver(x, y, Exr, Eyr, s, 'r');            % dibujo las líneas del campo vectorial
hold on;
contour(x, y, Vr, l);                  % dibujo de las líneas equipotenciales
xlabel('x (m)');
ylabel('y (m)');
title('potencial y campo por Coulomb');
hold off;



