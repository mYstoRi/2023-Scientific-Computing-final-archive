function e = MSE(x, y)
    [~, n] = size(x);
    e = 0;
    for i=1:n
        e = e + (x(i)-y(i))^2;
    end
    e = e/n;
end