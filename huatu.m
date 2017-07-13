function huatu(Peple,Car,b,num)
C = b;
P = Peple;
if Car{C(1)}.maxcap == 1
    figure(),grid on, hold on,box on,xlabel('x'),ylabel('y')
    title('2人共乘起始位置分布')
    for i = 1:num
%         figure(),grid on, hold on,box on,xlabel('x'),ylabel('y')
%         title('2人共乘起始位置分布')
        plot(P{Car{C(i)}.seat(1)}.site(1),P{Car{C(i)}.seat(1)}.site(2),'go')
        plot(P{Car{C(i)}.seat(2)}.destination(1),P{Car{C(i)}.seat(2)}.destination(2),'k^')
        plot([P{Car{C(i)}.seat(1)}.site(1) P{Car{C(i)}.seat(1)}.destination(1)], [P{Car{C(i)}.seat(1)}.site(2) P{Car{C(i)}.seat(1)}.destination(2)], 'r--');
        legend('起始点','终点','直线路径')
        
        plot(P{Car{C(i)}.seat(1)}.destination(1),P{Car{C(i)}.seat(1)}.destination(2),'k^')
        plot(P{Car{C(i)}.seat(2)}.site(1),P{Car{C(i)}.seat(2)}.site(2),'go')      
        plot([P{Car{C(i)}.seat(2)}.site(1) P{Car{C(i)}.seat(2)}.destination(1)], [P{Car{C(i)}.seat(2)}.site(2) P{Car{C(i)}.seat(2)}.destination(2)], 'r--');
        
    end
else
    figure(),grid on,hold on,box on, xlabel('x'),ylabel('y')
    title('3人共乘起始位置分布')
    for i = 1:num
%         figure(),grid on,hold on,box on, xlabel('x'),ylabel('y')
%         title('3人共乘起始位置分布')
        plot(P{Car{C(i)}.seat(1)}.site(1),P{Car{C(i)}.seat(1)}.site(2),'go')
        plot(P{Car{C(i)}.seat(1)}.destination(1),P{Car{C(i)}.seat(1)}.destination(2),'k^')
        plot([P{Car{C(i)}.seat(1)}.site(1) P{Car{C(i)}.seat(1)}.destination(1)], [P{Car{C(i)}.seat(1)}.site(2) P{Car{C(i)}.seat(1)}.destination(2)], 'r--');
        legend('起始点','终点','直线路径')
        
        plot(P{Car{C(i)}.seat(2)}.site(1),P{Car{C(i)}.seat(2)}.site(2),'go')
        plot(P{Car{C(i)}.seat(3)}.site(1),P{Car{C(i)}.seat(3)}.site(2),'go')
        
        
        plot(P{Car{C(i)}.seat(2)}.destination(1),P{Car{C(i)}.seat(2)}.destination(2),'k^')
        plot(P{Car{C(i)}.seat(3)}.destination(1),P{Car{C(i)}.seat(3)}.destination(2),'k^')
        
        
        plot([P{Car{C(i)}.seat(2)}.site(1) P{Car{C(i)}.seat(2)}.destination(1)], [P{Car{C(i)}.seat(2)}.site(2) P{Car{C(i)}.seat(2)}.destination(2)], 'r--');
        plot([P{Car{C(i)}.seat(3)}.site(1) P{Car{C(i)}.seat(3)}.destination(1)], [P{Car{C(i)}.seat(3)}.site(2) P{Car{C(i)}.seat(3)}.destination(2)], 'r--');
    end
end
end

