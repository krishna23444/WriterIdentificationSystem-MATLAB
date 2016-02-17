%Let's make some fake data with two groups
n=75; %sample size
x=[randn(n,1)+2;randn(n,1)+4.75];
y=[randn(n,1)+2;randn(n,1)+4.75];


%the true group identity
groups=[ones(n,1);ones(n,1)+1];

%plot the data
scatter(x,y,50,groups,'filled')
data=[x,y];
IDX=kmeans(data,2); %Run k-means, asking for two groups
%{
%Let's make some fake data with two groups
n=150; %sample size
x=[randn(n,1)+3;randn(n,1)+3];
y=[randn(n,1)+3;randn(n,1)+3];

%plot the data
subplot(1,2,1)
plot(x,y,'ok','MarkerFaceColor','k')

%now divide into two using k-means and plot the results
data2=[x,y];
IDX=kmeans(data2,2);

%plot the k-means results
subplot(1,2,2)
scatter(x,y,50,IDX,'filled')
%Run k-means for a range of k
for k=2:6
    IDX=kmeans(data,k);  %The data with two groups
    [S,H] = silhouette(data, IDX);
    silA(k)=mean(S); %The mean silhoette value for two groups

    IDX=kmeans(data2,k); %The data with one group
    [S,H] = silhouette(data2, IDX);
    silB(k)=mean(S); %The mean silhoette value for one group
end

%Plot the results
clf %clear the figure window
hold on
plot(1:6, silA,'ok-','MarkerFaceColor','k') %2 groups
plot(1:6, silB,'or-','MarkerFaceColor','r') %1 group
set(gca,'XTick',1:6)
xlabel('k')
ylabel('mean silhouette value')
hold off
%}