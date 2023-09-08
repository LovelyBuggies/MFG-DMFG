Nx=16;
T=4;
Nt=Nx*T;
rhonew1=rho_link(rho,Nx,Nt,1);
rhonew2=rho_link(rho,Nx,Nt,2);
rhonew3=rho_link(rho,Nx,Nt,3);
rhonew4=rho_link(rho,Nx,Nt,4);
rhonew5=rho_link(rho,Nx,Nt,5);
unew1=rho_link(u,Nx,Nt,1);
unew2=rho_link(u,Nx,Nt,2);
unew3=rho_link(u,Nx,Nt,3);
unew4=rho_link(u,Nx,Nt,4);
unew5=rho_link(u,Nx,Nt,5);
Vnew1=rho_link(V,Nx,Nt,1);
Vnew2=rho_link(V,Nx,Nt,2);
Vnew3=rho_link(V,Nx,Nt,3);
Vnew4=rho_link(V,Nx,Nt,4);
Vnew5=rho_link(V,Nx,Nt,5);
rhonew=[rhonew1;rhonew5;rhonew4];
unew=[unew1;unew5;unew4];
for time=1:1
for i=1:length(rhonew(:,1))
    rhonew(i,:)=smooth(squeeze(rhonew(i,:)), length(rhonew(i,:)));
end
end
x=linspace(0,3,3*Nx);
t=linspace(0,T,T*Nx);
%rhonew=rho_link(rho,Nx,Nt,2);
[T,X]=meshgrid(t,x);
%rho=tras(5).rho(:,1:32);
s=mesh(T,x,rhonew(:,1:length(rhonew(1,:))));
colormap(jet);
s.FaceColor='interp';
set(gca, 'Fontsize', 20, 'linewidth', 1)
xlabel('$t$','interpreter','latex');
%ylabel('$Path:\ 1-3-4$','interpreter','latex');
%yticks([0 1]);
%ax = gca;
%ax.YTickLabel = [num2str(ax.YTick.') repmat('  ',size(ax.YTickLabel,1),1)];
%ax.YTicklabel=['1-3','3-4'];
yticklabels({'(2\leftarrow1)','(3\leftarrow2)','(4\leftarrow3)'})
ytickangle(-0)
% ax=gca;
% YTick = get(ax, 'YTick');
% YTickLabel = get(ax, 'YTickLabel');
% ylabel('$x$','interpreter','latex');
% set(ax,'YTick',YTick+0);
% set(ax,'YTickLabel',YTickLabel);
%ax = axes();
%yticks = get(ax,'ytick');
%set(gca,'ytick',['1-3','3-4'])
%zlabel('$\rho$','interpreter','latex');
%zlim([0,0.6]);
%xlim([0,5]);
%xticks([0 1 2 3 4 5])
zlabel('$\rho$','interpreter','latex');
xlim([0,4]);
zlim([0,.5]);
view(-15,20);