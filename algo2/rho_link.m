function rho_new=rho_link(rho,Nx,Nt,link_id)
    rho_new=zeros(Nx,Nt);
    size_temp=size(rho);
    for l=1:size_temp(1)
        if l==link_id
            for t=1:Nt
            for j=1:Nx
                rho_new(j,t)=rho(l,j,t);
            end
            end
        end
    end
end