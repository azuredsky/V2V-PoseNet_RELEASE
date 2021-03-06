
function f = draw_3Dskeleton_NYU(d2img,coord_world)
 
    cubicSz = 225;
    coord_world = squeeze(coord_world);

    x = coord_world(1,:);
    y = coord_world(2,:);
    z = coord_world(3,:);
    coord_world(1,:) = -z;
    coord_world(2,:) = x;
    coord_world(3,:) = y;
    line_width = 8;

    f = figure('Position',[100 100 600 450]);
    set(f, 'visible', 'off');
    hold on;
    grid on;

    plot3([coord_world(1,14),coord_world(1,13)],[coord_world(2,14),coord_world(2,13)],[coord_world(3,14),coord_world(3,13)],'Color',[153/255 255/255 204/255],'LineWidth',line_width) %palm to wrist
    plot3([coord_world(1,14),coord_world(1,12)],[coord_world(2,14),coord_world(2,12)],[coord_world(3,14),coord_world(3,12)],'Color',[153/255 255/255 204/255],'LineWidth',line_width) %palm to wrist back

    plot3([coord_world(1,14),coord_world(1,11)],[coord_world(2,14),coord_world(2,11)],[coord_world(3,14),coord_world(3,11)],'Color',[255/255,153/255,153/255],'LineWidth',line_width) %palm to thumb root
    plot3([coord_world(1,10),coord_world(1,11)],[coord_world(2,10),coord_world(2,11)],[coord_world(3,10),coord_world(3,11)],'Color',[255/255,102/255,102/255],'LineWidth',line_width) %thumb root to thumb mid
    plot3([coord_world(1,9),coord_world(1,10)],[coord_world(2,9),coord_world(2,10)],[coord_world(3,9),coord_world(3,10)],'Color',[255/255,51/255,51/255],'LineWidth',line_width) %thumb mid to thumb tip

    plot3([coord_world(1,14),coord_world(1,8)],[coord_world(2,14),coord_world(2,8)],[coord_world(3,14),coord_world(3,8)],'Color',[153/255,255/255,153/255],'LineWidth',line_width) %palm to index mid
    plot3([coord_world(1,7),coord_world(1,8)],[coord_world(2,7),coord_world(2,8)],[coord_world(3,7),coord_world(3,8)],'Color',[76.5/255,255/255,76.5/255],'LineWidth',line_width) %index mid to index tip

    plot3([coord_world(1,14),coord_world(1,6)],[coord_world(2,14),coord_world(2,6)],[coord_world(3,14),coord_world(3,6)],'Color',[255/255,204/255,153/255],'LineWidth',line_width) %palm to middle mid
    plot3([coord_world(1,5),coord_world(1,6)],[coord_world(2,5),coord_world(2,6)],[coord_world(3,5),coord_world(3,6)],'Color',[255/255,165.5/255,76.5/255],'LineWidth',line_width) %middle mid to middle tip

    plot3([coord_world(1,14),coord_world(1,4)],[coord_world(2,14),coord_world(2,4)],[coord_world(3,14),coord_world(3,4)],'Color',[153/255,204/255,255/255],'LineWidth',line_width) %palm to ring mid
    plot3([coord_world(1,3),coord_world(1,4)],[coord_world(2,3),coord_world(2,4)],[coord_world(3,3),coord_world(3,4)],'Color',[76.5/255,165.5/255,255/255],'LineWidth',line_width) %ring mid to ring tip

    plot3([coord_world(1,14),coord_world(1,2)],[coord_world(2,14),coord_world(2,2)],[coord_world(3,14),coord_world(3,2)],'Color',[255/255,153/255,255/255],'LineWidth',line_width) %palm to pinky mid
    plot3([coord_world(1,1),coord_world(1,2)],[coord_world(2,1),coord_world(2,2)],[coord_world(3,1),coord_world(3,2)],'Color',[255/255,76.5/255,255/255],'LineWidth',line_width) %pinky mid to pinky tip

    colorList = [
    255/255 76.5/255 255/255;
    255/255 153/255 255/255;

    76.5/255 165.5/255 255/255;
    127.5/255 204/255 255/255;

    255/255 165.5/255 76.5/255;
    255/255 204/255 127.5/255;

    76.5/255 255/255 76.5/255;
    153/255 255/255 153/255;

    255/255 51/255 51/255;
    255/255 102/255 102/255;
    255/255 153/255 153/255;

    153/255 255/255 204/255;
    153/255 255/255 204/255;
    230/255 230/255 0/255;
    ];
    scatter3(coord_world(1,:),coord_world(2,:),coord_world(3,:),150,colorList,'filled');

    set(gca, 'color', [255/255 255/255 255/255])
    set(gca,'XTickLabel',[]);
    set(gca,'YTickLabel',[]);
    set(gca,'ZTickLabel',[]);
    
    xcenter = (min(coord_world(1,:)) + max(coord_world(1,:)))/2;
    ycenter = (min(coord_world(2,:)) + max(coord_world(2,:)))/2;
    zcenter = (min(coord_world(3,:)) + max(coord_world(3,:)))/2;
    
    xmin = xcenter - 3*cubicSz;
    xmax = max(coord_world(1,:));
    ymin = min(ycenter-cubicSz/2, min(coord_world(2,:)));
    ymax = max(coord_world(2,:))+30;
    zmin = min(zcenter-cubicSz/2, min(coord_world(3,:)));
    zmax = max(zcenter+cubicSz/2, max(coord_world(3,:)));
    
    xlim([xmin xmax]);
    ylim([ymin ymax]);
    zlim([zmin zmax]);
    
    h_img = surf([xmin;xmin],[ymin ymax;ymin ymax],[zmax zmax;zmin zmin],'CData',d2img,'FaceColor','texturemap');
    set(h_img,'edgecolor',[96/255 96/255 96/255]);
    
    view(62,7);

end

