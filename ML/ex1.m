% ex1: batch GD

% adjustable
n = 1000;
h = 1/n;
x = 0:h:1;
m = 100; % iteration
theta0 = [-1, 1, 0]; % initial parameter
    % GD related
    lr = 0.5; % learning rate

% gs: g* real solution, g: approximation
gs = @(x) x.*(1-x).*sin(pi.*(x+1/2)./2); % normally this is not known
ys = gs(x); % we only know this, not gs
g = @(theta, x) theta*[x.^2; x; ones(1, n+1)];

% gradient
    % too complicated, wrote another function ex1grad

% result recording
theta = zeros(m+1, 3);
theta(1, :) = theta0;

% iteration
for k=1:m
    theta(k+1, :) = theta(k, :) - lr.*ex1grad(theta(k, :), x, ys);
end

% display
hold on;
plot(x, ys);
for k=0:m
    plot(x, g(theta(k+1, :), x), '--');
end