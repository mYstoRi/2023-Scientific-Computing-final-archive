% ex0: plotting error

log_scale = false;

loss_error = zeros(k+1, 1);
for i=1:k+1
    loss_error(i) = loss(theta(i, :));
end

if (log_scale==true)
    plot(log(loss_error));
else
    plot(loss_error);
end