function chromosome= objFun(population,V)
% Input:
% population      - Input solutions
% V               - Number of decision value
% Output:
% chromosome      - The chromosome is composed of decision value and
% objective value
    population=population(:,1:V);
%    obj=WFG4(3,10,individual);
    obj=DTLZ2_3(population,3,V);
    chromosome=[population obj];
end

function obj =DTLZ2_3(POP,m,c)
        g=sum((POP(:,m:c)-0.5).^2,2);
        obj(:,1)=prod(cos(0.5*pi*POP(:,1:m-1)),2).*(1+g);
        for i=2:m-1
            obj(:,i)=prod(cos(0.5*pi*POP(:,1:m-i)),2).*(sin(0.5*pi*POP(:,m+1-i))).*(1+g);
        end
        obj(:,m)=(sin(0.5*pi*POP(:,1))).*(1+g);
end


function [ obj ] =WFG4( m,k,z )
c=size(z,2);
n=size(z,1);
bu=2:2:2*c;
x=z./(ones(n,1)*bu);
A=30;
B=10;
C=0.35;

for i=1:c
    t1(:,i)=(1+cos((4*A+2)*pi*(0.5-(abs(x(:,i)-C))./(2*(floor(C-x(:,i))+C))))+4*B*(((abs(x(:,i)-C))./(2*(floor(C-x(:,i))+C))).^2))/(B+2);
end
for i=1:m-1
    y=t1(:,(i-1)*k/(m-1)+1:i*k/(m-1));
    t2(:,i)=sum(y,2)/size(y,2);
end
y=t1(:,k+1:end);
t2(:,m)=sum(y,2)/size(y,2);
x=[];
for i=1:1
    x(:,i)=max(t2(:,m),ones(n,1)).*(t2(:,i)-0.5)+0.5;
end
for i=2:m-1
    x(:,i)=max(t2(:,m),ones(n,1)).*(t2(:,i)-0.5)+0.5;
end
x(:,m)=t2(:,m);

h(:,1)=prod(sin(0.5*pi*x(:,1:m-1)),2);
for i=2:m-1
    h(:,i)=prod(sin(0.5*pi*x(:,1:m-i)),2).*(cos(0.5*pi*x(:,m-i+1)));
end
h(:,m)=cos(0.5*pi*x(:,1));
s=2:2:2*m;
s=ones(n,1)*s;
obj=x(:,m)*ones(1,m)+s.*h;
end