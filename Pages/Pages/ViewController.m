//
//  ViewController.m
//  Pages
//
//  Created by MMan on 9/21/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView1, imageView2, pageControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [imageView1 setImage:[UIImage imageNamed:@"imageOne.jpg"]];
    tempImageView = imageView2;
    // make first image visible and hide the second
    [imageView1 setHidden:NO];
    [imageView2 setHidden:YES];
    
    //Add event handler for the page control
    //[pageControl addTarget:self action:@selector(pageTurning:)forControlEvents:UIControlEventValueChanged];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) pageTurning:(UIPageControl *)pageController {
    //get the page number you are turning to
    NSInteger nextPage = [pageController currentPage];
    switch (nextPage) {
        case 0:
            [tempImageView setImage:[UIImage imageNamed:@"imageOne.jpg"]];
            break;
        case 1:
            [tempImageView setImage:[UIImage imageNamed:@"imageTwo.jpg"]];
            break;
        case 2:
            [tempImageView setImage:[UIImage imageNamed:@"imageThree.jpg"]];
            break;
        case 3:
            [tempImageView setImage:[UIImage imageNamed:@"imageFour.jpg"]];
            break;
        case 4:
            [tempImageView setImage:[UIImage imageNamed:@"imageFive.jpg"]];
            break;
        default:
            break;
    }
    
    //switch the two imageView views
    if(tempImageView.tag == 0){
        //Imageview 1
        tempImageView = imageView2;
        bgImageView = imageView1;
    }
    else{
        tempImageView = imageView1;
        bgImageView = imageView2;
    }
    
    //Animate the two views
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:tempImageView cache:YES];
    [tempImageView setHidden:YES];
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:bgImageView cache:YES];
    [bgImageView setHidden:YES];
    
    [UIView commitAnimations];
    
}


@end
