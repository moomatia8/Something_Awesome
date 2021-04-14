load('Experiment0.mat')
close all
plot(abs(Walk_CSI_timeseries_trial_5_Rx1_Tx1));
title('CSI');
xlabel('Samples');
ylabel('Raw CSI');
figure;

%plot(abs(Walk_CSI_Principle_Components_trial_5_Rx1_Tx1))

%we take the absolute value to remove phase (it's an imaginary value)
pca_walk = (abs(Walk_CSI_timeseries_trial_5_Rx1_Tx1))
[coeff, score] = pca(pca_walk);
figure;
plot(score(:,1))
title('PCA coeff 1');
xlabel('Samples');
ylabel('Raw CSI');
fs = 750;
fpass = 50;
y = lowpass(score(:,1),fpass,fs);
figure;
plot(y)
title('PCA coeff 1 Low pass filtered');
xlabel('Samples');
ylabel('Raw CSI');
walk_mean = mean(y)
walk_std = std(y)
walk_var = var(y)

