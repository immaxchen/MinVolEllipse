
library(pracma)

MinVolEllipse <- function(P, tolerance) {
  d = size(P, 1)
  N = size(P, 2)
  
  Q = zeros(d + 1, N)
  Q[1:d, ] = P[1:d, 1:N]
  Q[d + 1, ] = ones(1, N)
  
  count = 1
  err = 1
  u = (1 / N) * rep(1, N)
  
  while (err > tolerance) {
    X = Q %*% diag(u) %*% t(Q)
    M = diag(t(Q) %*% solve(X) %*% Q)
    j = which.max(M)
    maximum = M[j]
    step_size = (maximum - d - 1) / ((d + 1) * (maximum - 1))
    new_u = (1 - step_size) * u
    new_u[j] = new_u[j] + step_size
    count = count + 1
    err = norm(matrix(new_u - u))
    u = new_u
  }
  
  U = diag(u)
  c = P %*% matrix(u)
  A = (1 / d) * solve(P %*% U %*% t(P) - c %*% t(c))
  
  returnList <- list("center" = c, "matrix" = A)
}
