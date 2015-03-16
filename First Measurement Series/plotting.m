function [] = plotting(CL, CD, alpha,linearFunction,linearCLalpha)
    
    figure();
    [alpha,a] = sort(alpha); 
    CL = CL(a);
    CD = CD(a);
    subplot(2,2,1);
    plot(CD,CL.^2);
    hold on
    plot(CD,polyval(linearFunction,CD),'r')
    legend('Raw Data','Trendline','Location','northwest')
    title('C_D against C_L^2');
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
    legend('Raw Data','Trendline','Location','northwest')
    

    subplot(2,2,4);
    plot(alpha,CD);
    title('C_D against alpha');
    xlabel('alpha -->');
    ylabel('C_D -->');

end