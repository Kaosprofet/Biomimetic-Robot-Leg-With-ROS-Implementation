function [] = slider_plot(m)
% Plot different plots according to slider location.

S.fh = figure('units','pixels',...
              'position',[300 300 300 300],...
              'menubar','none',...
              'name','slider_plot',...
              'numbertitle','off',...
              'resize','off');    
S.x = 1;  % For plotting.         
S.ax = axes('unit','pix',...
            'position',[20 80 260 210]);
S.LN = plot(S.x,S.x,'ro');
xlim([0 m+1]);
ylim([0 m+1]);
zlim([0,m+1]);
grid on
S.sl = uicontrol('style','slide',...
                 'unit','pix',...
                 'position',[20 10 260 30],...
                 'min',1,'max',m,'val',1,...
                 'sliderstep',[1/(m-1) 1/(m-1)],...
                 'callback',{@sl_call,S});  
function [] = sl_call(varargin)
% Callback for the slider.
[h,S] = varargin{[1,3]};  % calling handle and data structure.
set(S.LN,'ydata',round(get(h,'value')),'xdata',round(get(h,'value')))