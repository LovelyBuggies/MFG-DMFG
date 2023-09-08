Nx=2;%64...
T=10;
Nt=Nx*T;
tol=1;
model_braess=load_model_braess;
M=model_braess.E;
N=model_braess.N;
E=model_braess.E;
u=zeros(M,Nx,Nt);
u_hist=zeros(300,M,Nx,Nt);
beta=zeros(E,Nt+1);
beta_hist=zeros(300,E,Nt+1);
%u_tmp=zeros(cells,cells*T);
%rho=zeros(M,Nx,Nt);
rho_hist=zeros(300,M,Nx,Nt);
%travel demand at time step 0 (t=1) 
demand=zeros(length(model.origins),length(u(1,:)));
demand(:,1)=1.;

%Initialize speed
for l =1:M
    for t=1:Nt
    for j =1:Nx
        u(l,j,t)=0.5;
    end
    end
end
%Initialize beta
for node=1:N
    outlink=[];
    for k_out_node=1:model_braess.N
        k=model_braess.G(node,k_out_node);
        if k>0
            outlink=[outlink,k];
        end
    end
    %calculate beta
    for t=1:Nt
          beta(1,t)=1;
          beta(5,t)=1;
          beta(4,t)=1;
%         for j=1:length(outlink)
%             k=outlink(j);
%             beta(k,t)=1/length(outlink);
%         end                   
    end         
end
%beta0=beta;
rho=network_loading(model_braess,u,beta,demand,Nx,Nt); %initial rho
%{
for i=1:T*Nx
subplot(3,8,i);
plot(x,rho(:,i+2));
end
%}
rhonew1=rho_link(rho,Nx,Nt,1);
rhonew2=rho_link(rho,Nx,Nt,2);
rhonew3=rho_link(rho,Nx,Nt,3);
rhonew4=rho_link(rho,Nx,Nt,4);
rhonew5=rho_link(rho,Nx,Nt,5);
rhonew=[rhonew1;rhonew5;rhonew4];
x=linspace(0,3,3*Nx);
t=linspace(0,T,T*Nx);
[T,X]=meshgrid(t,x);
%rho=tras(5).rho(:,1:32);
s=mesh(T,x,rhonew(:,1:length(rhonew(1,:))));
colormap('jet');
s.FaceColor='interp';
set(gca, 'Fontsize', 20, 'linewidth', 1)
xlabel('$t$','interpreter','latex');
%ylabel('$Path:\ 1-3-4$','interpreter','latex');
%yticks([0 1]);
%ax = gca;
%ax.YTickLabel = [num2str(ax.YTick.') repmat('  ',size(ax.YTickLabel,1),1)];
%ax.YTicklabel=['1-3','3-4'];
%yticklabels({'(3\leftarrow2)','(4\leftarrow3)'})
%ytickangle(-60)
ax=gca;
YTick = get(ax, 'YTick');
YTickLabel = get(ax, 'YTickLabel');
ylabel('$x$','interpreter','latex');
set(ax,'YTick',YTick+0);
set(ax,'YTickLabel',YTickLabel);
%ax = axes();
%yticks = get(ax,'ytick');
%set(gca,'ytick',['1-3','3-4'])
%zlabel('$\rho$','interpreter','latex');
%zlim([0,0.6]);
%xlim([0,5]);
%xticks([0 1 2 3 4 5])
zlabel('$\rho$','interpreter','latex');