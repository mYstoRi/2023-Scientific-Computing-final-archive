function grad = ex0grad(theta, x, ys)
    [~, n] = size(x);
    y = theta(1).*x + theta(2);
    s1 = sum(x.*(y - ys));
    s2 = sum(y - ys);
    grad = 1/norm(ys - y)/n.*[s1 s2];
end