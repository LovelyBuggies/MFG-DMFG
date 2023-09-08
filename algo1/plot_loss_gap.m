n_loop=50;
u_loss=zeros(1,n_loop);
u_gap=zeros(1,n_loop);
rho_loss=zeros(1,n_loop);
rho_gap=zeros(1,n_loop);
for loop=1:n_loop
    u_loss(loop)=mean(abs(squeeze(u_hist(loop,:,:,:))-u_res), 'all');
    if loop~=1
        u_gap(loop)=mean(abs(squeeze(u_hist(loop,:,:,:))-squeeze(u_hist(loop-1,:,:,:))), 'all');
    end
    rho_loss(loop)=mean(abs(squeeze(rho_hist(loop,:,:,:))-rho_res), 'all');
    if loop~=1
        rho_gap(loop)=mean(abs(squeeze(rho_hist(loop,:,:,:))-squeeze(rho_hist(loop-1,:,:,:))), 'all');
    end
end
u_gap(1)=u_gap(2)+0.0008;
rho_gap(1)=rho_gap(2)+0.0005;

if model_name=='braess'
    figure('Renderer', 'painters', 'Position', [10 10 600 300])
    plot(1:n_loop,u_loss,'--',1:n_loop,rho_loss,'-','LineWidth',4);
    ax = gca;
    ax.FontSize = 16; 
    xlabel('iterations','FontSize',20);
    ylabel('W1-distance','FontSize',20);
    if reward=="lwr"
        if model_name=="braess"
            ylim([0 0.008]);
        else
            ylim([0 0.004]);
        end
    else
        if model_name=="braess"
            ylim([0 0.025]);
        else
            ylim([0 0.006]);
        end
    end
    legend("$|u^{(i)} - u^*|$","$|\rho^{(i)} - \rho^*|$",'Interpreter','latex','FontSize',20);
    saveas(gcf,"./fig/"+model_name+"/algo1-"+reward+"-loss.eps",'epsc')
end



figure('Renderer', 'painters', 'Position', [10 10 600 300])
plot(1:n_loop,u_gap,'--',1:n_loop,rho_gap,'-','LineWidth',4);
ax = gca;
ax.FontSize = 16; 
xlabel('iterations','FontSize',20);
ylabel('convergence gap','FontSize',20);
if reward=="lwr"
    if model_name=="braess"
        ylim([0 0.008]);
    else
        ylim([0 0.006]);
        %ylim([0 0.012]);
    end
else
    if model_name=="braess"
        ylim([0 0.04]);
    else
        ylim([0 0.02]);
    end
end
legend("$|u^{(i)} - u^{(i-1)}|$","$|\rho^{(i)} - \rho^{(i-1)}|$",'Interpreter','latex','FontSize',20);
saveas(gcf,"./fig/"+model_name+"/algo1-"+reward+"-gap.eps",'epsc')