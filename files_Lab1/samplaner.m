function ut=samplaner(in)
%% LAB1, TASK3
%% Samplar ner en bild till halva storleken i varje led
%
% Sampla ner originalbilden, in, till halva storleken i varje led genom att
% ta medelvärdet av varje 2x2 område i inbilden (in) och sparar värdet som ett pixelvärd
% i den nedsamplade bilden (ut).
% Observera att inbilden (in) är tänkt att vara normaliserad mellan 0 coh
% 1.
%% Who has done it:
%
% Author: Same LiU-ID and name as in the Lisam submission
% Co-author: You can work in groups of max 2, this is the LiU-ID/name of
% the other member of the group
% Isak Greatrex (isagr142) & Pedram Abbasnejad (pedab341)
%% Syntax of the function
%      Input arguments:
%           in: the original input grayscale image of type double scaled
%               between 0 and 1
%      Output arguments:
%            ut: The down-sampled image
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: today
%
% Gives a history of your submission to Lisam.
% Version and date for this function have to be updated before each
% submission to Lisam (in case you need more than one attempt)
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) your code should work for any given input arguments, if they are
%    fulfilling the conditions specified in the syntax of the function
%
% 5) Often you must do something else between the given commands in the
%       template
%
%% Here starts your code.
% Write the appropriate MATLAB commands right after each comment below.
%
%% Figuring out the number of rows and columns of the input image
%
% Since your code is supposed to an image of any size, you are suppsed
% to find the size of the image. Use the function size in MATLAB.
%
[rad, kolumn] = size(in); % rad and kolumn are supposed to be the number of rows
% and columns in the original image.
%
%
%% Create counters
% Probably you might need to create two counters, if you are going to use
% two nested for loops. The counters are incremented inside the loops.
%
rad_counter = 1; % Row counter

kolumn_counter =1; % Column counter
%
%% Two nested for-loops

if(mod(rad,2)~= 0)
    %in = in(1:end - 1, :);
    rad = rad - 1;
end
if(mod(kolumn,2)~= 0)
    %in = in(:, 1:end - 1);
    kolumn = kolumn - 1;
end

ut = zeros(rad/2, kolumn/2);

for i= 1:2:rad
    
    for j= 1:2:kolumn
        ut(rad_counter, kolumn_counter) = mean2(in(i:i+1, j:j+1));
        kolumn_counter = kolumn_counter + 1;
    end
    kolumn_counter = 1;
    rad_counter = rad_counter + 1;
end

%% Test your code
% Notice that your code has to work for a gray scale image of any size.
% For example the image mygray (from assigment 5.1 in part 2) is 280x420 pixels. Your
% result after running this code should be a down-sampled version of this
% image, that is it should look like mygray but be of size 140x210.
% Notice that your input image (in) is supposed to be normalized between 0 and
% 1, so don't forget to do that before you call this function.
% Test your code on at least on pne image, where either the row number or
% the column number is an odd integer (for example kvarn_udda.tif). Explain how your code handle
% images whos number of rows/columns are odd: (answer here as a comment).
% We added an if-statement before of the for loops where we use modulus to check if
% the rad or kolumn of the matrix is odd. If it is we remove the last rad
% or kolumn of the matrix.
%