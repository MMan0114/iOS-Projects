//
//  ViewController.m
//  animate
//
//  Created by MMan on 10/26/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize slider, imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ballRadius = imageView.frame.size.width/2;
    translation = CGPointMake(0, 0);
    angle = 0;
    //need a starting point to animate the image - could be any legit value
    delta = CGPointMake(4, 4);
    timer = [NSTimer scheduledTimerWithTimeInterval:slider.value
                                             target:self
                                           selector:@selector(onTimer:)
                                           userInfo:nil
                                            repeats:YES];
}

-(void) onTimer:(id)sender {
//    imageView.center = CGPointMake(imageView.center.x + delta.x,
//                                   imageView.center.y + delta.y);
//    if(imageView.center.x > self.view.bounds.size.width - ballRadius ||
//       imageView.center.x < ballRadius){
//        
//        delta.x = -delta.x;
//    }
//    if(imageView.center.y > self.view.bounds.size.height - ballRadius ||
//        imageView.center.y < ballRadius){
//        
//        delta.y = -delta.y;
    
    //set animation parameters
    [UIView beginAnimations:@"myOwn" context:nil];
    [UIView setAnimationDuration:slider.value];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    //imageView.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    imageView.transform = CGAffineTransformMakeRotation(angle);
    
    [UIView commitAnimations];
    
    //setup for next timer call
    //translation.x = translation.x+ delta.x;
    //translation.y = translation.y + delta.y;
    
    angle+= .04;
    //full rotation is 2pi => 2*3.1415926
    
    if(angle > 6.2857){
        angle = 0;
    }
//    if ((imageView.center.x + translation.x > self.view.bounds.size.width - ballRadius) ||
//        (imageView.center.x + translation.x < ballRadius))
//    {
//        delta.x = -delta.x;
//    }
//    if ((imageView.center.y + translation.y > self.view.bounds.size.height - ballRadius))
//    {
//        delta.y = -delta.y;
//    }
    imageView.center = CGPointMake(imageView.center.x + delta.x, imageView.center.y + delta.y);
    if(imageView.center.x > self.view.bounds.size.width - ballRadius ||
       imageView.center.x < ballRadius){
        delta.x = -delta.x;
    }
    if(imageView.center.y > self.view.bounds.size.height - ballRadius || imageView.center.y < ballRadius){
        delta.y = -delta.y;
    }
    
}

-(IBAction)sliderMoved:(id)sender{
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:slider.value target:self
                                           selector:@selector(onTimer:)
                                           userInfo:nil
                                            repeats:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
