function [] = plotting(CL, CD, alpha,linearFunction,linearCLalpha)
    
    figure();

    [alpha,a] = sort(alpha); 
    CL = CL(a);
    CD = CD(a);
    disp(a);
    subplot(2,2,1);
    plot(CL.^2,CD);
    hold on
    plot(CL.^2,polyval(linearFunction,CL.^2),'r')
    
    title('C_L^2 against C_D');
    xlabel('C_D -->');
    ylabel('C_L^2 -->');
    
    subplot(2,2,2);
    plot(CD,CL);
    title('C_L against C_D');
    xlabel('C_D -->');
    ylabel('C_L -->');
    
    subplot(2,2,3);
    plot(alpha,CL);
    hold on
    plot(alpha,polyval(linearCLalpha,alpha),'r')    
    title('C_L against alpha');
    xlabel('alpha -->');
    ylabel('C_L -->');
    
    subplot(2,2,4);
    plot(alpha,CD);
    title('C_D against alpha');
    xlabel('alpha -->');
    ylabel('C_D -->');
    
    clc
    
end