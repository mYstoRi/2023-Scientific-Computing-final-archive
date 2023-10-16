function grad = ex1grad(theta, x, ys)
    [~, n] = size(x);
    SE = @(y) norm(theta*[y.^2; y; ones(1, n)] - ys);
    ss1 = sum(x);
    ss2 = sum(x.^2);
    ss3 = sum(x.^3);
    ss4 = sum(x.^4);
    gs0 = sum(ys);
    gs1 = sum(ys.*x);
    gs2 = sum(ys.*x.*x);
    A = [ss4 ss3 ss2;ss3 ss2 ss1;ss2 ss1 n;gs2 gs1 gs0];
    grad = 1/SE(x)/n.*([theta -1]*A);
end