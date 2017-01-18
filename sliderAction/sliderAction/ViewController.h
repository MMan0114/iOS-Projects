//
//  ViewController.h
//  sliderAction
//
//  Created by MMan on 9/14/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
IBOutlet UISlider *sliderA;
IBOutlet UISlider *sliderB;
}
@property (nonatomic, retain) UISlider *sliderA;
@property (nonatomic, retain) UISlider *sliderB;

- (IBAction)sliderAMoved:(id)sender;
- (IBAction)sliderBMoved:(id)sender;

@end

