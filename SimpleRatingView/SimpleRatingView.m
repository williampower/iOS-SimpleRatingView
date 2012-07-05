//
//  MaskedTextView.m
//  SimpleRatingView
//
//  Created by William Power on 7/3/12.
//  Copyright (c) 2012 Rogue Power, LLC. All rights reserved.
//

#import "SimpleRatingView.h"

#define LOW_CLAMP 0.01f
#define HIGH_CLAMP 1.0f


@interface SimpleRatingView ()
-(UIImage*)imageByCropping:(UIImage*)imageToCrop toRect:(CGRect)rect;
@property (nonatomic,assign) float currRating;
@property (nonatomic,assign) int currPossible;
@end

@implementation SimpleRatingView

@synthesize currRating=_currRating;
@synthesize currPossible=_currPossible;
@synthesize bgImgName=_bgImgName;
@synthesize fgImageName=_fgImageName;

#pragma mark - lifecycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //set the color that 'clear' goes to in 'drawRect'
        [self setBackgroundColor:[UIColor clearColor]];
        self.bgImgName = @"star_bkgnd.png";
        self.fgImageName = @"star_highlighted.png";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //set the color that 'clear' goes to in 'drawRect'
        [self setBackgroundColor:[UIColor clearColor]];
        self.bgImgName = @"star_bkgnd.png";
        self.fgImageName = @"star_highlighted.png";
    }
    return self;
}
-(void)dealloc{
    [super dealloc];
    [_bgImgName release];
    [_fgImageName release];
}
-(void)setBgImgName:(NSString *)bgImgName{
    if (bgImgName != _bgImgName) {
        [_bgImgName release];
        _bgImgName = bgImgName;
        [_bgImgName retain];
        [self setNeedsDisplay];
    }
}
-(void)setFgImageName:(NSString *)fgImageName{
    if (fgImageName != _fgImageName) {
        [_fgImageName release];
        _fgImageName = fgImageName;
        [_fgImageName retain];
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    [[UIColor clearColor] setFill];
    CGContextFillRect(context, rect);
    
    UIImage *bkgnd = [UIImage imageNamed:_bgImgName];
    UIImage *foreground = [UIImage imageNamed:_fgImageName];
    
    for (int i=0; i<_currPossible; i++) {
        //always draw the background, offset by width of image
        CGRect bgRect = CGRectMake(bkgnd.size.width*i, 0, bkgnd.size.width, bkgnd.size.height);
        [bkgnd drawInRect:bgRect];
        
        //get the percent fill to be drawn
        CGFloat percentage = _currRating - i;
        if (percentage < LOW_CLAMP) {
            //don't draw internal star
            continue;
        }
        if (HIGH_CLAMP < percentage) {
            percentage = 1.0f;
        }
        //the flooring is necessary to avoid image skewing
        CGRect croppedRect = CGRectMake(0, 0, floorf(bkgnd.size.width * percentage), bkgnd.size.height);
        foreground = [self imageByCropping:foreground toRect:croppedRect];
        //draw at bg's origin, but with proper size
        CGRect drawingRect = CGRectMake(bgRect.origin.x, bgRect.origin.y, croppedRect.size.width, croppedRect.size.height);
        [foreground drawInRect:drawingRect];
    }
    CGContextRestoreGState(context);
}

#pragma mark - interface
-(void)setRatingOf:(float)rating outOfPossible:(int)possible{
    _currRating = rating;
    _currPossible = possible;
    [self setNeedsDisplay];
}

#pragma mark - private
-(UIImage*)imageByCropping:(UIImage*)imageToCrop toRect:(CGRect)rect{
    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], rect);
    UIImage *ret = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return ret;    
}


@end
