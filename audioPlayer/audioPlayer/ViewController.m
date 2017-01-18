//
//  ViewController.m
//  audioPlayer
//
//  Created by MMan on 10/12/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize path, player;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Prep audio player
    NSError *myError;
    path = [[NSBundle mainBundle]pathForResource:@"03 No Sugar No Cream" ofType:@"mp3"];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:
              [NSURL fileURLWithPath:path] error:&myError];
    if(!player){
        NSLog(@"viewDidLoad:error - %@", [myError localizedDescription]);
        NSLog(@"viewDidLoad:failureReason - %@", [myError localizedFailureReason]);
        NSLog(@"viewDidLoad:recoveryOptions - %@", [myError localizedRecoveryOptions]);
        NSLog(@"viewDidLoad:recoverySuggestions - %@", [myError localizedRecoverySuggestion]);
    }
    
    [player prepareToPlay];
    timeScale.minimumValue = 0;
    timeScale.maximumValue = player.duration;
    
    player.meteringEnabled = YES;
    
    avgVolume.progress = 0.0f;
    peakVolume.progress = 0.0f;
    
    [playPausebttn setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)play:(id)sender{
        
        if([playPausebttn.currentImage isEqual:[UIImage imageNamed:@"playButton.png"]]){
            volumeSlider.value = player.volume;
            volumeSlider.enabled = YES;
            
            //switch label text
            [playPausebttn setImage:[UIImage
                                     imageNamed:@"pauseButton.png"]
                                     forState:UIControlStateNormal];
            
            timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                     target:self
                                                   selector:@selector(updateUI:)
                                                   userInfo:nil
                                                    repeats:YES];
        [playPausebttn setEnabled:YES];
        [player play];
    } else if([playPausebttn.currentImage isEqual:[UIImage imageNamed:@"pauseButton.png"]]){
        //switch label text
        [playPausebttn setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
        [playPausebttn setEnabled:YES];
        [timer invalidate];
        [player pause];
    }
}

- (void)updateUI:(id)sender {
    [player updateMeters];
    float avg = -1*[player averagePowerForChannel:0];
    float peak = -1*[player peakPowerForChannel:0];
    
    avgVolume.progress = avg/20;
    peakVolume.progress = peak/20;
    
    timeScale.value = player.currentTime;
    
    NSLog(@"avg %f\n peak %f\n avgProgress %f\n peakProgress %f \n",
          avg, peak, avgVolume.progress, peakVolume.progress);
    NSLog(@"playing %d", player.playing);
    if(player.playing  == 0){
        [timer invalidate];
        [playPausebttn setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
        timeScale.value = 0;
        [playPausebttn setEnabled:YES];
    }
}

- (IBAction)changePlayerTime:(id)sender{
    player.currentTime = timeScale.value;
}

-(IBAction)changeVolume:(id)sender{
    player.volume = volumeSlider.value;
}

@end
