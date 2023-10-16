% ex5: adagrad

tic;

% adjustable
generate_new_sample = false;
n = 1000;
r = 5; % random amplifier
if (generate_new_sample == true)
    theta0 = [40*rand()-10, 40*rand()-20]; % initial parameter
end
    % GD related
    lr = 0.1.*ones(1, 2); % initial learning rate
    bs = 32; % batch count
    p = 0.9; % momentum

    eps = 1e-8; % a small number

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
dlt = (1-eps).*ones(1, 2);

% gradient
    % see ex0grad.

% result recording
loss = @(theta) norm(ys - g(theta, x))/n;
dltr = zeros(m+1, 2);
dltr(1, :) = dlt;

% iteration
for k=1:m
    % randomize samples
    ind = randperm(n,bs);

    gr = ex0grad(theta(k, :)-p.*v(k, :), x(ind), ys(ind));
    v(k+1, :) = p.*v(k, :) + lr./sqrt(dlt+eps).*gr;
    theta(k+1, :) = theta(k, :) - v(k+1, :);
    dlt = dlt + (gr.^2);
    dltr(k+1, :) = dlt;
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