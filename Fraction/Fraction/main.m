//
//  main.m
//  Fraction
//
//  Created by MMan on 8/31/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
    int numerator;
    int denominator;
}
-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;
@end
@implementation Fraction


-(void) print
{
    NSLog (@"%i/%i", numerator, denominator);
}
-(void) setNumerator: (int) n
{
    numerator = n;
}
-(void)setDenominator:(int)d
{
    denominator = d;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *myFraction;
        myFraction = [[Fraction alloc] init];
        [myFraction setNumerator: 1];
        [myFraction setDenominator:3];
        NSLog (@"The value of my fraction is: ");
        [myFraction print];
    }
    return 0;
}
