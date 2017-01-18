//
//  ViewController.h
//  animate
//
//  Created by MMan on 10/26/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIImageView *imageView;
    IBOutlet UISlider *slider;
    
    CGPoint delta;
    NSTimer *timer;
    float ballRadius;
    CGPoint translation;
    float angle;
}

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UISlider *slider;

-(IBAction)sliderMoved:(id)sender;

@end

