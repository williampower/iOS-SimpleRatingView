//
//  MaskedTextView.h
//  SimpleRatingView
//
//  Created by William Power on 7/3/12.
//  Copyright (c) 2012 Rogue Power, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SimpleRatingView : UIView 

-(void)setRatingOf:(float)rating outOfPossible:(int)possible;

@property (nonatomic,retain) NSString *bgImgName;
@property (nonatomic,retain) NSString *fgImageName;

@end
