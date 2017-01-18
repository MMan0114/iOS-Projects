//
//  ViewController.h
//  audioPlayer
//
//  Created by MMan on 10/12/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController{
    
    AVAudioPlayer *player;
    NSTimer *timer;
    IBOutlet UIProgressView *avgVolume;
    IBOutlet UIProgressView *peakVolume;
    IBOutlet UIButton *playPausebttn;
    IBOutlet UISlider *volumeSlider;
    IBOutlet UISlider *timeScale;
    
}

@property(retain) AVAudioPlayer *player;
@property(retain) NSString *path;

-(IBAction)play:(id)sender;
-(IBAction)changeVolume:(id)sender;
-(IBAction)changePlayerTime:(id)sender;


@end

