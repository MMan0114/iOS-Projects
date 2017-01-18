//
//  ViewController.m
//  sliderAction
//
//  Created by MMan on 9/14/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sliderA, sliderB;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)sliderAMoved:(id)sender{
    NSLog(@"slider A.value is %f", sliderA.value);
    NSLog(@"slider B.value is %f", sliderB.value);
    sliderB.value = 100 - sliderA.value;
}

-(IBAction)sliderBMoved:(id)sender{
    NSLog(@"slider A.value is %f", sliderA.value);
    NSLog(@"slider B.value is %f", sliderB.value);
    sliderA.value = 100 - sliderB.value;
}

@end
