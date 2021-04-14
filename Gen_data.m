
close all
clear all
load('Experiment0.mat')
pca_empty= (abs(Empty_CSI_timeseries_trial_5_Rx1_Tx1))
pca_walk = (abs(Walk_CSI_timeseries_trial_5_Rx1_Tx1))
pca_squat = (abs(Squat_CSI_timeseries_trial_3_Rx1_Tx1))

order = 5;
[b, a] = butter(order, 50/(750/2));

flt_empty = filter(b,a,pca_empty);
flt_walk = filter(b,a,pca_walk);
flt_squat = filter(b,a,pca_squat);

%%once filtering is done, we now calculate features

features_empty = zeros(length(flt_empty),39);
for i = 1:length(flt_empty)
    features_empty(i,1:30) = flt_empty(i,:);
    features_empty(i,31) = mean(flt_empty(i,:));
    features_empty(i,32) = std(flt_empty(i,:));
    features_empty(i,33) = mad(flt_empty(i,:));
    features_empty(i,34) = mad(flt_empty(i,:),1);
    features_empty(i,35) = max(flt_empty(i,:));
    features_empty(i,36) = min(flt_empty(i,:));
    features_empty(i,37) = skewness(flt_empty(i,:));
    features_empty(i,38) = kurtosis(flt_empty(i,:));
    features_empty(i,39) = 0;
end
%%
features_walk = zeros(length(flt_walk),39);
for i = 1:length(flt_walk)
    features_walk(i,1:30) = flt_walk(i,:);
    features_walk(i,31) = mean(flt_walk(i,:));
    features_walk(i,32) = std(flt_walk(i,:));
    features_walk(i,33) = mad(flt_walk(i,:));
    features_walk(i,34) = mad(flt_walk(i,:),1);
    features_walk(i,35) = max(flt_walk(i,:));
    features_walk(i,36) = min(flt_walk(i,:));
    features_walk(i,37) = skewness(flt_walk(i,:));
    features_walk(i,38) = kurtosis(flt_walk(i,:));
    features_walk(i,39) = 1;
end


features_squat = zeros(length(flt_squat),39);
for i = 1:length(flt_squat)
    features_squat(i,1:30) = flt_squat(i,:);
    features_squat(i,31) = mean(flt_squat(i,:));
    features_squat(i,32) = std(flt_squat(i,:));
    features_squat(i,33) = mad(flt_squat(i,:));
    features_squat(i,34) = mad(flt_squat(i,:),1);
    features_squat(i,35) = max(flt_squat(i,:));
    features_squat(i,36) = min(flt_squat(i,:));
    features_squat(i,37) = skewness(flt_squat(i,:));
    features_squat(i,38) = kurtosis(flt_squat(i,:));
    features_squat(i,39) = 2;
end

total_features = [features_empty;features_walk;features_squat];