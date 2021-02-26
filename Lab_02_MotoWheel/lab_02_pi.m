% Моделювання системи керування обертами мотор-колеса

%Початкові умови
x0=[0;0;0];
% Моделювання
[t,y]=ode45(@dc_motor_pi,[0,5],x0);

%Відображення моделювання
figure(1)

subplot(3,1,1);
plot(t,y(:,1));
xlabel("Час, с");
ylabel("Струм, А");
grid on;
hold on;

subplot(3,1,2);
plot(t,y(:,2));
xlabel("Час, с");
ylabel("Оберти, рад/с");
grid on;
hold on;

subplot(3,1,3);
plot(t,y(:,3));
xlabel("Час, с");
ylabel("Напруга , В");
grid on;
hold on;

