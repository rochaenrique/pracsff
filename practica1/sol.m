% datos
v0=3.4*10^6;		% velocidad inicial en x (m)
d=0.045             % distancia del primer tramo (m)
p=0.090             % distancia de los sucesivos tramos (m)
E=520;				% campo eléctrico (N/C)
q=-1.61*10^(-19);	% carga eléctrica del electrón (C)
m=9.11*10^(-31);	% masa del electrón (kg)

a=q*E/m;			% aceleración en la dirección del campo eléctrico

n=input('número de pasos, n: ');
nt=input('número de tramos, nt: ');
i=0:n;

figure(1);
hold on;
grid on;
xlabel('t(s)');
ylabel('y(m)');
title("Desplazamiento en Y por tiempo");

figure(2);
hold on;
grid on;
xlabel('t(s)');
ylabel('x(m)');
title("Desplazamiento en X por tiempo");

figure(3);
hold on;
grid on;
xlabel('t(s)');
ylabel('vy(m/s)');
title('Velocidad en Y por tiempo');

color  = 'r';
ta     = 0;
x0     = 0;
dx     = d;

xa     = 0;
vxa    = v0;

ya     = 0;
vya    = 0;

angulo = 0;

for tramo = 0:nt
    tt=dx/vxa;			
    dt=tt/n;           
    t=dt*i;
    
    if color == 'r';
        color = 'b';
    else
        color = 'r';
    end

    y = ya + vya*t + a*((dt.^2)*(i.^2))/2;
    vy = vya + a*t;
    x = xa + vxa*t;

    figure(1);
    plot(t + ta, y, color);
    figure(2);
    plot(t + ta, x, color);
    figure(3);
    plot(t + ta, vy, color);
    
    xa = xa + dx;
    ya = ya + vya*tt + a*(tt^2)/2;
    vya = vya + a*tt;
    ta = ta + tt;
    angulo = atan(vya/vxa)*180/pi;
    
    fprintf("Tramo (%d): %g m < x < %g m\n", tramo + 1, x0, x0+dx);
    fprintf("\tPosicion: (%g m, %g m)\n\tVelocidad: (%g m/s, %g m/s)\n\tAngulo: %g deg\n", xa, ya, vxa, vya, angulo);

    x0 = x0 + dx;
    dx = p;
    
    a = -a;
end

figure(1);
hold off;
figure(2);
hold off;
figure(3);
hold off;
