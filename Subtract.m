I3=imshow(t2map(:,:,3,1));img_setting1;colormap jet;set(gca,'clim',[0 50]);colorbar;
I25=imshow(t2map(:,:,25,1));img_setting1;colormap jet;set(gca,'clim',[0 50]);colorbar;
Isub = imsubtract(t2map(:,:,25,1),t2map(:,:,3,1));
Irelative = Isub / t2map(:,:,3,1);

%save subtraction
img_setting1;colormap jet;set(gca,'clim',[0 50]);colorbar;caxis('auto')
saveas(gcf,['Sub_autorange.pdf']);
img_setting1;colormap jet;set(gca,'clim',[0 40]);colorbar;
saveas(gcf,['Sub_range0_40.pdf']);

%save relative
img_setting1;colormap jet;set(gca,'clim',[0 50]);colorbar;caxis('auto')
saveas(gcf,['Rel_autorange.pdf']);
img_setting1;colormap jet;set(gca,'clim',[10 50]);colorbar;
saveas(gcf,['Rel_range10_50.pdf']);