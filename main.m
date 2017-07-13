%%程序每次运行车辆均随机打乱循序,结果也不相同
clc
clear
load ('requst_1')
load ('taxi_ID')
car.label = 0;
car.site=[0 0];%车的实际坐标
car.maxcap=3;      %车的剩余乘客容量，非空载时小于3
car.seat = [0 0 0];
car.light=1;    %车是否空载空载为1，非空载为0
car.destination=[0 0];%车的目的地，有乘客需求时为乘客目的地，
car.cost=0;

peple.car_label = [];
peple.label = 0; %人的标签
peple.site=[0 0];%乘客的位置
peple.destination=[0 0];%乘客的目的地
peple.need=1;%乘客是否有叫车需求，当调度中心为其安排了车时置0
peple.agree=1;%合乘时是否同意绕道
peple.WaitTime=0;%乘客的等待时间
peple.cost=0;%所付车费
peple.TimeCost=0;%乘客车上时间
% N = randperm(1001);
% M = randperm(667);
N = [1:1001];
M = [1:667];
for i = 1:length(N)
    P{i} = peple;
    P{i}.label = N(i);
    P{i}.car_label = [];
    P{i}.site = [request(N(i),1) request(N(i),2)];
    P{i}.destination = [request(N(i),3) request(N(i),4)];
    P{i}.need = 1;
    P{i}.agree = 1;
    P{i}.WaitTime = 0;
    P{i}.cost = 0;
    P{i}.TimeCost = 0;
end

for j = 1:length(M)
    Car{j} = car;
    Car{j}.label = M(j);
    Car{j}.site = [taxi_ID(M(j),1) taxi_ID(M(j),2)];
    Car{j}.maxcap=3;    
    Car{j}.light=1;    
    Car{j}.destination=[0 0];
    Car{j}.cost=0;
    Car{j}.TimeCost=0;
end

lv = []; %行程小于300米
for i = 1:length(N)
    lvcheng = norm(P{i}.destination-P{i}.site);
    if lvcheng < 0.3
        P{i}.agree = 0;
        lv = [lv,i];
    end
end

k=0;
while(k<=5)
tic;
car_0p = [];
car_1p = [];
car_2p = [];
car_3p = [];
for i = 1:length(M)
    if Car{i}.maxcap == 3
        car_0p = [car_0p,i];
    elseif Car{i}.maxcap == 2
        car_1p = [car_1p,i];
    elseif Car{i}.maxcap == 1;
        car_2p = [car_2p,i];
    else
        car_3p = [car_3p,i];
    end
end
car_p = [car_2p,car_1p,car_0p];
temp1 = randperm(length(car_p));
if ~isempty(car_p)
    %% 上车
    for j = 1:length(N)
        for i = 1:length(car_p)
            destance_cp = norm(Car{car_p(temp1(i))}.site-P{j}.site);
            if Car{car_p(temp1(i))}.maxcap ~= 0 && destance_cp < 0.25 && P{j}.need == 1 && isempty(find(P{j}.car_label,car_p(temp1(i)))) ...
                    && P{j}.agree == 1 
                %            & (Car{i}.destination-Car{i}.site)*(P{j}.destination-P{j}.site)'>0
                Car{car_p(temp1(i))}.maxcap = Car{car_p(temp1(i))}.maxcap-1;
                Car{car_p(temp1(i))}.seat(3-Car{car_p(temp1(i))}.maxcap) = j;
                Car{car_p(temp1(i))}.destination = P{j}.destination;
                P{j}.need = 0;
                P{j}.car_label = [P{j}.car_label,car_p(temp1(i))];
            end
        end
    end
end
a = []; %记录未乘车乘客
b1 = []; %记录1位乘客车辆
b2 = []; %记录两位乘客车辆
b3 = []; %记录三位乘客车辆
for i = 1:length(N)
    if P{i}.need ==1
       a=[a,i];
    end
end
for i = 1:length(M)
    if Car{i}.maxcap == 2
        b1 = [b1, i];
    elseif Car{i}.maxcap == 1
        b2 = [b2, i];
    elseif Car{i}.maxcap == 0
        b3 = [b3,i];
    else
        continue;
    end
end
%% 下车
for i = 1:length(M)
    if Car{i}.maxcap < 2
       seat = 3-Car{i}.maxcap;
       if seat == 2
          angle = (P{Car{i}.seat(1)}.destination-P{Car{i}.seat(1)}.site)*(P{Car{i}.seat(2)}.destination-P{Car{i}.seat(2)}.site)';
          if angle < 0.5
             P{Car{i}.seat(2)}.need = 1;
             a = [a,Car{i}.seat(2)];
             Car{i}.seat(2) = 0;
             Car{i}.maxcap = Car{i}.maxcap+1;    
          end
       else
            angle3 = (P{Car{i}.seat(1)}.destination-P{Car{i}.seat(1)}.site)*(P{Car{i}.seat(2)}.destination-P{Car{i}.seat(2)}.site)'/(norm(P{Car{i}.seat(1)}.destination-P{Car{i}.seat(1)}.site)*norm(P{Car{i}.seat(2)}.destination-P{Car{i}.seat(2)}.site));
            angle2 = (P{Car{i}.seat(1)}.destination-P{Car{i}.seat(1)}.site)*(P{Car{i}.seat(3)}.destination-P{Car{i}.seat(3)}.site)'/(norm(P{Car{i}.seat(1)}.destination-P{Car{i}.seat(1)}.site)*norm(P{Car{i}.seat(3)}.destination-P{Car{i}.seat(3)}.site));
            angle1 = (P{Car{i}.seat(2)}.destination-P{Car{i}.seat(2)}.site)*(P{Car{i}.seat(3)}.destination-P{Car{i}.seat(3)}.site)'/(norm(P{Car{i}.seat(2)}.destination-P{Car{i}.seat(2)}.site)*norm(P{Car{i}.seat(3)}.destination-P{Car{i}.seat(3)}.site));
            index = find([angle1 angle2 angle3]>0.5);
            index_neg = find([angle1 angle2 angle3]<=0.5);
            index_len = length(index);
            if index_len ==0
                P{Car{i}.seat(1)}.need = 1;
                P{Car{i}.seat(2)}.need = 1;
                P{Car{i}.seat(3)}.need = 1;
                a = [a,Car{i}.seat(1),Car{i}.seat(2),Car{i}.seat(3)];
                Car{i}.seat(3) = 0;
                Car{i}.seat(2) = 0;
                Car{i}.seat(1) = 0;
                Car{i}.maxcap = Car{i}.maxcap+3;
            elseif index_len == 1
                P{Car{i}.seat(index)}.need = 1;
                a = [a,Car{i}.seat(index)];
                Car{i}.seat(index) = Car{i}.seat(3);
                Car{i}.seat(3) = 0;
                Car{i}.maxcap = Car{i}.maxcap+1;  
            elseif index_len == 2
                if index_neg == 1 || index_neg == 2
                    P{Car{i}.seat(3)}.need = 1;
                    a = [a,Car{i}.seat(3)];
                    Car{i}.seat(3) = 0;
                    Car{i}.maxcap = Car{i}.maxcap+1;
                else 
                    P{Car{i}.seat(2)}.need = 1;
                    a = [a,Car{i}.seat(2)];
                    Car{i}.seat(2) = Car{i}.seat(3);
                    Car{i}.seat(3) = 0;
                    Car{i}.maxcap = Car{i}.maxcap+1;
                end
            else
                continue;
            end
        end             
   end
end
 k = k+1;
 time = toc
end

%% 网格路径优化 网格边长为500
% 三人共乘
place3_xy = round(cal_node(P,Car,b3)*2);
[bz3_xy,D3] = d_qiujie(place3_xy);
[path_node3,path_xcnode3,bc3] = pathplan(bz3_xy,D3);
% 两人共乘
place2_xy = round(cal_node(P,Car,b2)*2); 
[bz2_xy,D2] = d_qiujie(place2_xy);
[path_node2,path_xcnode2,bc2] = pathplan(bz2_xy,D2);
%% 价格计算
[price_2p, price_car2] = Price_2P(P,Car,b2); %两人共乘价格
[price_3p, price_car3] = Price_3P(P,Car,b3); %三人共乘价格

%% 可视化
% huatu(P,Car,a,b1,b2,b3);
% huatu_zylj(P,Car,b3,3);
% vis_pn(path_node3,3);
gongchen_huitu(P,Car,b3,path_xcnode3,path_node3,5);



