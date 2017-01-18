//
//  ViewController.h
//  Maps
//
//  Created by MMan on 11/9/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *myMap;
}
@property (nonatomic, retain) IBOutlet MKMapView *myMap;

-(IBAction)apple:(id)sender;
-(IBAction)changeMapType:(id)sender;

@end

