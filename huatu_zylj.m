function huatu_zylj(P,Car,b,N)
N_car = length(b);
if N > N_car
    print('维度不匹配');
end
if Car{b(1)}.maxcap == 0
    
    for i = 1:N
        figure(),hold on
        grid on
        box on
        xlabel('x'),ylabel('y')
        title('3人共乘最优直线路径规划')
        path = zylj(P,Car{b(i)});
        %         path = [0 1 2 3];
        node_a = Car{b(i)}.site;
        node_b = P{Car{b(i)}.seat(path(2))}.destination;
        node_c = P{Car{b(i)}.seat(path(3))}.destination;
        node_d = P{Car{b(i)}.seat(path(4))}.destination;
        plot(node_a(1),node_a(2),'go')
        plot([node_b(1) node_c(1)],[node_b(2) node_c(2)],'k.')
%         plot(node_c(1),node_c(2),'k.')
        plot(node_d(1),node_d(2),'k^')

        plot([node_a(1) node_b(1)], [node_a(2) node_b(2)], 'r-');
        legend('起始点','中间站点','终点','直线最优路径')
        plot([node_b(1) node_c(1)], [node_b(2) node_c(2)], 'r-');
        plot([node_c(1) node_d(1)], [node_c(2) node_d(2)], 'r-');
        
    end
end

if Car{b(1)}.maxcap == 1
    
    for i = 1:N
        figure(),hold on
        grid on
        box on
        xlabel('x'),ylabel('y')
        title('2人共乘最优直线路径规划')
        path = zylj(P,Car{b(i)});
        node_a = Car{b(i)}.site;
        node_b = P{Car{b(i)}.seat(path(2))}.destination;
        node_c = P{Car{b(i)}.seat(path(3))}.destination;
        plot(node_a(1),node_a(2),'go')
        plot(node_b(1),node_b(2),'k.')
        plot(node_c(1),node_c(2),'k^')
        plot([node_a(1) node_b(1)], [node_a(2) node_b(2)], 'r-');
        legend('起始点','中间站点','终点','直线最优路径')
        plot([node_b(1) node_c(1)], [node_b(2) node_c(2)], 'r-');
        
    end
end
end