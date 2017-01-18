//
//  ViewController.m
//  deviceCapabilities
//
//  Created by MMan on 11/30/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize text, myDevice;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    myDevice = [UIDevice currentDevice];
    
    //Battery notification
    [myDevice setBatteryMonitoringEnabled:YES];
    //set observer for state change
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryLevelChange: ) name:UIDeviceBatteryLevelDidChangeNotification object:nil];
    [myDevice setProximityMonitoringEnabled:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateChange: ) name:UIDeviceProximityStateDidChangeNotification object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)getDeviceInfo:(id)sender{
    //NSArray *batteryStates = [NSArray arrayWithObjects:@"unkown", @"Battery is not plugged into charger", @"Battery state is full", "4", "5", nil];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfFileSystemForPath:
                                    NSHomeDirectory() error:nil];
    
    NSString *myText = [NSString stringWithFormat:@"System Name: %@\n", myDevice.systemName];
    myText = [myText stringByAppendingFormat:@"System Version: %@\n", myDevice.systemVersion];
    myText = [myText stringByAppendingFormat:@"Model: %@\n", myDevice.model];
    myText = [myText stringByAppendingFormat:@"Name: %@\n", myDevice.name];
    myText = [myText stringByAppendingFormat:@"User InterfaceIdiom: %ld\n", (long)myDevice.userInterfaceIdiom];
    myText = [myText stringByAppendingFormat:@"Battery Level: %0.2f\n", myDevice.batteryLevel*100];
    //myText = [myText stringByAppendingFormat:@"Battery State:@%@\n", [batteryStates objectAtIndex:myDevice.batteryState]];
    myText = [myText stringByAppendingFormat:@"Proximity sensor state: %d\n", myDevice.proximityState];
    myText = [myText stringByAppendingFormat:@"File system size: %@ bytes\n", [fileAttributes objectForKey:NSFileSystemSize]];
    myText = [myText stringByAppendingFormat:@"File system available space:%@ bytes\n", [fileAttributes objectForKey:NSFileSystemFreeSize]];
    text.text = myText;
}
-(void)batteryLevelChange:(id)sender{
    NSLog(@"Battery Level Changed, new level:%0.2f", myDevice.batteryLevel*100);
}
-(void)proximityStateChange:(NSNotificationCenter *)notification{
    NSLog(@"Proximity State Changed, new state:%d", myDevice.proximityState);
}


@end
