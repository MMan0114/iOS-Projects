//
//  ViewController.m
//  playVideo
//
//  Created by MMan on 10/12/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *url = [[NSBundle mainBundle] pathForResource:@"Pipe Dream" ofType:@"m4v"];
    
    player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:url]];
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(movieFinishedCallBack:)
     name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    
    player.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:player.view];
    
    //Play movie
    [player play];
}   


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) movieFinishedCallBack:(NSNotification *)aNotification
{
    MPMoviePlayerController *moviePlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
}

@end
