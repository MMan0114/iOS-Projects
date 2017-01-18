//
//  ViewController.m
//  sqLiteDB
//
//  Created by MMan on 10/19/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self openDB];
    [self createTableNamed:@"Faculty" withField1:@"Course" withField2:@"Name"];
    [self insertRecordIntoTableNamed:@"Faculty" field1:@"Course" field1value:@"CIS2840-003" field2:@"Name" field2Value:@"iPhone App Development"];
    [self insertRecordIntoTableNamed:@"Faculty" field1:@"Course" field1value:@"CIS2841-003" field2:@"Name" field2Value:@"Android App Development"];
    [self getAllRowsFromTableNamed:@"Faculty"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDir = [paths objectAtIndex:0];
    
    return [documentDir stringByAppendingPathComponent:@"myDB.sql"];
    
}

-(void)openDB {
    if(sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSLog(@"myDB.sql failed to open");
    }
    else{
        NSLog(@"myDB.sql successfully opened");
        
    }
}

-(void)createTableNamed:(NSString *)tableName
             withField1:(NSString *)field1
             withField2:(NSString *)field2
{
    char *err;
    NSString *sqlStmt = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' Text PRIMARY KEY, '%@' TEXT);",tableName, field1, field2];
    if(sqlite3_exec(db, [sqlStmt UTF8String], NULL, NULL, &err) != SQLITE_OK){
        sqlite3_close(db);
        NSLog(@"Failed to exectue table create");
    }
}

-(void)insertRecordIntoTableNamed:(NSString *)tableName
                           field1:(NSString *)field1
                           field1value:(NSString *)field1Value
                           field2:(NSString *)field2
                           field2Value:(NSString *)field2Value
{
    NSString *sqlStmt =[NSString stringWithFormat:@"INSERT OR REPLACE INTO '%@' ('%@', '%@') VALUES ('%@', '%@');", tableName, field1, field2, field1Value, field2Value];
    char *err;
    if(sqlite3_exec(db, [sqlStmt UTF8String], NULL, NULL, &err) != SQLITE_OK){
        sqlite3_close(db);
        NSLog(@"Error Updating Table");
    }
               
                        
}

-(void)getAllRowsFromTableNamed:(NSString *)tableName{
    NSString *qryStmt = [NSString stringWithFormat:@"SELECT * FROM %@", tableName];
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2(db, [qryStmt UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while(sqlite3_step(stmt) == SQLITE_ROW){
            char* field1 = (char *) sqlite3_column_text(stmt, 0);
            char* field2 = (char *) sqlite3_column_text(stmt, 1);
            
            NSString *field1Value = [[NSString alloc] initWithUTF8String:field1];
            NSString *field2Value = [[NSString alloc] initWithUTF8String:field2];
            
            NSLog(@"%@---%@", field1Value, field2Value);

        }
        //close this will delete stmt from memory
        sqlite3_finalize(stmt);
    }
    
}

@end
