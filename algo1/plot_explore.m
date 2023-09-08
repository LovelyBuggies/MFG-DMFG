figure('Renderer', 'painters', 'Position', [10 10 600 300])
plot(1:n_loop,sep_explore_hist,'-',1:n_loop,lwr_explore_hist,'--',1:n_loop,non_sep_explore_hist,'-.','LineWidth',4);
ax = gca;
ax.FontSize = 16; 
xlabel('iterations','FontSize',20);
ylabel('explorability','FontSize',20);
legend("[$\mathcal{G}^D$-dMFG-Sep]","[$\mathcal{G}^D$-dMFG-Non-Sep1]","[$\mathcal{G}^D$-dMFG-Non-Sep2]",'Interpreter','latex','FontSize',16);
