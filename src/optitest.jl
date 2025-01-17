function spacepaper(v)
    x, y = v
    x^4 - 16y^2 + 0.5x + y^4 - 16y^2 + 0.5y
end

function b2(v)
    x, y = v
    i = 1:5
    r1 = sum(i .* (cos.((i .+ 1) * x + i)))
    r2 = sum(i .* (cos.((i .+ 1) * y + i)))
    r1 * r2
end

function de_joung(v)
    sum(v .^ 2)
end

function rastrigin(v)
    A = 10
    n = length(v)
    A * n + sum(v .^ 2 - A * cos.(2 * pi .* (v)))
end

