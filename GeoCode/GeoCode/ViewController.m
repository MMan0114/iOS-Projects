//
//  ViewController.m
//  GeoCode
//
//  Created by MMan on 11/9/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myMap, locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    
    NSLog(@"Authorization Status %i", [CLLocationManager authorizationStatus]);
    
    if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        //Must have NSLocationWhenInUsageDescription set to a string in Info.plist for iOS to pop up permission request window
        [self.locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
    [locationManager startUpdatingHeading];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //May get several updates in an array - we will use first only
    NSLog(@"location object %@", [locations objectAtIndex:0]);
    CLLocation *myLoc = [locations objectAtIndex:0];
    
    if([locations count] > 0){
        //Let's get the last object
        myLoc = [locations lastObject];
        
        CLLocation *newLocation = [[CLLocation alloc] initWithLatitude:myLoc.coordinate.latitude longitude:myLoc.coordinate.longitude];
        [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *err){
            if (placemarks.count){
                NSLog(@"------ Start of Info for Placemark %li", placemarks.count);
                NSLog(@"Name = %@",[placemarks[0] name]);
                NSLog(@"subThoroughFare = %@",[placemarks[0] subThoroughfare]);
                NSLog(@"Thoroughfare = %@",[placemarks[0] thoroughfare]);
                NSLog(@"subLocality = %@",[placemarks[0] subLocality]);
                NSLog(@"Locality = %@",[placemarks[0] locality]);
                NSLog(@"subAdministrativeArea = %@",[placemarks[0] subAdministrativeArea]);
                NSLog(@"AdministrativeArea = %@", [placemarks[0] administrativeArea]);
                NSLog(@"postalCode = %@",[placemarks[0] postalCode]);
                NSLog(@"Country = %@",[placemarks[0] country]);
                NSLog(@"ISOCountryCode = %@",[placemarks[0] ISOcountryCode]);
                NSLog(@"inlandwater = %@",[placemarks[0] inlandWater]);
                NSLog(@"Ocean = %@",[placemarks[0] ocean]);
                NSLog(@"------ End of Info for Placemark %li", placemarks.count);
                
                //to get object description you could do [placemarks[0] description];
            }
        }];
    }
    //set span and region
    MKCoordinateSpan span = MKCoordinateSpanMake(0.009, 0.009);
    MKCoordinateRegion region = MKCoordinateRegionMake(myLoc.coordinate, span);
    
    [myMap setRegion:region animated:YES];
}
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    NSLog(@"DidChangeAuthorizationStatus Method Called");
}

-(void)viewWillDisappear:(BOOL)animated{
    [locationManager stopUpdatingLocation];
}

@end
