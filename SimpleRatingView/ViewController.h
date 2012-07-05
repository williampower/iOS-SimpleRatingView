//
//  ViewController.h
//  SimpleRatingView
//
//  Created by William Power on 7/3/12.
//  Copyright (c) 2012 Rogue Power, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleRatingView.h"
@interface ViewController : UIViewController

@property (nonatomic,retain) IBOutlet SimpleRatingView *maskedTextView;

@property (retain, nonatomic) IBOutlet UILabel *ratingLabel;
- (IBAction)reduceByTenPercent:(id)sender;
- (IBAction)increaseByTenPercent:(id)sender;

@end
