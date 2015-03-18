% Function that plots all necessary graphs.

function [] = plotting(CL, CD, alpha, Re, M, linearFunction, linearCLalpha,ClCdFit,CDAlphaFit)
    
    figure();
    
    % plotting CL^2 - CD graph
    [alpha,a] = sort(alpha); 
    CL = CL(a);
    CD = CD(a);
    subplot(2,2,1);
    line1 = plot(CL.^2,CD,'*');
    hold on
    line2 = plot(CL.^2,polyval(linearFunction,CL.^2),'r');
    title('C_L^2 against C_D');
    xlabel('C_D -->');
    ylabel('C_L^2 -->');
    
    % plotting CL - CD graph
    subplot(2,2,2);
    plot(CD,CL,'*');
    hold on
    plot(linspace(CD(1),CD(end),100),polyval(ClCdFit,linspace(CD(1),CD(end),100)),'r')
    title('C_L against C_D');
    xlabel('C_D -->');
    ylabel('C_L -->');
    
    % plotting CL - alpha graph
    subplot(2,2,3);
    plot(alpha,CL,'*');
    hold on
    plot(alpha,polyval(linearCLalpha,alpha),'r')    
    title('C_L against alpha');
    xlabel('alpha -->');
    ylabel('C_L -->');
    
    % plotting CD - alpha graph
    subplot(2,2,4);
    plot(alpha,CD,'*');
    hold on
    plot(linspace(alpha(1),alpha(end),100),polyval(CDAlphaFit,linspace(alpha(1),alpha(end),100)),'r')
    title('C_D against alpha');
    xlabel('alpha -->');
    ylabel('C_D -->');
   
    leg = legend([line1,line2],{'Raw Data','CurveFit'});
    newPos = [0.4 0.4 0.2 0.2];
    set(leg,'Position',newPos,'Units','normalized')
    
    str = {['Reynolds Range ' num2str(round(Re(end))/10^7) '*10^7' ' - ' num2str(round(Re(1))/10^7) '*10^7'],['Mach Range ' num2str(M(end)) ' - ' num2str(M(1))]};
    annotation('textbox',newPos,'String',str)
end