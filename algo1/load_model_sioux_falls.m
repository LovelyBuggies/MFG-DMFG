function model = load_model_sioux_falls
    %   number of nodes
    model.N = 24;
    %   number of edges
    model.E=38;
    %terminal
    model.Terminal=zeros(model.N,1);
    model.Terminal(1)=12;
    model.Terminal(2)=10;
    model.Terminal(3)=11;
    model.Terminal(4)=9;
    model.Terminal(5)=9;
    model.Terminal(6)=8;
    model.Terminal(7)=4;
    model.Terminal(8)=7;
    model.Terminal(9)=8;
    model.Terminal(10)=7;
    model.Terminal(11)=7;
    model.Terminal(12)=8;
    model.Terminal(13)=6;
    model.Terminal(14)=6;
    model.Terminal(15)=5;
    model.Terminal(16)=6;
    model.Terminal(17)=5;
    model.Terminal(18)=2;
    model.Terminal(19)=3;
    model.Terminal(20)=0;
    model.Terminal(21)=2;
    model.Terminal(22)=5;
    model.Terminal(23)=5;
    model.Terminal(24)=4;
    %   origin and destination
    model.origins = [1,2,3,4,5,6,7,8,9,10,16,17,18,19];
    model.destination = 20;
    %   adjacency matrix
    model.G = zeros(24, 24);
    model.G(1,2) = 1;
    model.G(1,3) = 2;
    model.G(3,4) = 3;
    model.G(4,5) = 4;
    model.G(5,6) = 5;
    model.G(2,6) = 6;
    model.G(3,12) = 7;
    model.G(12,11) = 8;
    model.G(11,10) = 9;
    model.G(10,16) = 10;
    model.G(4,11) = 11;
    model.G(5,9) = 12;
    model.G(9,8) = 13;
    model.G(9,10) = 14;
    model.G(6,8) = 15;
    model.G(8,16) = 16;
    model.G(8,7) = 17;
    model.G(16,18) = 18;
    model.G(7,18) = 19;
    model.G(12,13) = 20;
    model.G(13,24) = 21;
    model.G(24,21) = 22;
    model.G(21,20) = 23;
    model.G(11,14) = 24;
    model.G(14,23) = 25;
    model.G(23,24) = 26;
    model.G(10,15) = 27;
    model.G(15,22) = 28;
    model.G(22,21) = 29;
    model.G(16,17) = 30;
    model.G(17,19) = 31;
    model.G(19,20) = 32;
    model.G(10,17) = 33;
    model.G(14,15) = 34;
    model.G(15,19) = 35;
    model.G(23,22) = 36;
    model.G(22,20) = 37;
    model.G(18,20) = 38;
    model.G = int8(model.G);
    %inflow
    model.edges=zeros(model.E,2);
    %   edges
    model.edges(1,1)=1; model.edges(1,2)=2;
    model.edges(2,1)=1; model.edges(2,2)=3;
    model.edges(3,1)=3; model.edges(3,2)=4;
    model.edges(4,1)=4; model.edges(4,2)=5;
    model.edges(5,1)=5; model.edges(5,2)=6;
    model.edges(6,1)=2; model.edges(6,2)=6;
    model.edges(7,1)=3; model.edges(7,2)=12;
    model.edges(8,1)=12; model.edges(8,2)=11;
    model.edges(9,1)=11; model.edges(9,2)=10;
    model.edges(10,1)=10; model.edges(10,2)=16;
    model.edges(11,1)=4; model.edges(11,2)=11;
    model.edges(12,1)=5; model.edges(12,2)=9;
    model.edges(13,1)=9; model.edges(13,2)=8;
    model.edges(14,1)=9; model.edges(14,2)=10;
    model.edges(15,1)=6; model.edges(15,2)=8;
    model.edges(16,1)=8; model.edges(16,2)=16;
    model.edges(17,1)=8; model.edges(17,2)=7;
    model.edges(18,1)=16; model.edges(18,2)=18;
    model.edges(19,1)=7; model.edges(19,2)=18;
    model.edges(20,1)=12; model.edges(20,2)=13;
    model.edges(21,1)=13; model.edges(21,2)=24;
    model.edges(22,1)=24; model.edges(22,2)=21;
    model.edges(23,1)=21; model.edges(23,2)=20;
    model.edges(24,1)=11; model.edges(24,2)=14;
    model.edges(25,1)=14; model.edges(25,2)=23;
    model.edges(26,1)=23; model.edges(26,2)=24;
    model.edges(27,1)=10; model.edges(27,2)=15;
    model.edges(28,1)=15; model.edges(28,2)=22;
    model.edges(29,1)=22; model.edges(29,2)=21;
    model.edges(30,1)=16; model.edges(30,2)=17;
    model.edges(31,1)=17; model.edges(31,2)=19;
    model.edges(32,1)=19; model.edges(32,2)=20;
    model.edges(33,1)=10; model.edges(33,2)=17;
    model.edges(34,1)=14; model.edges(34,2)=15;
    model.edges(35,1)=15; model.edges(35,2)=19;
    model.edges(36,1)=23; model.edges(36,2)=22;
    model.edges(37,1)=22; model.edges(37,2)=20;
    model.edges(38,1)=18; model.edges(38,2)=20;
    %   simulation time and road length
    %model.T = 4;
    model.L = 1;
    %   initial, terminal, in-flow and out-cost conditions
    model.rho_ini = @(l, x) 0*x;    %tricky
    model.V_ter = @(l, x) 0.5 * ((l<=2) * (2-x) + (l>2) * (1-x));
    model.q_in = @(t) 0.5 * (t<=2);
    model.V_out = @(t) 0*t; %   tricky
end