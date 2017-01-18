//
//  ViewController.m
//  gesture
//
//  Created by MMan on 10/26/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageView;

CGFloat lastScaleFactor = 1;
NSArray *images;
int imageIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //recognize tap
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
//    tapGesture.numberOfTapsRequired = 2;
//    [imageView addGestureRecognizer:tapGesture];
    
    //add a pinch Gesture
    UIPinchGestureRecognizer *pinchGesture  = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [imageView addGestureRecognizer:pinchGesture];
    
    //swipe gesture
    images = [[NSArray alloc] initWithObjects:@"imageOne.jpg", @"imageTwo.jpg", @"imageThree.gif" @"imageFour.jpg", @"imageFive.jpg", nil];
    //right swipe which is default
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    [imageView addGestureRecognizer:swipeGesture];
    
    //now add left swipe
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [imageView addGestureRecognizer:leftSwipeGesture];
}

-(IBAction)handleSwipeGesture:(UISwipeGestureRecognizer *)sender{
    
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) sender direction];
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"Swipe Direction Left");
            imageIndex--;
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"Swipe Direction Right");
            imageIndex++;
        default:
            break;
    }
    imageIndex = (imageIndex <0) ? ([images count] - 1):imageIndex % [images count];
    
    imageView.image = [UIImage imageNamed:[images objectAtIndex:imageIndex]];
}

-(IBAction)handlePinchGesture:(UIPinchGestureRecognizer *)sender{
    CGFloat factor = [(UIPinchGestureRecognizer *) sender scale];
    NSLog(@"Pinched factor %f", factor);
    if (factor > 1){
        //zoom in
        sender.view.transform = CGAffineTransformMakeScale(lastScaleFactor + (factor -1),
                                                           lastScaleFactor + (factor-1));
    }else{
        //zoom out
        sender.view.transform = CGAffineTransformMakeScale(lastScaleFactor*factor, factor);
    }
    if(sender.state == UIGestureRecognizerStateEnded){
        if(factor > 1){
            lastScaleFactor += (factor -1);
        }else{
            lastScaleFactor *= factor;
        }
    }
}

-(IBAction)handleTapGesture:(UITapGestureRecognizer *)sender{
    
    NSLog(@"Tap Tap");
    if(sender.view.contentMode == UIViewContentModeScaleAspectFill){
        sender.view.contentMode = UIViewContentModeCenter;
    } else{
        sender.view.contentMode = UIViewContentModeScaleAspectFill;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
