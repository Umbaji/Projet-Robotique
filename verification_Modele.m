clear ; close all ; clc ; %initialisation


% Définition des variables (Distances, Vitesses angulaires)
OA = 352 ; AB = 360 ; BC = 360 ; CP = 85 ;

ct = 1 ; N = 50 ;

t = linspace(0,1,N);

theta1P = 3 ; theta2P = 5 ; theta3P = 1;

thetai1 = (-20*pi./180) ; thetai2 = (-150*pi./180) ; thetai3 = (-115*pi./180) ;

% Conditions sur les angles;
theta1=theta1P*t+thetai1;
theta1(theta1<(-20*pi./180))=(-20*pi./180);
theta1(theta1>(180*pi./180))=(180*pi./180);

theta2=theta2P*t+thetai2;
theta2(theta2<(-150*pi./180))=(-150*pi./180);
theta2(theta2>(130*pi./180))=(130*pi./180);

theta3=theta3P*t+thetai3;
theta3(theta3<(-115*pi./180))=(-115*pi./180);
theta3(theta3>(115*pi./180))=(115*pi./180);

%Calcul des coordonnées des centres de chaque axes;

Bx = AB*cos(theta1);
By = OA + AB*sin(theta1);

Cx = Bx + BC*cos(theta2+theta1);
Cy = By + BC*sin(theta2+theta1);
 
Px = Cx + CP*cos(theta3+theta2+theta1);
Py = Cy + CP*sin(theta3+theta2+theta1);

% Affichage de chaque confirguraiton pour chaque points.
for j = 1 : N
    plot([Px],[Py],'r.',[0 0 Bx(j) Cx(j) Px(j)],[0 OA  By(j) Cy(j) Py(j)],'linewidth',2,"Marker","o")
    axis equal;
    xlabel('X','fontsize',10)
    ylabel('Y','fontsize',10,'Rotation',0)
    M(ct) = getframe(gcf);
    ct=ct+1;         
    clc;
end

%Ecriture et lecture de la vidéo;
movie(M)
videofile = VideoWriter('forward_kinematics.avi','Uncompressed Avi');
open(videofile);
writeVideo(videofile,M);
close(videofile)
