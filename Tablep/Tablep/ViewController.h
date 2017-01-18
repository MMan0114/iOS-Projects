//
//  ViewController.h
//  Tablep
//
//  Created by MMan on 9/28/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,
    UITableViewDataSource>
{
    NSDictionary *cod;
    NSArray *faculty;
    IBOutlet UITableView *myTableView;
}
@property (nonatomic, retain) NSDictionary *cod;
@property (nonatomic, retain) NSArray *faculty;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;


@end

