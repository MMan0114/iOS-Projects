//
//  ViewController.h
//  Pages
//
//  Created by MMan on 9/21/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIPageControl *pageControl;
    IBOutlet UIImageView *imageView1;
    IBOutlet UIImageView *imageView2;
    UIImageView *tempImageView, *bgImageView;
    
}
-(IBAction)pageTurning :(UIPageControl *)pageControl;
@property(nonatomic,retain) UIPageControl *pageControl;
@property(nonatomic, retain) UIImageView *imageView1, *imageView2;




@end

