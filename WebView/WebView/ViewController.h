//
//  ViewController.h
//  WebView
//
//  Created by MMan on 9/21/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIWebView *webView;
    IBOutlet UITextField *textField;
}
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UITextField *textField;

-(IBAction)loadPage:(id)sender;

@end

