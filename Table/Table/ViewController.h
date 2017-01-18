//
//  ViewController.h
//  Table
//
//  Created by MMan on 9/28/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,
UITableViewDelegate>{
    IBOutlet UITableView *table;
}
-(IBAction)editTable:(id)sender;

@end

