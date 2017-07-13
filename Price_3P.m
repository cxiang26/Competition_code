function [price_p, price_car] = Price_3P(Peple,Car,b3)
alph = 0.1;
share1 = 0.5; %三人合乘
share2 = 0.6; %两人合乘
share3 = 0.8; %合成后一人
price_p = zeros(4,length(b3)*3);
price_qb = 5; %起步价5元
qb_km = 2; %起步公里
prince_km = 2.5; %超出范围2.5元每公里
N_Car = length(b3);
price_car = zeros(N_Car,2);

for i = 1:N_Car
    %% 最优路径选择
    path_zy = zylj(Peple,Car{b3(i)});
    
    %% 选择最优路径计算价格
    ab = norm(Peple{Car{b3(i)}.seat(path_zy(2))}.destination-Car{b3(i)}.site);
    bc = norm(Peple{Car{b3(i)}.seat(path_zy(3))}.destination-Peple{Car{b3(i)}.seat(path_zy(2))}.destination);
    cd = norm(Peple{Car{b3(i)}.seat(path_zy(4))}.destination-Peple{Car{b3(i)}.seat(path_zy(3))}.destination);
    car_km = ab + bc + cd;
    price_zs = price_qb + prince_km*(car_km-qb_km);
    price_car(i,1) = b3(i);
    price_car(i,2) = price_zs;
    pp1_km = norm(Peple{Car{b3(i)}.seat(path_zy(2))}.destination-Peple{Car{b3(i)}.seat(path_zy(2))}.site);
    pp2_km = norm(Peple{Car{b3(i)}.seat(path_zy(3))}.destination-Peple{Car{b3(i)}.seat(path_zy(3))}.site);
    pp3_km = norm(Peple{Car{b3(i)}.seat(path_zy(4))}.destination-Peple{Car{b3(i)}.seat(path_zy(4))}.site);
    p1_km = ab;
    p2_km = ab+bc;
    p3_km = ab+bc+cd;
    p11_km = p1_km - qb_km;
    p22_km = p2_km - qb_km;
    p33_km = p3_km - qb_km;
    if p11_km <= 0
        Peple{Car{b3(i)}.seat(path_zy(2))}.cost = price_qb;
        price_p(1,3*(i-1)+1) = Peple{Car{b3(i)}.seat(path_zy(2))}.cost;
        price_p(2,3*(i-1)+1) = price_qb*share2;
        price_p(3,3*(i-1)+1) = price_qb*share3;
        price_p(4,3*(i-1)+1) = price_qb*share1;
    else
        Peple{Car{b3(i)}.seat(path_zy(2))}.cost = price_qb + prince_km*pp1_km; 
        price_p(1,3*(i-1)+1) = Peple{Car{b3(i)}.seat(path_zy(2))}.cost;
        price_p(2,3*(i-1)+1) = price_qb*share2 + prince_km*p11_km*share1;
        price_p(3,3*(i-1)+1) = price_qb*share3 + prince_km*p11_km*share3;
        price_p(4,3*(i-1)+1) = price_qb*share1 + prince_km*p11_km*share1;
    end
    if p22_km <= 0
        Peple{Car{b3(i)}.seat(path_zy(3))}.cost = price_qb;
        price_p(1,3*(i-1)+2) = Peple{Car{b3(i)}.seat(path_zy(3))}.cost;
        price_p(2,3*(i-1)+2) = price_qb*share2;
        price_p(3,3*(i-1)+2) = price_qb*share3;
        price_p(4,3*(i-1)+2) = price_qb*share1;
    else
        Peple{Car{b3(i)}.seat(path_zy(3))}.cost = price_qb + prince_km*pp2_km; 
        price_p(1,3*(i-1)+2) = Peple{Car{b3(i)}.seat(path_zy(3))}.cost;
        price_p(2,3*(i-1)+2) = price_qb*share2 + prince_km*p11_km*share1 + prince_km*(p2_km-p1_km)*share2;
        price_p(3,3*(i-1)+2) = price_qb*share3 + prince_km*p11_km*share3 + prince_km*(p2_km-p1_km)*share3;
        price_p(4,3*(i-1)+2) = price_qb*share1 + prince_km*p11_km*share1 + prince_km*(p2_km-p1_km)*share2 - (p2_km-pp2_km)*alph;
    end
    if p33_km <= 0
        Peple{Car{b3(i)}.seat(path_zy(4))}.cost = price_qb;
        price_p(1,3*(i-1)+3) = Peple{Car{b3(i)}.seat(path_zy(4))}.cost;
        price_p(2,3*(i-1)+3) = price_qb*share2;
        price_p(3,3*(i-1)+3) = price_qb*share3;
        price_p(4,3*(i-1)+3) = price_qb*share1;
    else
        Peple{Car{b3(i)}.seat(path_zy(4))}.cost = price_qb + prince_km*pp3_km; 
        price_p(1,3*(i-1)+3) = Peple{Car{b3(i)}.seat(path_zy(4))}.cost;
        price_p(2,3*(i-1)+3) = price_qb*share2 + prince_km*p22_km*share2 + prince_km*cd;
        price_p(3,3*(i-1)+3) = price_qb*share3 + prince_km*p11_km*share3 + prince_km*bc*share3 + prince_km*cd*share3;
        price_p(4,3*(i-1)+3) = price_qb*share1 + prince_km*p11_km*share1 + prince_km*bc*share2 + prince_km*cd*share3 - (car_km-pp3_km)*alph;
    end
end
end