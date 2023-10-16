% ex2: SGD

% adjustable
n = 100;
h = 1/n;
x = 0:h:1;
m = n; % iteration
theta0 = [-1, 1, 0]; % initial parameter
    % GD related
    lr = 0.1; % learning rate

% gs: g* real solution, g: approximation
gs = @(x) x.*(1-x).*sin(pi.*(x+1/2)./2); % normally this is not known
ys = gs(x); % we only know this, not gs
g = @(theta, x) theta*[x.^2; x; ones(1, n+1)];

% generate randomized index order
indexrd = 1+floor(rand(1, n+1).*(n+1));

% gradient
    % too complicated, wrote another function ex1grad

% result recording
theta = zeros(m+1, 3);
theta(1, :) = theta0;

% iteration
for k=1:m
    theta(k+1, :) = theta(k, :) - lr.*ex1grad(theta(k, :), x(indexrd(k)), ys(indexrd(k)));
end

% display
hold on;
plot(x, ys);
for k=0:m
    plot(x, g(theta(k+1, :), x), '--');
    pause(0.1);
end