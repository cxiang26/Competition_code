function vis_pn(path_node, path_xcnode, k)


for i = 1:k
    if ~isempty(path_node{i})
        m = max(max(path_node{i}));
        figure(),hold on,grid on,box on
        axis ij
        axis([0 m+1 0 m+1])
        set(gca,'xaxislocation','top');
        set(gca,'XTick',0:1:m+1);
        set(gca,'YTick',0:1:m+1);
        xlabel('x');
        ylabel('y');
        title('城市路网最优路径')
        [m1,~] = size(path_node{i});
        plot(path_node{i}(1,1),path_node{i}(1,2),'go')
        plot(path_xcnode{i}(2:end-1,1),path_xcnode{i}(2:end-1,2),'b*')
        plot(path_node{i}(end,1),path_node{i}(end,2),'k^')
        legend('起始点','中间站点','终点')
        plot(path_node{i}(2:end-1,1),path_node{i}(2:end-1,2),'k.')
        for j = 2:m1
            plot([path_node{i}(j-1,1) path_node{i}(j,1)], [path_node{i}(j-1,2) path_node{i}(j,2)], 'r-');
        end
    end
end

end