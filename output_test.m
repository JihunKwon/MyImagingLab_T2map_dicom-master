for i=1:size(t2map,4)
    [values(:,:,i),b(:,:,:,i),p{i}]=roi_values(t2map,t2map(:,:,1,i),numofrois);
    clf;set(gcf,'Units','normalized','OuterPosition',[0 0 1 1]);
    subplot(1,2,1);imagesc(t2map(:,:,1,1));colormap(gray);img_setting1;title('ROI');hold on
    roi_para_drawing(p{i},numofrois)
    subplot(1,2,2);plot(values(:,:,i),'LineWidth',2);xlswrite(strcat('\results\ROI_values.xlsx'),out,'A1');
    axis_setting1; title('Dynamic T2')
    saveas(gcf,strcat(dirname_crop,'\results\plot_s',num2str(i),'.tif'))
    %out(:,i) = (values(:,:,i));
    %xlswrite(strcat(dirname_crop,'\results\ROI_values.xlsx'),values(:,:,i),i,'A1');%J: Original code
    xlswrite(strcat(dirname_crop, '\results\ROI_values.xlsx'),values(:,:,i),i,'A1');%J: This works for cropped figures
end
