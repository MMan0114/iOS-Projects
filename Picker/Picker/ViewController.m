//
//  ViewController.m
//  Picker
//
//  Created by MMan on 9/14/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize picker;
@synthesize textField1, textField2, label1, label2;

static NSString *pd[4] = {@"km to mi", @"mi to km", @"ft to m", @"m to ft"};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    label1.text = @"Kilometers";
    label2.text = @"Miles";
  
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
    return 4;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pd[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"didSelectRow: %li, inComponent: %li", (long)row, (long)component);
    
    NSInteger abc = [picker selectedRowInComponent:0];
    switch (abc) {
        case 0:
            label1.text = @"Kilometers";
            label2.text = @"Miles";
            break;
        case 1:
            label1.text = @"Miles";
            label2.text = @"Kilometers";
            break;
        case 2:
            label1.text = @"Feet";
            label2.text = @"Meters";
            break;
        case 3:
            label1.text = @"Meters";
            label2.text = @"Feet";
        default:
            break;
    }
}
#pragma mark Rotation
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    NSLog(@"Current row select value %li", (long)[picker selectedRowInComponent:0]);
    
    //Return yes for supported orientations
    return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)convert:(id)sender{
    NSInteger abc = [picker selectedRowInComponent:0];
    switch(abc) {
        case 0:
            NSLog(@"textField1 value %@", [textField1 text]);
            float invalue = [[textField1 text] floatValue];
            float outvalue = (invalue*.62f);
            [textField2 setText:[NSString stringWithFormat:@"%3.2f", outvalue]];
            [textField1 resignFirstResponder];
            break;
        case 1:
            NSLog(@"textField1 value %@", [textField1 text]);
            float invalue1 = [[textField1 text] floatValue];
            float outvalue1 = (invalue1 * 1.6f);
            [textField2 setText:[NSString stringWithFormat:@"%3.2f", outvalue1]];
            [textField1 resignFirstResponder];
            break;
        case 2:
            NSLog(@"textField1 value %@", [textField1 text]);
            float invalue2 = [[textField1 text] floatValue];
            float outvalue2 = (invalue2*.3f);
            [textField2 setText:[NSString stringWithFormat:@"%3.2f", outvalue2]];
            [textField1 resignFirstResponder];
            break;
        case 3:
            NSLog(@"textField1 value %@", [textField1 text]);
            float invalue3= [[textField1 text] floatValue];
            float outvalue3 = (invalue3*3.28f);
            [textField2 setText:[NSString stringWithFormat:@"%3.2f", outvalue3]];
            [textField1 resignFirstResponder];
            break;
        default:
            break;
        
    }
}
@end
