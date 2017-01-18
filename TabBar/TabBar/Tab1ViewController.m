//
//  ViewController.m
//  TabBar
//
//  Created by MMan on 9/21/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "Tab1ViewController.h"

@interface Tab1ViewController ()

@end

@implementation Tab1ViewController
@synthesize textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [[NSBundle mainBundle]
                          pathForResource:@"albums" ofType:@"txt"];
    textView.text = [NSString stringWithContentsOfFile:filePath
                                              encoding:NSUTF8StringEncoding error:nil];
    
    [textView setFont:[UIFont systemFontOfSize:22]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
