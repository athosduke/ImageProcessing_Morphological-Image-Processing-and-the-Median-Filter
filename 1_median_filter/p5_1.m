%median filtering the "proj5"
f1=imread('proj5.gif');
f2=imread('wheelpepper.gif');
fnew_1=medfilt2(f1,[3 3]);
fnew_2=medfilt2(f2,[3 3]);
imtool(f1,[]);
imtool(f2,[]);
imtool(fnew_1,[]);
imtool(fnew_2,[]);

%plot the histogram of "proj5"
[M,N]=size(f1);
Histogram=zeros(256,1); 
for i=1:M
    for j=1:N
        temp=f1(i,j)+1;  
        Histogram(temp)= Histogram(temp)+1;        
    end
end
figure(1);
bar(Histogram)

[L,K]=size(f2);
Histogram1=zeros(256,1); 
for i=1:L
    for j=1:K
        temp=f2(i,j)+1;  
        Histogram1(temp)= Histogram1(temp)+1;        
    end
end
figure(2);
bar(Histogram1)

[M,N]=size(fnew_1);
Histogram2=zeros(256,1); 
for i=1:M
    for j=1:N
        temp=fnew_1(i,j)+1;  
        Histogram2(temp)= Histogram2(temp)+1;        
    end
end
figure(3);
bar(Histogram2)

[L,K]=size(fnew_2);
Histogram3=zeros(256,1); 
for i=1:L
    for j=1:K
        temp=fnew_2(i,j)+1;  
        Histogram3(temp)= Histogram3(temp)+1;        
    end
end
figure(4);
bar(Histogram3)
