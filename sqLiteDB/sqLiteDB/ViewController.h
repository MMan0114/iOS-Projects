//
//  ViewController.h
//  sqLiteDB
//
//  Created by MMan on 10/19/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController{
    sqlite3 *db;
    
}
-(NSString *)filePath;



@end

