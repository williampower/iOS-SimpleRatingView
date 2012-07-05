iOS-SimpleRatingView
====================

Quick-and-dirty UIView subclass for displaying a rating, such as "4.2 stars out of 5"


Intended use: 
1. Incorporate the SimpleRatingView class into your project.
2. Incorporate your background and foreground graphics (two samples are provided)
3. Change the two "#define" image names in SimpleRatingView
4. In your NIB/XIB, add a UIView that's big enough to hold the number of graphics you want for your rating (example description below)

Example of layout consideration: 
The star graphic is 30px wide. If I want 5 stars displayed, the SimpleRatingView in my nib needs to be 5 * 30 wide (left aligned, not set to scale).


