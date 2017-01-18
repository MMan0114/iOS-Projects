//
//  webViewController.h
//  rssViewer
//
//  Created by MMan on 11/16/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController {
    IBOutlet UIWebView *webView;
}
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) NSString *url;

@end
