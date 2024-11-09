#lab1 de PI 2



%funcao para definir a funcao f(v)
function f = f (v, vcc, rCarga, iS, vT, n)
  f = ((vcc- v)/r)/rCarga - iS * (exp(v/n * vT) - 1)
endfunction
function newton_raph = newton_raph (f, df, x0, tol, maxiter)

  x = x0 - f(x0)

endfunction

resposta = f(5,5,5,5,5,2)
printf(resposta)
