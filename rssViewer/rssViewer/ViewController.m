//
//  ViewController.m
//  rssViewer
//
//  Created by MMan on 11/16/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"RSS Feeds";
    rssList = [[NSMutableArray alloc] initWithCapacity:1];
    NSString *paths = [[NSBundle mainBundle] resourcePath];
    NSString *xmlFile = [paths stringByAppendingPathComponent:@"rssfeeds.xml"];
    NSURL *xmlURL = [NSURL fileURLWithPath:xmlFile isDirectory:NO];
    NSXMLParser *firstParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [firstParser setDelegate:self];
    [firstParser parse];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----NSNMLParserDelegate Methods
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"didStartElement:nameSpaceURI = %@", namespaceURI);
    NSLog(@"didStartElement:qualifiedName = %@", qName);
    NSLog(@"didStartElement:attributes = %@", attributeDict);
    if([elementName compare:@"feed"] == NSOrderedSame){
        [rssList addObject:[[NSDictionary alloc]
                            initWithObjectsAndKeys:
                            [attributeDict objectForKey:@"title"], @"title",
                            [attributeDict objectForKey:@"url"], @"url", nil]];
        NSLog(@"didStartElement:------ added title - %@ and url - %@ to rssList array", [attributeDict objectForKey:@"title"], [attributeDict objectForKey:@"url"]);
    }
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    //Hook for any action when document read ends
    NSLog(@"ViewController:XML Parser finished parsing document");
}
#pragma mark - Table Methods
-(NSInteger)numberofSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [rssList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [[rssList objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    rssTableViewController *rssVC = [segue destinationViewController];
    rssVC.url = [[rssList objectAtIndex:myIndexPath.row] objectForKey:@"url"];
    rssVC.title = [[rssList objectAtIndex:myIndexPath.row] objectForKey:@"title"];
}

@end
