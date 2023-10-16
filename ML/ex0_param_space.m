%ex0;
thspace = zeros(n+1);
x1 = -10;
x2 = 30;
y1 = -20;
y2 = 20;
for i=1:n+1
    for j=1:n+1
        t1 = x1 + (i-1)*(x2-x1)/n;
        t2 = y1 + (j-1)*(y2-y1)/n;
        thspace(j, i) = loss([t1, t2]);
    end
end
surf(x1:(x2-x1)/n:x2, y1:(y2-y1)/n:y2, thspace,'EdgeColor','none','FaceAlpha',0.2);
hold on;
l = zeros(3, m+1);
for i=1:m+1
    l(3, i) = loss(theta(i, :));
end
l(1, :) = theta(:, 1);
l(2, :) = theta(:, 2);
plot3(l(1, :), l(2, :), l(3, :));