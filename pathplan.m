function [path_node, path_xcnode, bc] = pathplan(place_xy,D)
[m, n] = size(place_xy);
path_node = {};
path_xcnode = {};
for i = 1:m
    [m1,n1] = size(D{i});
    if sqrt(m1) > 20
        D{i} = [];
    end
end
for k = 1:m
    if ~isempty(D{k})
        [m1,n1] = size(D{k});
        %     if sqrt(m1) > 20
        %         k = k+1;
        %         [m1,n1] = size(D{k});
        %     end
        d = zeros(m1,n1,100);
        d(:,:,1)=D{k}; %初始距离矩阵
        z=ones(1,m1);
        bc = sqrt(m1);
        %计算所有点之间的最短距离
        dmin = zeros(m1,n1);
        for i=2:size(d,3)
            for j=1:m1
                d(j,:,i) = min( d(j,:,i-1)' * z+d(:,:,1) )';
            end
            if d(:,:,i)==d(:,:,i-1)
                dmin(:,:)=d(:,:,i-1);
                break;
            end
        end
        
        temp = [];
        temp1 = [];
        
        %计算最优路径
        %     rx=[place_xy(k,1),place_xy(k,2)];ry=[place_xy(k,4),place_xy(k,5)]; sx=[place_xy(k,2),place_xy(k,3)];sy=[place_xy(k,4),place_xy(k,6)];
        if n == 6
            rx=[sqrt(m1)-place_xy(k,4)+1,sqrt(m1)-place_xy(k,5)+1];ry=[place_xy(k,1),place_xy(k,2)]; sx=[sqrt(m1)-place_xy(k,5)+1,sqrt(m1)-place_xy(k,6)+1];sy=[place_xy(k,2),place_xy(k,3)];
            xy = [rx(1) ry(1);sx(1) sy(1);sx(2) sy(2)];
        else
            rx=[sqrt(m1)-place_xy(k,5)+1,sqrt(m1)-place_xy(k,6)+1,sqrt(m1)-place_xy(k,7)+1];ry=[place_xy(k,1),place_xy(k,2),place_xy(k,3)]; sx=[sqrt(m1)-place_xy(k,6)+1,sqrt(m1)-place_xy(k,7)+1,sqrt(m1)-place_xy(k,8)+1];sy=[place_xy(k,2),place_xy(k,3),place_xy(k,4)];
            xy = [rx(1) ry(1);sx(1) sy(1);sx(2) sy(2);sx(3) sy(3)];
        end
        temp1 = [temp1;xy];
        path_xcnode{k} = temp1;
        Msum =0;
        for i=1:((n-2)/2)
            while (sx(i) ~= rx(i) || sy(i) ~= ry(i))
                if rx(i)>1 &&  ry(i)>1 && (rx(i)<bc && ry(i)<bc)  %内部
                    [M,I] = min([dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)+1)+dmin((rx(i)-1)*bc+ry(i)+1,(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)-1)+dmin((rx(i)-1)*bc+ry(i)-1,(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i))*bc+ry(i))+dmin((rx(i))*bc+ry(i),(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-2)*bc+ry(i))+dmin((rx(i)-2)*bc+ry(i),(sx(i)-1)*bc+sy(i))]);
                elseif rx(i)==1 && ry(i)>1 && ry(i)<bc %上边
                    [M,I] = min([dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)+1)+dmin((rx(i)-1)*bc+ry(i)+1,(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)-1)+dmin((rx(i)-1)*bc+ry(i)-1,(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i))*bc+ry(i))+dmin((rx(i))*bc+ry(i),(sx(i)-1)*bc+sy(i))]);
                elseif rx(i)>1 && ry(i)==1 && rx(i)<bc %左边
                    [M,I] = min([dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)+1)+dmin((rx(i)-1)*bc+ry(i)+1,(sx(i)-1)*bc+sy(i)),...
                        100000000000000,...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i))*bc+ry(i))+dmin((rx(i))*bc+ry(i),(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-2)*bc+ry(i))+dmin((rx(i)-2)*bc+ry(i),(sx(i)-1)*bc+sy(i))]);
                elseif rx(i)==1 && ry(i)==1  %左顶点
                    [M,I] = min([dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)+1)+dmin((rx(i)-1)*bc+ry(i)+1,(sx(i)-1)*bc+sy(i)),...
                        100000000000000,...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i))*bc+ry(i))+dmin((rx(i))*bc+ry(i),(sx(i)-1)*bc+sy(i)),...
                        100000000000000]);
                elseif rx(i)==bc && ry(i)<bc && ry(i)>1 %下边
                    [M,I] = min([dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)+1)+dmin((rx(i)-1)*bc+ry(i)+1,(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)-1)+dmin((rx(i)-1)*bc+ry(i)-1,(sx(i)-1)*bc+sy(i)),...
                        100000000000,...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-2)*bc+ry(i))+dmin((rx(i)-2)*bc+ry(i),(sx(i)-1)*bc+sy(i))]);
                elseif rx(i)<bc && rx(i)>1 && ry(i)==bc %右边
                    [M,I] = min([1000000000000,...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)-1)+dmin((rx(i)-1)*bc+ry(i)-1,(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i))*bc+ry(i))+dmin((rx(i))*bc+ry(i),(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-2)*bc+ry(i))+dmin((rx(i)-2)*bc+ry(i),(sx(i)-1)*bc+sy(i))]);
                elseif rx(i)==bc && ry(i)==1  %左下顶点
                    [M,I] = min([dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)+1)+dmin((rx(i)-1)*bc+ry(i)+1,(sx(i)-1)*bc+sy(i)),...
                        1000000000000,...
                        1000000000000,...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-2)*bc+ry(i))+dmin((rx(i)-2)*bc+ry(i),(sx(i)-1)*bc+sy(i))]);
                elseif rx(i)==bc && ry(i)==bc %右下顶点
                    [M,I] = min([100000000,...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)-1)+dmin((rx(i)-1)*bc+ry(i)-1,(sx(i)-1)*bc+sy(i)),...
                        10000000000,...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-2)*bc+ry(i))+dmin((rx(i)-2)*bc+ry(i),(sx(i)-1)*bc+sy(i))]);
                elseif rx(i)==1 && ry(i)==bc  %右上顶点
                    [M,I] = min([100000000,...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)-1)+dmin((rx(i)-1)*bc+ry(i)-1,(sx(i)-1)*bc+sy(i)),...
                        dmin((rx(i)-1)*bc+ry(i),(rx(i))*bc+ry(i))+dmin((rx(i))*bc+ry(i),(sx(i)-1)*bc+sy(i)),...
                        100000000]);
                end
                if I==1
                    Msum = dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)+1)+Msum;
                    ry(i)=ry(i)+1;
                elseif I==2
                    Msum = dmin((rx(i)-1)*bc+ry(i),(rx(i)-1)*bc+ry(i)-1)+Msum;
                    ry(i)=ry(i)-1;
                elseif I==3
                    Msum =dmin((rx(i)-1)*bc+ry(i),(rx(i))*bc+ry(i))+Msum;
                    rx(i)=rx(i)+1;
                else
                    Msum = dmin((rx(i)-1)*bc+ry(i),(rx(i)-2)*bc+ry(i))+Msum;
                    rx(i)=rx(i)-1;
                end
                %             fprintf('(%d, %d)   %d->\n',rx(i), ry(i), Msum);
                temp = [temp;rx(i) ry(i)];
                if (rx(i)>bc || ry(i)>bc)
                    break;
                end
            end
        end
        path_node{k} = temp;
    end
end
end


