function model = load_model_braess
    %   number of nodes
    model.N = 4;
    %   number of edges
    model.E=5;
    %terminal
    model.Terminal=zeros(model.N,1);
    model.Terminal(1)=4;
    model.Terminal(2)=2.7;
    model.Terminal(3)=1.4;
    model.Terminal(4)=0.;
    %   origin and destination
    model.origins=[1];
    model.destination = 4;
    %   adjacency matrix
    model.G = zeros(4, 4);
    model.G(1, 2) = 1;
    model.G(1, 3) = 2;
    model.G(2, 4) = 3;
    model.G(3, 4) = 4;
    model.G(2, 3) = 5;
    model.G = int8(model.G);
    %inflow
    model.edges=zeros(model.E,2);
    %   edges
    model.edges(1,1)=1; model.edges(1,2)=2;
    model.edges(2,1)=1; model.edges(2,2)=3;
    model.edges(3,1)=2; model.edges(3,2)=4;
    model.edges(4,1)=3; model.edges(4,2)=4;
    model.edges(5,1)=2; model.edges(5,2)=3;
    %   simulation time and road length
    %model.T = 4;
    model.L = 1;
    %   initial, terminal, in-flow and out-cost conditions
    model.rho_ini = @(l, x) 0*x;    %tricky
    model.V_ter = @(l, x) 0.5 * ((l<=2) * (2-x) + (l>2) * (1-x));
    model.q_in = @(t) 0.5 * (t<=2);
    model.V_out = @(t) 0*t; %   tricky
end