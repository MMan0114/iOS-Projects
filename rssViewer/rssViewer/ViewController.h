//
//  ViewController.h
//  rssViewer
//
//  Created by MMan on 11/16/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rssTableViewController.h"

@interface ViewController : UITableViewController <NSXMLParserDelegate>
{
    NSMutableArray *rssList;
}


@end

