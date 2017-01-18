//
//  ViewController.m
//  Tablep
//
//  Created by MMan on 9/28/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"
#import "TableDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize cod, faculty, myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Courses" ofType:@"plist"];
    NSDictionary *dataDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.cod = dataDict;
    
    NSArray *array = [[self.cod allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.faculty = array;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---------------
#pragma mark UITableViewDelegate protocols
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.faculty count];
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *myFaculty = [self.faculty objectAtIndex:section];
    NSArray *facultyCourses = [self.cod objectForKey:myFaculty];
    
    return [facultyCourses count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    // be sure that sell identifier in SB is set same
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    // Configure the cell.
    // Get faculty in section
    NSString *myFaculty = [self.faculty objectAtIndex:[indexPath section]];
    // courses within faculty
    NSArray *facultyCourses = [self.cod objectForKey:myFaculty];
    cell.textLabel.text = [facultyCourses objectAtIndex:[indexPath row]];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection: (NSInteger)section
{
    return [faculty objectAtIndex:section];
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection: (NSInteger)section
{
    NSString *myFaculty = [faculty objectAtIndex:section]; NSArray *facultyCourses = [cod objectForKey:myFaculty];
    NSString *myFooterText = [NSString stringWithFormat:@"%lu Courses", (unsigned long)[facultyCourses count]];
    return myFooterText; }

#pragma mark Segues
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"tableDetail" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"tableDetail"]) {
        TableDetailViewController *detailVC = [segue destinationViewController];
    
        NSIndexPath *myIndexPath = [self.myTableView
                                    indexPathForSelectedRow];
        NSString *myFaculty = [self.faculty objectAtIndex:[myIndexPath
                                                           section]];
        NSArray *facultyCourses = [self.cod objectForKey:myFaculty];
        NSInteger row = [myIndexPath row];
        NSInteger section = [myIndexPath section];

        detailVC.inLabelText = [facultyCourses objectAtIndex:
                                [myIndexPath row]];
        detailVC.inRow = row;
        detailVC.inSection = section;
    }
}

@end
