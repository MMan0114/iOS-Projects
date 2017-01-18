//
//  rssTableViewController.m
//  rssViewer
//
//  Created by MMan on 11/16/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "rssTableViewController.h"

@interface rssTableViewController ()

@end

@implementation rssTableViewController
@synthesize url, feedList;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"rssTableVC:url - %@", url);
    feedList = [[NSMutableArray alloc] initWithCapacity:0];
    NSXMLParser *nextParser = [[NSXMLParser alloc]
                               initWithContentsOfURL:[NSURL URLWithString:url]];
    [nextParser setDelegate:self];
    [nextParser parse];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [feedList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if([[feedList objectAtIndex:indexPath.row] objectForKey:@"title"])
    {
        cell.textLabel.text = [[feedList objectAtIndex:indexPath.row]
                               objectForKey:@"title"];
    }
    if([[feedList objectAtIndex:indexPath.row] objectForKey:@"link"]){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    webViewController *webVC = [segue destinationViewController];
    webVC.url = [[feedList objectAtIndex:myIndexPath.row] objectForKey:@"link"];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark --- NSXMLParserDelegate
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    if([elementName compare:@"item"] == NSOrderedSame){
        currentItem = [[NSMutableDictionary alloc] initWithCapacity:0];
    }
    else if(currentItem != NULL){
        currentContents = [[NSMutableString alloc]initWithCapacity:0];
    }
    NSLog(@"rssTableVC:didStartElement:elementName = %@", elementName);
    NSLog(@"rssTableVC:didStartElement:nameSpaceURI = %@", namespaceURI);
    NSLog(@"rssTableVC:didStartElement:qualifiedName = %@", qName);
    NSLog(@"rssTableVC:didStartElement:attributes = %@", attributeDict);
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(currentContents && string){
        [currentContents appendString:string];
    }
    NSLog(@"rssTableVC:foundCharacters - currentContents = %@", currentContents);
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName compare:@"item"] == NSOrderedSame){
        [feedList addObject:currentItem];
        NSLog(@"rssTableVC:didEndElement - added to feedlist - %@", currentItem);
    } else if(currentItem && currentContents){
        [currentItem setObject:currentContents forKey:elementName];
        currentContents = nil;
    }
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    //Hook for any action when document read ends
    NSLog(@"rssTableVC:parserDidEndDocument: %@", parser);
}

@end
