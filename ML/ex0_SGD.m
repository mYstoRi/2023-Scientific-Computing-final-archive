% ex0_SGD: SGD

tic;

% adjustable
n = 1000;
r = 5; % random amplifier
%theta0 = [40*rand()-10, 40*rand()-20]; % initial parameter
    % GD related
    lr = 1; % learning rate

% preprocess
h = 1/n;
x = 0:h:1;
    % gs: g* real solution, g: approximation
gs = @(x) 2.*x + rand(size(x))./r; % normally this is not known
ys = gs(x); % we only know this, not gs
g = @(theta, x) theta(1).*x + theta(2);
    % randomize samples
ind = randperm(n);

% gradient
    % see ex0grad.

% result recording
theta = zeros(m+1, 2);
theta(1, :) = theta0;
loss = @(theta) norm(ys - g(theta, x))/n;

% iteration
for k=1:m
    theta(k+1, :) = theta(k, :) - lr.*ex0grad(theta(k, :), x(ind(k)), ys(ind(k)));
end

toc;

% display
%{
hold on;
plot(x, ys);
for k=0:m
    plot(x, g(theta(k+1, :), x), '--');
    pause(0.01);
end
%}