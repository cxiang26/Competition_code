function [price_p, price_car] = Price_2P(Peple,Car,b2)
alph = 0.1;
share1 = 0.5;
share2 = 0.6; %两人合乘
share3 = 0.8; %合成后一人
price_p = zeros(4,length(b2)*2);
price_qb = 5; %起步价5元
qb_km = 2; %起步公里
price_km = 2.5; %超出范围2.5元每公里
N_Car = length(b2);
price_car = zeros(N_Car,2);

for i = 1:N_Car
    %% 最优路径选择
    path_zy = zylj(Peple,Car{b2(i)});
    
    %% 选择最优路径计算价格
    ab = norm(Peple{Car{b2(i)}.seat(path_zy(2))}.destination-Car{b2(i)}.site);
    bc = norm(Peple{Car{b2(i)}.seat(path_zy(3))}.destination-Peple{Car{b2(i)}.seat(path_zy(2))}.destination);
    car_km = ab + bc;
    price_zs = price_qb + price_km*(car_km-qb_km);
    price_car(i,1) = b2(i);
    price_car(i,2) = price_zs;
    pp1_km = norm(Peple{Car{b2(i)}.seat(path_zy(2))}.destination-Peple{Car{b2(i)}.seat(path_zy(2))}.site);
    pp2_km = norm(Peple{Car{b2(i)}.seat(path_zy(3))}.destination-Peple{Car{b2(i)}.seat(path_zy(3))}.site);
    p1_km = ab;
    p2_km = ab+bc;
    p11_km = p1_km - qb_km;
    p22_km = p2_km - qb_km;
    if p11_km <= 0
        Peple{Car{b2(i)}.seat(path_zy(2))}.cost = price_qb;
        price_p(1,2*(i-1)+1) = Peple{Car{b2(i)}.seat(path_zy(2))}.cost;
        price_p(2,2*(i-1)+1) = price_qb*share2;
        price_p(3,2*(i-1)+1) = price_qb*share3;
        price_p(4,2*(i-1)+1) = price_qb*share1;
    else
        Peple{Car{b2(i)}.seat(path_zy(2))}.cost = price_qb + price_km*pp1_km; 
        price_p(1,2*(i-1)+1) = Peple{Car{b2(i)}.seat(path_zy(2))}.cost;
        price_p(2,2*(i-1)+1) = price_qb*share2 + price_km*p11_km*share1;
        price_p(3,2*(i-1)+1) = price_qb*share3 + price_km*p11_km*share3;
        price_p(4,2*(i-1)+1) = price_qb*share1 + price_km*p11_km*share1;
    end
    if p22_km <= 0
        Peple{Car{b2(i)}.seat(path_zy(3))}.cost = price_qb;
        price_p(1,2*(i-1)+2) = Peple{Car{b2(i)}.seat(path_zy(3))}.cost;
        price_p(2,2*(i-1)+2) = price_qb*share2;
        price_p(3,2*(i-1)+2) = price_qb*share3;
        price_p(4,2*(i-1)+2) = price_qb*share1;
    else
        Peple{Car{b2(i)}.seat(path_zy(3))}.cost = price_qb + price_km*pp2_km; 
        price_p(1,2*(i-1)+2) = Peple{Car{b2(i)}.seat(path_zy(3))}.cost;
        price_p(2,2*(i-1)+2) = price_qb*share2 + price_km*p11_km*share1 + price_km*(p2_km-p1_km)*share2;
        price_p(3,2*(i-1)+2) = price_qb*share3 + price_km*p11_km*share3 + price_km*(p2_km-p1_km)*share3;
        price_p(4,2*(i-1)+2) = price_qb*share1 + price_km*p11_km*share1 + price_km*(p2_km-p1_km)*share2 - (p2_km-pp2_km)*alph;
    end
end
end