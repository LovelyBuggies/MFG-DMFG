function [u,V,beta,pi] = value_iteration(model,rho,Nx,Nt,reward,n_loop) %u is speed, d is demand 
    M =model.E;
    N=model.N;
    E=model.E;
    delta_t=1/Nx; %delta_t=delta_x can be relaxed
    %delta_x=1/c;
    u=zeros(M,Nx,Nt);
    V=zeros(M,Nx,Nt+1);
    pi=zeros(N,Nt+1);
    beta=zeros(E,Nt+1);
    if model.E==5
        c3=zeros(model.E);
        c3(1)=1;
        c3(2)=1.5;
        c3(3)=1.5;
        c3(4)=1;
        c3(5)=1;
    elseif model.E==38
        c3=ones(model.E)*20;
        c3(2)=1;
        c3(3)=1;
        c3(4)=1;
        c3(10)=1;
        c3(12)=1;
        c3(14)=1;
        c3(30)=1;
        c3(31)=1;
        c3(32)=1;
    end
    %terminal cost for V and pi
    for l =1:M
        start_node=model.edges(l,1);
        end_node=model.edges(l,2);
        for j =1:Nx
            V(l,j,Nt+1)=model.Terminal(start_node)+(model.Terminal(end_node)-model.Terminal(start_node))*(j-1)/Nx;
        end
    end
    for node=1:N
        pi(node,Nt+1)=model.Terminal(node);
    end
    %value iteration 
    for iter=1:n_loop
        %u,v update
        for l=1:M
            for t=1:Nt
            for j =1:Nx
                if j<Nx
                    if reward=="lwr"
                        temp=1-rho(l,j,t);
                        u(l,j,t)=min(max(0,temp),1);
                        V(l,j,t)=delta_t*(0.5*(1-u(l,j,t)-rho(l,j,t))^2)+(1-u(l,j,t))*V(l,j,t+1)+u(l,j,t)*V(l,j+1,t+1);
                    elseif reward=="non-sep"
                        temp=(V(l,j,t+1)-V(l,j+1,t+1))/delta_t-rho(l,j,t)+1;
                        u(l,j,t)=min(max(0,temp),1);
                        V(l,j,t)=delta_t*(0.5*u(l,j,t)^2+rho(l,j,t)*u(l,j,t)-u(l,j,t)+c3(l))+(1-u(l,j,t))*V(l,j,t+1)+u(l,j,t)*V(l,j+1,t+1);
                    elseif reward=="sep"
                        temp=(V(l,j,t+1)-V(l,j+1,t+1))/delta_t+1;
                        u(l,j,t)=min(max(0,temp),1);
                        V(l,j,t)=delta_t*(0.5*u(l,j,t)^2+rho(l,j,t)-u(l,j,t)+c3(l)*1)+(1-u(l,j,t))*V(l,j,t+1)+u(l,j,t)*V(l,j+1,t+1);
                    end
                else
                    end_node=model.edges(l,2);
                    if reward=="lwr"
                        temp=1-rho(l,j,t);
                        u(l,j,t)=min(max(0,temp),1);
                        V(l,j,t)=delta_t*(0.5*(1-u(l,j,t)-rho(l,j,t))^2)+(1-u(l,j,t))*V(l,j,t+1)+u(l,j,t)*pi(end_node,t+1);
                    elseif reward=="non-sep"
                        temp=(V(l,j,t+1)-pi(end_node,t+1))/delta_t-rho(l,j,t)+1;
                        u(l,j,t)=min(max(0,temp),1);
                        V(l,j,t)=delta_t*(0.5*u(l,j,t)^2+rho(l,j,t)*u(l,j,t)-u(l,j,t)+c3(l))+(1-u(l,j,t))*V(l,j,t+1)+u(l,j,t)*pi(end_node,t+1);
                    elseif reward=="sep"
                        temp=(V(l,j,t+1)-pi(end_node,t+1))/delta_t+1;
                        u(l,j,t)=min(max(0,temp),1);
                        V(l,j,t)=delta_t*(0.5*u(l,j,t)^2+rho(l,j,t)-u(l,j,t)+c3(l)*1)+(1-u(l,j,t))*V(l,j,t+1)+u(l,j,t)*pi(end_node,t+1);
                    end
                end
            end
            end       
        end
        %beta, pi update
        %recalulate
        %Initialize beta
        beta=zeros(E,Nt+1);
        for node=1:N
            for t=1:Nt
                outlink=[];
                min_cost=inf;
                for k_out_node=1:model.N
                    k=model.G(node,k_out_node);
                    if k>0
                        outlink=[outlink,k];
                        if V(k,1,t)<=min_cost
                            min_cost=V(k,1,t);
                        %min_cost=min(min_cost,V(k,1,t));
                        %temp_link=k;
                        end
                    end
                end
                %beta(temp_link,t)=1;
                min_link=[];
                for i =1:length(outlink)
                    link=outlink(i);
                    if V(link,1,t)==min_cost
                        min_link=[min_link,link];
                    end
                end
                %calculate beta
                for j=1:length(min_link)
                    k=min_link(j);
                    beta(k,t)=1/length(min_link);
                end
                %calculate pi
                pi(node,t)=0;
                for i =1:length(outlink)
                    k=outlink(i);
                    pi(node,t)=pi(node,t)+beta(k,t)*V(k,1,t); %V at k link 1st cell
                end
            end
            
        end
    end
    
end
