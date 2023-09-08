tic
Nx=16;%64...
n_loop=50;

model_name="braess";
reward="sep";
if model_name=="braess"
    model=load_model_braess;
    T=4;
else
    model=load_model_sioux_falls;
    T=12;
end

Nt=Nx*T;
M=model.E;
N=model.N;
E=model.E;
u=zeros(M,Nx,Nt);
u_hist=zeros(n_loop,M,Nx,Nt);
beta=zeros(E,Nt+1);
beta_hist=zeros(n_loop,E,Nt+1);
rho_hist=zeros(n_loop,M,Nx,Nt);
%explore_hist=zeros(1,n_loop);
%travel demand at time step 0 (t=1) 
demand=zeros(length(model.origins),length(u(1,:)));
demand(:,1)=.8;

%Initialize speed
for l =1:M
    for t=1:Nt
    for j =1:Nx
        u(l,j,t)=.5;
    end
    end
end
%Initialize beta
for node=1:N
    outlink=[];
    for k_out_node=1:model.N
        k=model.G(node,k_out_node);
        if k>0
            outlink=[outlink,k];
        end
    end
    %calculate beta
    for t=1:Nt
        for j=1:length(outlink)
            k=outlink(j);
            beta(k,t)=1/length(outlink);
        end                   
    end         
end

rho=network_loading(model,u,beta,demand,Nx,Nt); %initial rho
for loop=1:n_loop
    %[a,b,c,d] = value_iteration(model,rho,Nx,Nt,reward,100);
    [u,V,beta,pi] = value_iteration(model,rho,Nx,Nt,reward,500);
    %explore_hist(loop)=mean(abs(V-b), 'all');
    u_hist(loop,:,:,:)=u;
    u=squeeze(sum(u_hist, 1))/loop;
    if model.E==1
        temp=zeros(1,Nx,Nt);
        temp(1,:,:)=u;
        u=temp;
    end
    beta_hist(loop,:,:,:)=beta;
    %beta(1,1)+beta(2,1)
    beta=squeeze(sum(beta_hist, 1))/loop;
    if model.E==1
        temp=zeros(1,E,Nt+1); 
        temp(1,:,:)=beta;
        beta=temp;
    end
    rho=network_loading(model,u,beta,demand,Nx,Nt);
    rho_hist(loop,:,:,:)=rho;
    %u_tmp=u;
end
u_res=squeeze(u_hist(n_loop,:,:,:));
rho_res=squeeze(rho_hist(n_loop,:,:,:));
%plot_loss_gap;
toc;