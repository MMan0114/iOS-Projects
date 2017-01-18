//
//  ViewController.h
//  deviceCapabilities
//
//  Created by MMan on 11/30/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UITextView *text;
    UIDevice *myDevice;
}
@property (nonatomic, retain) IBOutlet UITextView *text;
@property (nonatomic, retain) UIDevice *myDevice;

-(IBAction)getDeviceInfo:(id)sender;

@end

