function path = zylj(P,Car)

seat = find(Car.seat > 0);

if length(seat) == 3
    p1 = P{Car.seat(1)};
    p2 = P{Car.seat(2)};
    p3 = P{Car.seat(3)};
    node_a = Car.site;
    node_b = p1.destination;
    node_c = p2.destination;
    node_d = p3.destination;
    ab = norm(node_b-node_a);
    ac = norm(node_c-node_a);
    ad = norm(node_d-node_a);
    bc = norm(node_c-node_b);
    bd = norm(node_d-node_b);
    cd = norm(node_d-node_c);
    abcd = sum(ab+bc+cd);
    abdc = sum(ab+bd+cd);
    acbd = sum(ac+bc+bd);
    acdb = sum(ac+cd+bd);
    adbc = sum(ad+bd+bc);
    adcb = sum(ad+cd+bc);
    all_path = [abcd,abdc,acbd,acdb,adbc,adcb];
    a_min = min(all_path);
    switch(find(all_path==a_min))
        case 1
            path = [0 1 2 3];
        case 2
            path = [0 1 3 2];
        case 3 
            path = [0 2 1 3];
        case 4
            path = [0 2 3 1];
        case 5
            path = [0 3 1 2];
        case 6
            path = [0 3 2 1];
    end
end
if length(seat) == 2
    p1 = P{Car.seat(1)};
    p2 = P{Car.seat(2)};
    node_a = Car.site;
    node_b = p1.destination;
    node_c = p2.destination;
    ab = norm(node_b-node_a);
    ac = norm(node_c-node_a);
    bc = norm(node_c-node_b);
    abc = sum(ab+bc);
    acb = sum(ac+bc);
    all_path = [abc,acb];
    a_min = min(all_path);
    switch(find(all_path==a_min))
        case 1
            path = [0 1 2];
        case 2
            path = [0 2 1];
    end
end
end