# Script to plot cross-section bathymetric profile (here: profile #1, Kuril-Kamchatka Trench)
# cd /Users/pauline/Documents/Octave
# reshaped initial table by AWK: select two necessary columns; field separator as space.
awk 'BEGIN{FS=" "; OFS=" "} {print $3, $5}' profile1.txt > profile1s.txt
# load table into Octave
load profile1s.txt
# look up the table
profile1s
# assign variables
P = profile1s; % assign table to P
K = P(:,1); % assign 400-kilometer cross-section line (km) to x axis
D = P(:,2); % assign depths to y axis
# prepare plot
figure;
clf;
hold on;
plot(K, D, "ro", "markersize", 5); % plot x against y
    grid on;
    axis tight;
    set(gca,'xlim',[-200 200])
    title({'Octave plot: cross-section profile 1'},
          'FontSize', 12, 'Color', 'black', 'FontWeight', 'normal', 'FontName', 'Monaco');
    xlabel('Observations along 400-km cross-section');
    ylabel('Depths, m');
    ylim ([-9000 200]);
    xlim ([-200 200]);
    axis([-200 200 -9000 200])
print('plot_KKTprofile1.jpg','-djpg','-r300');
#close all % Close all open figure windows
#clc Clear command window (shell)
