function integral = simpson38(f, a, b, n)
    h = (b - a) / n;
    x = a:h:b;
    y = f(x);
    integral = (3 * h / 8) * (y(1) + 3 * sum(y(2:end-1)) + y(end));
end