//
//  ViewController.h
//  Converter
//
//  Created by MMan on 9/14/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>
{
    IBOutlet UIPickerView *picker;
    IBOutlet UITextField *field1;
    IBOutlet UITextField *field2;
}
@property (nonatomic, retain) UIPickerView *picker;


@end

