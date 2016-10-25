%巴比伦算法的实现思想
close all;
clear all;
clc
Num=10;
sym guess;
sym r;
guess=Num/2;
Time=10;
Guess_Buffer=zeros(1,Time);
R_Buffer=zeros(1,Time);
for n=1:Time
    Guess_Buffer(1,n)=guess;
    r=Num/guess;
    R_Buffer(1,n)=r;
    guess=(r+guess)/2;
end
Diff_Buffer=abs(Guess_Buffer-R_Buffer)
figure,
plot(Guess_Buffer,'b-.*') 
hold on,plot(R_Buffer,'r-.*')
hold on,plot(Diff_Buffer,'g-o');
legend('guess的变化','r的变化','abs(guess-r)的变化');
title('迭代阶数和结果的关系')
xlabel('迭代阶数')
ylabel('输出结果')