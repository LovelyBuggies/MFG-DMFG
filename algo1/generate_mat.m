rhos=reshape(rho, [1, 5, 16, 64]);
us=reshape(u, [1, 5, 16, 64]);
Vs=reshape(V, [1, 5, 16, 65]);
betas=reshape(beta, [1, 5, 65]);
pis=reshape(pi, [1, 4, 65]);
save braess-simple.mat rhos us Vs betas pis
