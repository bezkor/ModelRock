% Експеримент Галілея
% Скидання двох шарів різної маси
% з урахуванням властивостей атмосфери

% Висота скидання
H0= 57

% Щільність заліза
rho_fe = 7800
% Щільність алюмінія
rho_al = 2700

function dx=sphere(t,x,rho,d)
  % Прискорення вільного падіння
  g=9.806;
  % Діаметр шару
  % d = 0.10;
  % Обєм шару
  vol=pi*d^3/6;
  % маса шару
  m=vol*rho;
  % Характерна площа
  S = pi*d^2/4;
  % Коефіціент аэродинамічного опору для шару
  Cd = 0.47;
  % Визначення характеристик атмосфери
  atm=atmosphere(x(2));
  % Визначення аеродинамічної сили
  Fd=Cd*atm.rho*x(1).^2/2*S;
  % Рівняння руху
  if x(2)>0,
    dx(1)=(Fd-m*g)/m;
    dx(2)=x(1);
  else
    dx(1)=0;
    dx(2)=0;
  end;

  end;
  
sphere_fe=@(t,y) sphere(t,y,rho_fe,0.10);
sphere_fe2=@(t,y) sphere(t,y,rho_fe,0.20);
sphere_al=@(t,y) sphere(t,y,rho_al,0.10);

Tsim=sqrt(2*H0/9.806)

[t_fe,H_fe]=ode45(sphere_fe,[0,Tsim],[0,H0]);
[t_fe2,H_fe2]=ode45(sphere_fe2,[0,Tsim],[0,H0]);
[t_al,H_al]=ode45(sphere_al,[0,Tsim],[0,H0]);


figure(1)
subplot(2,1,1)
plot(t_fe,H_fe(:,1),...
     t_al,H_al(:,1),...
     t_fe2,H_fe2(:,1),'ro');

xlabel("Час, с");
ylabel("Вертикальна швидкість, м/с");
legend("Залізний шар 10 см",...
       "Алюмінієвий шар 10 см",...
       "Залізний шар 20 см");
grid on;


subplot(2,1,2)
plot(t_fe,H_fe(:,2),t_al,H_al(:,2),t_fe2,H_fe2(:,2),'ro');
xlabel("Час, с");
ylabel("Висота, м");
grid on;
