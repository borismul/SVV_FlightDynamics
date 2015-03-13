function [] = plotting(CL, CD, alpha)
    
    figure();
       
    [alpha,a] = sort(alpha); 
    CL = CL(a);
    CD = CD(a);
    disp(a);
    subplot(2,2,1)
    plot(CD,CL.^2);
    title('C_L^2 against C_D');
    xlabel('C_D -->');
    ylabel('C_L^2 -->');
    
    subplot(2,2,2);
    plot(CD,CL)
    title('C_L against C_D');
    xlabel('C_D -->');
    ylabel('C_L -->');
    
    subplot(2,2,3);
    plot(alpha,CL)
    title('C_L against alpha');
    xlabel('alpha -->');
    ylabel('C_L -->');

    
    subplot(2,2,4);
    plot(alpha,CD)
    title('C_D against alpha');
    xlabel('alpha -->');
    ylabel('C_D -->');
    


end