//
//  Tab2ViewController.m
//  TabBar
//
//  Created by MMan on 9/21/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "Tab2ViewController.h"

@interface Tab2ViewController ()

@end

@implementation Tab2ViewController
@synthesize imageView2;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Initalize Image to Display
    [imageView2 setImage:[UIImage imageNamed:(@"music_Oddisee.jpg")]];
    
    [imageView2 setHidden:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
