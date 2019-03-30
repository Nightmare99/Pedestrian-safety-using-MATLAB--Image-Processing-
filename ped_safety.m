%The brake application determining module
syms x y y1 x3 y3;
%First plot: critical distance vs vehicle speed
%Distance in meters, speed in m/s and time in seconds
%Critical distance is the distance at or under which the vehicle must stop at a given speed
%Therefore, critical distance is directly proportional to speed
%Assume a parabola (only positive part) representing the plot
%x=2*(a*y)^0.5 is the parabola
%in this model, we assume that if critical distance is 30m, then the max
%allowed speed is 25 m/s
%Substituting in parabola equation, we get a=9
a=9;
%Creating linespace
x=0:0.01:100;
%Final parabola equation =>
y1=(x.^2)/(4*a);
%The graph is as follows:
figure
plot(x,y1)
xlabel('critical distance')
ylabel('speed')
%Making the graph in terms of x
x1=2*(a*y).^0.5;
%Get speed of vehicle from speedometer. For now, use user input
speed=input('Enter vehicle speed in m/s: ');
crit_dist=subs(x1,speed);

% 16.13%(area of person) for 227cm=2.27m(distance from vehicle), 100% => 0
% distance
%We know that the area of person(percentageWhite) and distance from vehicle are inversely
%proportional, so we assume a linear inverse proportionality
%Equation of line=> y=ax+b
%Calculated constants are: a=-36.9471, b=100
a1=-36.9471;
b=100;
x=0:0.001:2.7;
y=a1*x+b;
figure
plot(x,y)
xlabel('distance')
ylabel('percentage')
%the line equation in terms of y:
x3=(y3-100)/(-36.9471);

%Read an image and convert it to grayscale
A=imread("thermal.jpg");
B=rgb2gray(A);
figure
imshow(B)
%Apply median filter to remove random noise
C=medfilt2(B);
figure
imshow(C)
%Sharpen the blurred image
D=imsharpen(C);
figure
imshow(D)
%Make the grayscale image binary
E=im2bw(D,0.4);
figure
imshow(E)
%Find percentage of black and white in binary
percentageBlack=(1-nnz(E)/numel(E))*100
percentageWhite=100-percentageBlack
dist=subs(x3,percentageWhite);
dist2=double(dist);
if crit_dist>=dist
    fprintf('Brakes applied, critical distance is %f and distance between person and vehicle is %f',crit_dist,dist2);
else
    fprintf('Brakes not applied critical distance is %f and distance between person and vehicle is %f',crit_dist,dist2);
end