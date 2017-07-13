function [bz_xy, D] = d_qiujie(xy)
[m,n] = size(xy);
bz_xy = zeros(m,n);
if n == 8
    for i = 1:m
        x = xy(i,1);
        x1 = xy(i,3);
        x2 = xy(i,5);
        x3 = xy(i,7);
        y = xy(i,2);
        y1 = xy(i,4);
        y2 = xy(i,6);
        y3 = xy(i,8);
        temp = minmax([x x1 x2 x3]);
        x_min = temp(1);
        x_max = temp(2);
        temp = minmax([y y1 y2 y3]);
        y_min = temp(1);
        y_max = temp(2);
        bianchang = max((y_max-y_min),(x_max-x_min))+1;
        x = x-x_min+1;
        x1 = x1-x_min+1;
        x2 = x2-x_min+1;
        x3 = x3-x_min+1;
        y = y-y_min+1;
        y1 = y1-y_min+1;
        y2 = y2-y_min+1;
        y3 = y3-y_min+1;
        bz_xy(i,:) = [x x1 x2 x3 y y1 y2 y3];
        D{i} = ones(bianchang*bianchang);
        D{i}(:) = inf;
        for j = 1:bianchang^2
            for k = j:bianchang^2
                if j == k
                    D{i}(j,k) = 0;
                elseif j == k-1 &&  mod(j,bianchang) ~= 0
                    D{i}(j,k) = 1;
                    D{i}(k,j) = 1;
                elseif j == (k-bianchang)
                    D{i}(j,k) = 1;
                    D{i}(k,j) = 1;
                end
            end
        end
    end
else
    for i = 1:m
        x = xy(i,1);
        x1 = xy(i,3);
        x2 = xy(i,5);
        y = xy(i,2);
        y1 = xy(i,4);
        y2 = xy(i,6);
        temp = minmax([x x1 x2]);
        x_min = temp(1);
        x_max = temp(2);
        temp = minmax([y y1 y2]);
        y_min = temp(1);
        y_max = temp(2);
        bianchang = max((y_max-y_min),(x_max-x_min))+1;
        x = x-x_min+1;
        x1 = x1-x_min+1;
        x2 = x2-x_min+1;
        y = y-y_min+1;
        y1 = y1-y_min+1;
        y2 = y2-y_min+1;
        bz_xy(i,:) = [x x1 x2 y y1 y2];
        D{i} = ones(bianchang*bianchang);
        D{i}(:) = inf;
        for j = 1:bianchang^2
            for k = j:bianchang^2
                if j == k
                    D{i}(j,k) = 0;
                elseif j == k-1 && mod(j,bianchang) ~= 0
                    D{i}(j,k) = 1;
                    D{i}(k,j) = 1;
                elseif j == (k-bianchang)
                    D{i}(j,k) = 1;
                    D{i}(k,j) = 1;
                end
            end
        end
    end
end
end