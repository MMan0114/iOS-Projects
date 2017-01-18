//
//  ViewController.h
//  GeoCode
//
//  Created by MMan on 11/9/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLGeocoder.h>

@interface ViewController : UIViewController
<CLLocationManagerDelegate, MKMapViewDelegate>{
    
    IBOutlet MKMapView *myMap;
   // CLLocationManager *locationManager;
}
@property (nonatomic, retain) IBOutlet MKMapView *myMap;
@property (nonatomic, retain) CLLocationManager *locationManager;


@end

