% Порівняння методів моделювання 
% Метод Ейлера проти Метода Рунге-Кутта

% Для порівняння змінюйте змінну dt
dt=0.0005;
tsim=[0:dt:3];
x0=[0;0];

%Рішення системи рівнянь моделі методом Рунге-Кутта
[t,y]=ode45(@dc_motor,tsim,x0);

% Рішення системи рівнянь моделі методом Ейлера
x=x0(:)';
for it=tsim(1:end-1),
  dxsim=dc_motor(it,x(end,:)');
  xsim=x(end,:)+dt*dxsim(:)';
  x=[x;xsim];
end;



%Графіки для порівняння
figure(1)
subplot(2,1,1);
plot(t,y(:,1),t,x(:,1));
xlabel("Час, с");
ylabel("Струм, А");
grid on;

subplot(2,1,2);
plot(t,y(:,2),t,x(:,2));
xlabel("Час, с");
ylabel("Оберти, рад/с");
grid on;

