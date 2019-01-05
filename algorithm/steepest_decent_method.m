%steepest_decent_method example

% x = x
% y = x^2 


syms x;
  y=x^2;
  x=2;k=0;step=0.1;
  ezplot(y,[-3,3,0,6]);
  f_current=x^2;
  f_change=1;%???????
  fprintf('at the beginning f_current:%.5f\n',f_current);
  fprintf('at the beginning f_change:%.5f\n',f_change);
  hold on;
  while abs(f_change)>0.0000001
      f_current=x^2;%??????
      x=x-step*2*x;%??????x????~
      f_change=f_current-x^2;%????????
      fprintf('%d times later x:%.10f changed value is y:%.10f\n',k+1,x,x^2);
      %?????????????
      plot(x,x^2,'ro','markersize',5);
      drawnow;%matlab?????plot??????????drawnow????
      pause(0.2);%??0.2?
      k=k+1;
  end
  fprintf('border upon value:%.10f',f_change);
  hold off;
