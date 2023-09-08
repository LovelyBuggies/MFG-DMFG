Nx=16;
T=4;
Nt=Nx*T;
%x=linspace(0,1,Nx);
%t=linspace(0,T,T*Nx);
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
%rhonew=[rhonew1;rhonew3];
rhonew=[rhonew2;rhonew4];
x=linspace(0,2,2*Nx);
t=linspace(0,T,T*Nx);
[T,X]=meshgrid(t,x);
s=mesh(T,x,rhonew(:,1:length(rhonew(1,:))));
colormap('jet');
colorbar('eastoutside');
s.FaceColor='interp';
set(gca, 'Fontsize', 20, 'linewidth', 1)
xlabel('$t$','interpreter','latex','Fontsize', 25);
ax = gca;
ax.YTickLabel = [num2str(ax.YTick.') repmat('  ',size(ax.YTickLabel,1),1)];
%yticklabels({'(2\leftarrow1)','(4\leftarrow2)'});
yticklabels({'(3\leftarrow1)','(4\leftarrow3)'})
zlabel('$\rho$','interpreter','latex','Fontsize', 25);
xlim([0,4]);
zlim([0,0.5]);
view(-15,20);