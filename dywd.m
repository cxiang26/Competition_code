%%´òÓ¡ÎÄµµ
load sch1.mat
[m,n] = size(sch1);
i =1;
for a = 1:m
    if find(sch1(a)>0)~=0
        temp_a = sch1(a,:);
        if length(find(temp_a>0)) == 2
            fprintf('t%04d, p%04du, p%04d \n',i,temp_a(1),temp_a(2));
        elseif length(find(temp_a>0)) == 4
            if temp_a(1) == temp_a(2)
                fprintf('t%04d, p%04du, p%04dd, p%04du, p%04dd \n',i,temp_a(1),temp_a(1),temp_a(2),temp_a(2));
            elseif temp_a(1) == temp_a(3)
                fprintf('t%04d, p%04du, p%04du, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(1),temp_a(2));
            else
                fprintf('t%04d, p%04du, p%04du, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(2),temp_a(1));
            end
        else
            if temp_a(1) == temp_a(2) && temp_a(3)==temp_a(4) && temp_a(5)==temp_a(6)
                fprintf('t%04d, p%04du, p%04dd, p%04du, p%04dd ,p%04du, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(2) && temp_a(3) == temp_a(5) && temp_a(4) == temp_a(6)
                fprintf('t%04d, p%04du, p%04dd, p%04du, p%04du, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(2) && temp_a(3) == temp_a(6) && temp_a(4) == temp_a(5)
                fprintf('t%04d, p%04du, p%04dd, p%04du, p%04du, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(3) && temp_a(2) == temp_a(4) && temp_a(5) == temp_a(6)
                fprintf('t%04d, p%04du, p%04du, p%04dd, p%04dd, p%04du, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(3) && temp_a(2) == temp_a(5) && temp_a(4) == temp_a(6)
                fprintf('t%04d, p%04du, p%04du, p%04dd, p%04du, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(3) && temp_a(2) == temp_a(6) && temp_a(4) == temp_a(5)
                fprintf('t%04d, p%04du, p%04du, p%04dd, p%04du, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(4) && temp_a(2) == temp_a(3) && temp_a(5) == temp_a(6)
                fprintf('t%04d, p%04du, p%04du, p%04dd, p%04dd, p%04du, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(4) && temp_a(2) == temp_a(5) && temp_a(3) == temp_a(6)
                fprintf('t%04d, p%04du, p%04du, p%04du, p%04dd, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(4) && temp_a(2) == temp_a(6) && temp_a(3) == temp_a(5)
                fprintf('t%04d, p%04du, p%04du, p%04du, p%04dd, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(5) && temp_a(2) == temp_a(3) && temp_a(4) == temp_a(6)
                fprintf('t%04d, p%04du, p%04du, p%04dd, p%04du, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(5) && temp_a(2) == temp_a(4) && temp_a(3) == temp_a(6)
                fprintf('t%04d, p%04du, p%04du, p%04du, p%04dd, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(5) && temp_a(2) == temp_a(6) && temp_a(3) == temp_a(4)
                fprintf('t%04d, p%04du, p%04du, p%04du, p%04dd, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(6) && temp_a(2) == temp_a(3) && temp_a(4) == temp_a(5)
                fprintf('t%04d, p%04du, p%04du, p%04dd, p%04du, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(6) && temp_a(2) == temp_a(4) && temp_a(3) == temp_a(5)
                fprintf('t%04d, p%04du, p%04du, p%04du, p%04dd, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            elseif temp_a(1) == temp_a(6) && temp_a(2) == temp_a(5) && temp_a(3) == temp_a(4)
                fprintf('t%04d, p%04du, p%04du, p%04du, p%04dd, p%04dd, p%04dd \n',i,temp_a(1),temp_a(2),temp_a(3),temp_a(4),temp_a(5),temp_a(6));
            end
        end
        i = i+1;
    end
end
% b = b3;
% pc = zeros(size(b,2),18);
% for i = 1:size(b,2)
%     path = zylj(P,Car{b(i)});
%     pc(i,1) = b(i);
%     pc(i,2) = Car{b(i)}.seat(path(2));
%     pc(i,3) = Car{b(i)}.seat(path(3));
%     pc(i,4) = Car{b(i)}.seat(path(4));
%     pc(i,5) = Car{b(i)}.site(1);
%     pc(i,6) = Car{b(i)}.site(2);
%     pc(i,7) = P{Car{b(i)}.seat(path(2))}.site(1);
%     pc(i,8) = P{Car{b(i)}.seat(path(2))}.site(2);
%     pc(i,9) = P{Car{b(i)}.seat(path(2))}.destination(1);
%     pc(i,10) = P{Car{b(i)}.seat(path(2))}.destination(2);
%     pc(i,11) = P{Car{b(i)}.seat(path(3))}.site(1);
%     pc(i,12) = P{Car{b(i)}.seat(path(3))}.site(2);
%     pc(i,13) = P{Car{b(i)}.seat(path(3))}.destination(1);
%     pc(i,14) = P{Car{b(i)}.seat(path(3))}.destination(2);
%     pc(i,15) = P{Car{b(i)}.seat(path(4))}.site(1);
%     pc(i,16) = P{Car{b(i)}.seat(path(4))}.site(2);
%     pc(i,17) = P{Car{b(i)}.seat(path(4))}.destination(1);
%     pc(i,18) = P{Car{b(i)}.seat(path(4))}.destination(2);
% end
% pc = zeros(size(b,2),13);
% for i = 1:size(b,2)
%     path = zylj(P,Car{b(i)});
%     pc(i,1) = b(i);
%     pc(i,2) = Car{b(i)}.seat(path(2));
%     pc(i,3) = Car{b(i)}.seat(path(3));
%     pc(i,4) = Car{b(i)}.site(1);
%     pc(i,5) = Car{b(i)}.site(2);
%     pc(i,6) = P{Car{b(i)}.seat(path(2))}.site(1);
%     pc(i,7) = P{Car{b(i)}.seat(path(2))}.site(2);
%     pc(i,8) = P{Car{b(i)}.seat(path(2))}.destination(1);
%     pc(i,9) = P{Car{b(i)}.seat(path(2))}.destination(2);
%     pc(i,10) = P{Car{b(i)}.seat(path(3))}.site(1);
%     pc(i,11) = P{Car{b(i)}.seat(path(3))}.site(2);
%     pc(i,12) = P{Car{b(i)}.seat(path(3))}.destination(1);
%     pc(i,13) = P{Car{b(i)}.seat(path(3))}.destination(2);
% end