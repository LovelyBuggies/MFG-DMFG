Nx=4;
T=12;
Nt=Nx*T;
rhonew1=rho_link(rho,Nx,Nt,1);
rhonew2=rho_link(rho,Nx,Nt,2);
rhonew3=rho_link(rho,Nx,Nt,3);
rhonew4=rho_link(rho,Nx,Nt,4);
rhonew5=rho_link(rho,Nx,Nt,5);
rhonew6=rho_link(rho,Nx,Nt,6);
rhonew7=rho_link(rho,Nx,Nt,7);
rhonew8=rho_link(rho,Nx,Nt,8);
rhonew9=rho_link(rho,Nx,Nt,9);
rhonew10=rho_link(rho,Nx,Nt,10);
rhonew11=rho_link(rho,Nx,Nt,11);
rhonew12=rho_link(rho,Nx,Nt,12);
rhonew13=rho_link(rho,Nx,Nt,13);
rhonew14=rho_link(rho,Nx,Nt,14);
rhonew15=rho_link(rho,Nx,Nt,15);
rhonew16=rho_link(rho,Nx,Nt,16);
rhonew17=rho_link(rho,Nx,Nt,17);
rhonew18=rho_link(rho,Nx,Nt,18);
rhonew19=rho_link(rho,Nx,Nt,19);
rhonew20=rho_link(rho,Nx,Nt,20);
rhonew21=rho_link(rho,Nx,Nt,21);
rhonew22=rho_link(rho,Nx,Nt,22);
rhonew23=rho_link(rho,Nx,Nt,23);
rhonew24=rho_link(rho,Nx,Nt,24);
rhonew25=rho_link(rho,Nx,Nt,25);
rhonew26=rho_link(rho,Nx,Nt,26);
rhonew27=rho_link(rho,Nx,Nt,27);
rhonew28=rho_link(rho,Nx,Nt,28);
rhonew29=rho_link(rho,Nx,Nt,29);
rhonew30=rho_link(rho,Nx,Nt,30);
rhonew31=rho_link(rho,Nx,Nt,31);
rhonew32=rho_link(rho,Nx,Nt,32);
rhonew33=rho_link(rho,Nx,Nt,33);
rhonew34=rho_link(rho,Nx,Nt,34);
rhonew35=rho_link(rho,Nx,Nt,35);
rhonew36=rho_link(rho,Nx,Nt,36);
rhonew37=rho_link(rho,Nx,Nt,37);
rhonew38=rho_link(rho,Nx,Nt,38);
% unew1=rho_link(u,Nx,Nt,1);
% unew6=rho_link(u,Nx,Nt,6);
% unew15=rho_link(u,Nx,Nt,15);
% unew17=rho_link(u,Nx,Nt,17);
% unew19=rho_link(u,Nx,Nt,19);
% unew38=rho_link(u,Nx,Nt,38);
rhonew=[rhonew2;rhonew3;rhonew4;rhonew12;rhonew14;rhonew10;rhonew30;rhonew31;rhonew32;];
for time=1:1
for i=1:length(rhonew(:,1))
    rhonew(i,:)=smooth(squeeze(rhonew(i,:)), length(rhonew(i,:)));
end
end
x=linspace(0,9,9*Nx);
t=linspace(0,T,T*Nx);
figure('Position', [10 10 800 700])
[T,X]=meshgrid(t,x);
s=mesh(T,x,rhonew(:,1:length(rhonew(1,:))));
colormap('jet');
s.FaceColor='interp';
set(gca, 'Fontsize', 20, 'linewidth', 1)
xlabel('$t$','interpreter','latex');
yticks([0 1 2 3 4 5 6 7 8]);
yticklabels({'(3\leftarrow1)','(4\leftarrow3)','(5\leftarrow4)','(9\leftarrow5)','(10\leftarrow9)','(16\leftarrow10)','(17\leftarrow16)','(19\leftarrow17)','(20\leftarrow19)'})
zlabel('$\rho$','interpreter','latex');
ylim([0,8]);
xlim([0,12]);
zlim([0,1]);
view(-10,40);