function rho=network_loading(model,u,beta,demand,Nx,Nt)
%network structure
%braess links(1,2),(1,3),(2,3),(2,4),(3,4) node: 1,2,3,4, o is 1, d is 4
%link j ,cell j, time t,
%1,3
%2,4
%1,5,4
%1,2,5 4
M =model.E;
rho=zeros(M,Nx,Nt);
link_sequence=[1,3,2,5,4];
if M==38
    link_sequence=[1,2,7,3,4,8,11,12,5,6,24,9,14,13,15,20,25,34,27,10,16,21,26,36,28,33,30,17,22,29,31,35,18,19,23,37,32,38];
end
for se =1:M
    l=link_sequence(se);
    for t=1:Nt
        for j=1:Nx 
            if t==1
                rho(l,j,t)=0; %start from an empty network 
            else
                if j>=2 %not junction node
                    rho(l,j,t)=rho(l,j,t-1)+rho(l,j-1,t-1)*u(l,j-1,t-1)-rho(l,j,t-1)*u(l,j,t-1);
                else  %junction node  
                    q_in=0;
                    start_node=model.edges(l,1);  %[node_1,node_2]
                    if any(model.origins(:)==start_node)  %origin node
                        q_in=q_in+demand(find(model.origins==start_node),t-1); %demand at origin
                    end
                    for k_in_node=1:model.N
                        k=model.G(k_in_node,start_node);
                        if k>0
                           q_in=q_in+rho(k,Nx,t-1)*u(k,Nx,t-1);
                        end
                    end
                    entry=beta(l,t-1)*q_in;
                    rho(l,1,t)=rho(l,1,t-1)+entry-rho(l,1,t-1)*u(l,1,t-1);
                end
            end  
        end
    end
end


