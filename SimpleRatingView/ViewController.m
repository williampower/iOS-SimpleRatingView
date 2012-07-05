//
//  ViewController.m
//  SimpleRatingView
//
//  Created by William Power on 7/3/12.
//  Copyright (c) 2012 Rogue Power, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int totalPossible;
@property float rating;
@end

@implementation ViewController

@synthesize maskedTextView;
@synthesize ratingLabel = _ratingLabel;
@synthesize totalPossible=_totalPossible;
@synthesize rating=_rating;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _totalPossible = 5;
    _rating = 3.2;
    [_ratingLabel setText:[NSString stringWithFormat:@"%.1f",_rating]];
    
    /*
     The default images used by the class is @"star_bkgnd.png" and
     "star_highlighted.png". You can override those using the file name
     for your custom images. 
     */
    [maskedTextView setBgImgName:[NSString stringWithString:@"circle_bkgnd.png"]];
    [maskedTextView setFgImageName:[NSString stringWithString:@"circle_highlighted.png"]];
    [maskedTextView setRatingOf:_rating outOfPossible:_totalPossible];
}

- (void)viewDidUnload
{
    [self setRatingLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)reduceByTenPercent:(id)sender {
    _rating -= 0.1f;
    [_ratingLabel setText:[NSString stringWithFormat:@"%.1f",_rating]];
    [maskedTextView setRatingOf:_rating outOfPossible:_totalPossible];
}

- (IBAction)increaseByTenPercent:(id)sender {
    _rating += 0.1f;
    [_ratingLabel setText:[NSString stringWithFormat:@"%.1f",_rating]];
    [maskedTextView setRatingOf:_rating outOfPossible:_totalPossible];
}
- (void)dealloc {
    [_ratingLabel release];
    [super dealloc];
}
@end
