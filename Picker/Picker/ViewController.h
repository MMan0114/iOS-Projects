//
//  ViewController.h
//  Picker
//
//  Created by MMan on 9/14/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>{
    IBOutlet UIPickerView *picker;
    IBOutlet UITextField *textField1;
    IBOutlet UITextField *textField2;
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;

}
@property (nonatomic, retain) UIPickerView *picker;
@property (nonatomic, retain) UITextField *textField1;
@property (nonatomic, retain) UITextField *textField2;
@property (nonatomic, retain) UILabel *label1;
@property (nonatomic, retain) UILabel *label2;


-(IBAction)convert:(id)sender;

@end

