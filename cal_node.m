function node = cal_node(P,Car,car_p)

if Car{car_p(1)}.maxcap == 0
    % 三人共乘
    place_xy = zeros(length(car_p),8); %存放节点坐标
    for i = 1:length(car_p)
        car_path = zylj(P,Car{car_p(i)});
        place_xy(i,1:2) = Car{car_p(i)}.site;
        place_xy(i,3:4) = P{Car{car_p(i)}.seat(car_path(2))}.destination;
        place_xy(i,5:6) = P{Car{car_p(i)}.seat(car_path(3))}.destination;
        place_xy(i,7:8) = P{Car{car_p(i)}.seat(car_path(4))}.destination;
    end
    node = place_xy;
else Car{car_p(1)}.maxcap == 1
    % 两人共乘
    place_xy = zeros(length(car_p),6);  %存放节点坐标
    for i = 1:length(car_p)
        car_path = zylj(P,Car{car_p(i)});
        place_xy(i,1:2) = Car{car_p(i)}.site;
        place_xy(i,3:4) = P{Car{car_p(i)}.seat(car_path(2))}.destination;
        place_xy(i,5:6) = P{Car{car_p(i)}.seat(car_path(3))}.destination;
    end
    node = place_xy;
end
end