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
Vnew=[Vnew1;Vnew5;Vnew4];
% for time=1:1
% for i=1:length(rhonew(:,1))
%     rhonew(i,:)=smooth(squeeze(rhonew(i,:)), length(rhonew(i,:)));
% end
% end
x=linspace(0,3,3*Nx);
t=linspace(0,T,T*Nx);
[T,X]=meshgrid(t,x);
s=mesh(T,x,-unew(:,1:length(rhonew(1,:))));
colormap('jet');
s.FaceColor='interp';
set(gca, 'Fontsize', 20, 'linewidth', 1)
xlabel('$t$','interpreter','latex','Fontsize', 25);
yticklabels({'(2\leftarrow1)','(3\leftarrow2)','(4\leftarrow3)'})
zlabel('$-u$','interpreter','latex','Fontsize', 25);
xlim([0,4]);
%zlim([0,0.5]);
view(-15,20);