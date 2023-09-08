tic
Nx=4;
tol=1;
model_name="sioux-falls";
reward="non-sep";
n_loop=50;
if model_name=="braess"
    model=load_model_braess;
    T=6;
else
    model=load_model_sioux_falls;
    T=12;
end
Nt=Nx*T;
M=model.E;
N=model.N;
E=model.E;
u=zeros(M,Nx,Nt);
beta=zeros(E,Nt+1);
%travel demand at time step 0 (t=1) 
demand=zeros(length(model.origins),length(u(1,:)));
demand(:,1)=.8;
[u,V,beta,pi,rho,u_hist,rho_hist]=value_iteration(model,demand,Nx,Nt,reward);
u_res=squeeze(u_hist(n_loop,:,:,:));
rho_res=squeeze(rho_hist(n_loop,:,:,:));
%plot_loss_gap;
toc