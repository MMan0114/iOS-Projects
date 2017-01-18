//
//  Tab3ViewController.m
//  TabBar
//
//  Created by MMan on 10/18/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "Tab3ViewController.h"

@interface Tab3ViewController ()

@end

@implementation Tab3ViewController
@synthesize textView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *filePath = [[NSBundle mainBundle]
                          pathForResource:@"description" ofType:@"txt"];
    textView.text = [NSString stringWithContentsOfFile:filePath
                                              encoding:NSUTF8StringEncoding error:nil];
    
    [textView setFont:[UIFont systemFontOfSize:22]];
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
