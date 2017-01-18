//
//  rssTableViewController.h
//  rssViewer
//
//  Created by MMan on 11/16/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "webViewController.h"

@interface rssTableViewController : UITableViewController <NSXMLParserDelegate>{
    NSMutableArray *feedList;
    NSMutableDictionary *currentItem;
    NSMutableString *currentContents;
    NSString *url;
    
}
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSMutableArray *feedList;

@end
