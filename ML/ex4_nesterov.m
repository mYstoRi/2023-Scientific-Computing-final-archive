% ex4: nesterov

tic;

% adjustable
generate_new_sample = false;
n = 1000;
r = 5; % random amplifier
if (generate_new_sample == true)
    theta0 = [40*rand()-10, 40*rand()-20]; % initial parameter
end
    % GD related
    lr = 0.1; % learning rate
    bs = 10; % batch count
    p = 0.9;

% preprocess
h = 1/n;
m = 300;
x = 0:h:1;
    % gs: g* real solution, g: approximation
gs = @(x) 2.*x + rand(size(x))./r; % normally this is not known
if (generate_new_sample == true)
    ys = gs(x); % we only know this, not gs
end
g = @(theta, x) theta(1).*x + theta(2);
v = zeros(m+1, 2);
theta = zeros(m+1, 2);
theta(1, :) = theta0;

% gradient
    % see ex0grad.

% result recording
loss = @(theta) norm(ys - g(theta, x))/n;

% iteration
for k=1:m
    % randomize samples
    ind = randperm(n,bs);

    v(k+1, :) = p.*v(k, :) + lr.*ex0grad(theta(k, :)-p.*v(k, :), x(ind), ys(ind));
    theta(k+1, :) = theta(k, :) - v(k+1, :);
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