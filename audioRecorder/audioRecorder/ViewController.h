//
//  ViewController.h
//  audioRecorder
//
//  Created by MMan on 11/30/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate, AVAudioRecorderDelegate> {
    AVAudioPlayer *audioPlayer;
    AVAudioRecorder *audioRecorder;
    
}
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
@property (nonatomic, retain) AVAudioRecorder *audioRecorder;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *recordButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
-(IBAction)recordButton:(id)sender;
-(IBAction)playButton:(id)sender;
-(IBAction)stopButton:(id)sender;

@end

