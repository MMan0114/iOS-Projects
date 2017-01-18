//
//  ViewController.m
//  Maps
//
//  Created by MMan on 11/9/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myMap;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:@"2211 Comstock Lane, Naperville, IL, United States" completionHandler:^(NSArray *placemarks, NSError *err){
        for (CLPlacemark *aPlaceMark in placemarks) {
            NSString *lat = [NSString stringWithFormat:@"%.4f", aPlaceMark.location.coordinate.latitude];
            NSString *lon = [NSString stringWithFormat:@"%.4f", aPlaceMark.location.coordinate.longitude];
            NSLog(@" lat is %@, long is %@", lat, lon);
            CLLocationCoordinate2D coords1;
            coords1.latitude = aPlaceMark.location.coordinate.latitude;
            coords1.longitude = aPlaceMark.location.coordinate.longitude;
            MKCoordinateSpan span1 = MKCoordinateSpanMake(0.002389, 0.005681);
            MKCoordinateRegion region1 = MKCoordinateRegionMake(coords1, span1);
            [myMap setRegion:region1 animated:YES];
            
        }
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)apple:(id)sender{
    CLLocationCoordinate2D coords;
    coords.latitude = 37.33188;
    coords.longitude = -122.029497;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.002389, 0.005681);
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, span);
    
    [myMap setRegion:region animated:YES];
}
-(IBAction)changeMapType:(id)sender{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    [self.myMap setMapType:control.selectedSegmentIndex];
    
}

@end
