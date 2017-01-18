//
//  ViewController.h
//  MusicShuffle
//
//  Created by MMan on 8/5/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "NSMutableArray+NSMutableArray_shuffling.h"

@interface MusicViewController : UIViewController < MPMediaPickerControllerDelegate>{
    
    NSTimer *timer;
    IBOutlet UIImageView *artworkImageView;
    IBOutlet UIButton *playPauseButton;
    IBOutlet UILabel *songLabel;
    IBOutlet UILabel *albumLabel;
    IBOutlet UILabel *artistLabel;
    IBOutlet UISlider *timeScale;
    IBOutlet UIView *mpVolumeViewParentView;
    IBOutlet UILabel *minLabelValue;
    IBOutlet UILabel *maxLabelValue;
    MPMusicPlayerController *musicPlayer;
    
}
@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;
@property (nonatomic, retain) UILabel *minLabelValue;
@property (nonatomic, retain) IBOutlet UILabel *maxLabelValue;
@property (nonatomic, retain) UILabel *songLabel;
@property (nonatomic, retain) MPMediaQuery *albums;
@property (nonatomic, retain) NSArray *songs;
@property (nonatomic, retain) NSMutableArray *songsAll;
@property (nonatomic, retain) MPMediaItemCollection *songsCollection;




- (IBAction)previousSong:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)nextSong:(id)sender;
- (IBAction)changePlayerTime:(id)sender;
- (IBAction)nextAlbum:(id)sender;
- (void)registerMediaPlayerNotifications;
- (IBAction)queueButton:(id)sender;


@end

