%1): Reduce the noise
f1=imread('proj5.gif');
[M,N]=size(f1);

for i=1:M
    for j=1:N
       if f1(i,j)>50 % what threshold to take can be a question
           f1(i,j)=1;
       else
           f1(i,j)=0;
       end
    end
end
imtool(f1,[]);%binary value image

% Do the Erosion, result noted as f2, compare the result of a 3*1 mask and
% a 3*3 mask
f2=zeros(M,N);
for i=2:M-1
    for j=2:N-1
        if f1(i+1,j+1)==1 || f1(i+1,j)==1 || f1(i+1,j-1)==1 || f1(i,j+1)==1 || f1(i,j)==1 || f1(i,j-1)==1 || f1(i-1,j+1)==1 || f1(i-1,j)==1 || f1(i-1,j-1)==1
            f2(i,j)=1;
        else
            f2(i,j)=0;
        end
    end
end
imtool(f2,[]);%noise reduced


%2):Extract letters function
%note that x is the input image
%1st step: A1 = A eroded by B
[m,n]=size(f2);
f3=zeros(m,n);
B=ones(42,1);
for i=22:m-21
    for j=1:n
        f3(i,j)=max(f2(i-21:i+21,j));
    end
end
%imtool(f3,[]);


%2nd step: perform the dilation and do the iteration
D=f3;
k=1;
while(k<50)
[m,n]=size(D);
f4=ones(m,n);
B8=ones(3,3);
for i=2:m-1
    for j=2:n-1
        f4(i,j)=min(min(D(i-1:i+1,j-1:j+1))); 
    end
end
%imtool(f4,[]);

%3rd step: do the intersection  
[m,n]=size(f4);

for i=1:m
    for j=1:n
        if f4(i,j)==0 && f2(i,j)==0
            D(i,j)=0; 
        else 
            D(i,j)=1;
        end
    end
end

imtool(D,[]);
k=k+1;
end


%perfomr edge detection
[m,n]=size(D);
E=ones(m,n);
B=ones(3,3);
for i=2:m-1
    for j=2:n-1
        E(i,j)=1-(D(i,j)-min(min(D(i-1:i+1,j-1:j+1))));%Try to make the background to be 0 and foreground to be 1
    end
end

imtool(E,[]);

