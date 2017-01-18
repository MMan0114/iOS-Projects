//
//  ViewController.m
//  Table
//
//  Created by MMan on 9/28/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray *courses;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    courses = [[NSMutableArray alloc] init];
    [courses addObject:@"CIS 101"];
    [courses addObject:@"CIS 102"];
    [courses addObject:@"CIS 103"];
    [courses addObject:@"CIS 104"];
    [courses addObject:@"CIS 105"];
    [courses addObject:@"CIS 106"];
    [courses addObject:@"CIS 107"];
    [courses addObject:@"CIS 108"];
    [courses addObject:@"CIS 109"];
    [courses addObject:@"CIS 110"];
    [courses addObject:@"CIS 111"];
    [courses addObject:@"CIS 112"];
    [courses addObject:@"CIS 113"];
    [courses addObject:@"CIS 114"];
    [courses addObject:@"CIS 115"];
    
    //Set up navigation button
    self.title = @"Edit Cod Classes";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(editTable:)];
    [self.navigationItem setLeftBarButtonItem:addButton];
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --------------
#pragma mark Required UITableViewDataSource Protocols
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // get reusable cell space
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:cellIdentifier];
    }
    NSLog(@"Courses count %i, self.editing is %i", [courses count], self.editing);
    if(indexPath.row == ([courses count]) && self.editing){
        cell.textLabel.text = @"Add class";
        return cell;
    }

    // set display content
    NSString *cellValue = [ courses objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    NSLog(@"tableView:cellForRowAtIndexPath is returing %@", cell.textLabel.text);
    return cell;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.editing){
        return [courses count] +1;
    }
    return [courses count];
}

#pragma mark ---------------
#pragma mark Optional UITableViewDataSource Protocols
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"CIS Classes";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"at COD";
}
#pragma mark --------------
#pragma mark Optional UITableViewData Protocols
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Row number %lu", [indexPath row]);
    if([indexPath row] % 2)
    {
        return 2;
    }
    if ([indexPath row] % 3)
    {
        return 3;
    }
    return 1;
}
- (void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected - %@", [courses objectAtIndex:indexPath.row]);
}
#pragma mark -----------------
#pragma mark Table Editing

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [courses removeObjectAtIndex:indexPath.row];
        [table reloadData];
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert){
        [courses insertObject:@"New COD course" atIndex:[courses count]];
        [table reloadData];
    }
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.editing && indexPath.row == [courses count])
    {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}
-(BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    NSString *cellItem = [courses objectAtIndex:sourceIndexPath.row];
    [courses removeObject:cellItem];
    [courses insertObject:cellItem atIndex:destinationIndexPath.row];
}

#pragma mark ---------------
#pragma mark Action Methods
-(IBAction)editTable:(id)sender{
    if(self.editing)
    {
        [super setEditing:NO animated:NO];
        [table setEditing:NO animated:NO];
        [table reloadData];
        [self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
        [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
    }
    else {
        [super setEditing:YES animated:YES];
        [table setEditing:YES animated:YES];
        [table reloadData];
        [self.navigationItem.leftBarButtonItem setTitle:@"Done"];
        [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];

        
    }
    
    
}

@end
