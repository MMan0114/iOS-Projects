//
//  TableDetailViewController.m
//  Tablep
//
//  Created by MMan on 10/5/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "TableDetailViewController.h"

@interface TableDetailViewController ()

@end

@implementation TableDetailViewController
@synthesize inLabelText, inRow, inSection;
@synthesize outLabel, showRow, showSection;

- (void)viewDidLoad {
    [super viewDidLoad];
    outLabel.text = self.inLabelText;
    showRow.text = [NSString stringWithFormat:@"Row passed to this VC is %li", (long)inRow];
                    showSection.text = [NSString stringWithFormat:@"Section passed to this VC is %li", (long)inSection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
