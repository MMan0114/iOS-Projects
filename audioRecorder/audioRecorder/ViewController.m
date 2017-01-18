//
//  ViewController.m
//  audioRecorder
//
//  Created by MMan on 11/30/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize audioPlayer, audioRecorder;
@synthesize playButton, recordButton, stopButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //disable play and stop buttons
    playButton.enabled = NO;
    stopButton.enabled = NO;
    
    //setup recording options
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:@"myRecording.caf"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:AVAudioQualityMedium], AVEncoderAudioQualityKey,
        [NSNumber numberWithInt:16], AVEncoderBitRateKey,
        [NSNumber numberWithInt:2], AVNumberOfChannelsKey,
        [NSNumber numberWithFloat:44100], AVSampleRateKey,
                                    nil];
    NSError *error = nil;
    audioRecorder  = [[AVAudioRecorder alloc] initWithURL:soundFileURL settings:recordSettings error:&error];
    if(error){
        NSLog(@"error:%@", [error localizedDescription]);
        recordButton.enabled = NO;
    } else{
        //recoder is all set to go
        [audioRecorder prepareToRecord];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Action Methods
-(IBAction)recordButton:(id)sender{
    if(!audioRecorder.recording){
        playButton.enabled = NO;
        recordButton.enabled = NO;
        stopButton.enabled = YES;
        [audioRecorder record];
    }
}
-(IBAction)stopButton:(id)sender{
    stopButton.enabled = NO;
    playButton.enabled = YES; //User may play recorded audio
    recordButton.enabled = YES; //User may record over existing audio
    //two possibilites stop recording or stop playing
    if(audioRecorder.recording){
        [audioRecorder stop];
    }
    if(audioPlayer.playing){
        [audioPlayer stop];
    }
}
-(IBAction)playButton:(id)sender{
    stopButton.enabled = YES;
    recordButton.enabled = NO;
    playButton.enabled = NO;
    
    NSError *error = nil;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioRecorder.url error:&error];
    audioRecorder.delegate = self;
    if(error){
        NSLog(@"error:%@",[error localizedDescription]);
        stopButton.enabled = NO;
    }else{
        [audioPlayer play];
    }
}

#pragma mark - Recorder Delegates
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    //Player reached end of audio file
    stopButton.enabled = NO;
    recordButton.enabled = YES;
}
-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    NSLog(@"AudioPlayer decoder error:%@", [error localizedDescription]);
}
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    NSLog(@"Recorder finished recording");
    
}

@end
