//
//  ViewController.m
//  Converter
//
//  Created by MMan on 9/14/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize picker;

static NSString *pd[7] = {@"kg to mi", @"mi to kg", @"in to cm", @"cm to in", @"lit to gal", @"gal to lit"};
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UIPickerViewDelegate & UIPickerViewDataSource methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 7;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pd[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"didSelectRow: %li, inComponent: %li", (long)row, (long)component);
}
#pragma mark Rotation
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    NSLog(@"Current row select value %li", (long)[picker selectedRowInComponent:0]);
    
    //Return yes for supported orientations
    return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
