//
//  ViewController.m
//  MusicShuffle
//
//  Created by MMan on 8/5/16.
//  Copyright © 2016 MananKothari. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()

@end

@implementation MusicViewController

@synthesize musicPlayer, minLabelValue, maxLabelValue, songLabel, albums, songs, songsAll, songsCollection;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Set up a MPMediaItemCollection with the albums in random order and set that as the queue to play
    songs = [NSArray alloc];
    songsAll = [[NSMutableArray alloc] init];
    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
    musicPlayer.shuffleMode = MPMusicShuffleModeOff;
    //musicPlayer.repeatMode = MPRepeatTypeAll;
    albums = [MPMediaQuery albumsQuery];
    NSArray *albumsInLibrary = [albums collections];
    NSMutableArray *albumCopy = [[NSMutableArray alloc] initWithArray:albumsInLibrary];
    [albumCopy shuffle];
    MPMediaItemCollection *albumCollection = [MPMediaItemCollection collectionWithItems:albumCopy];
    for (albumCollection in albumCopy) {
        songs = [albumCollection items];
        [songsAll addObjectsFromArray:songs];
        NSLog(@"\r\n -%@",[[albumCollection representativeItem] valueForProperty:MPMediaItemPropertyAlbumTitle]);
        for (MPMediaItem *song in songs) {
            NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
            NSLog (@"\t\t%@", songTitle);
        }
    }
    
    NSLog(@"\n");
    NSLog(@"\n");
    NSLog(@"\n");

    for(MPMediaItem *a in songsAll){
        NSString *songTitle = [a valueForProperty: MPMediaItemPropertyTitle];
        NSLog (@"\t\t%@", songTitle);
    }
    songsCollection = [MPMediaItemCollection collectionWithItems:songsAll];
    [musicPlayer setQueueWithItemCollection:songsCollection];

    if ([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        
        [playPauseButton setImage:[UIImage imageNamed:@"pauseButton.png"] forState:UIControlStateNormal];
    }
    else {
        
        [playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
    }
    
    //Set the value of the timescale slider based on the current item
    minLabelValue.text = @"0:00";
    timeScale.value = musicPlayer.currentPlaybackTime;
    timeScale.minimumValue = 0;
    NSNumber *duration = [self.musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyPlaybackDuration];
    float totalTime = [duration floatValue];
    float min = floor(totalTime/60);
    float sec = round(totalTime - min * 60);
    NSString *time = [NSString stringWithFormat:@"%02d:%02d", (int)min, (int)sec];
    timeScale.maximumValue = totalTime;
    maxLabelValue.text = time;
    
    //Set up a volume view
    mpVolumeViewParentView.backgroundColor = [UIColor clearColor];
    MPVolumeView *myVolumeView =
    [[MPVolumeView alloc] initWithFrame: mpVolumeViewParentView.bounds];
    [mpVolumeViewParentView addSubview: myVolumeView];
    [self registerMediaPlayerNotifications];
    
}
- (void) registerMediaPlayerNotifications
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver: self
                           selector: @selector (handle_NowPlayingItemChanged:)
                               name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                             object: musicPlayer];
    
    [notificationCenter addObserver: self
                           selector: @selector (handle_PlaybackStateChanged:)
                               name: MPMusicPlayerControllerPlaybackStateDidChangeNotification
                             object: musicPlayer];
    
    [musicPlayer beginGeneratingPlaybackNotifications];
}

- (void) handle_NowPlayingItemChanged: (id) notification
{
    MPMediaItem *currentItem = [musicPlayer nowPlayingItem];
    UIImage *artworkImage = [UIImage imageNamed:@"noArtworkImage.png"];
    MPMediaItemArtwork *artwork = [currentItem valueForProperty: MPMediaItemPropertyArtwork];
    
    if (artwork) {
        artworkImage = [artwork imageWithSize: CGSizeMake (300, 300)];
    }
    
    [artworkImageView setImage:artworkImage];
    
    NSString *titleString = [currentItem valueForProperty:MPMediaItemPropertyTitle];
    if (titleString) {
        NSString *songTitle = [NSString stringWithFormat:@"Title: %@",titleString];
        //songLabel.text = @"songTitle";
        [songLabel setText:songTitle];
    }
    else {
        songLabel.text = @"Title: Unknown title";
    }
    NSString *artistString = [currentItem valueForProperty:MPMediaItemPropertyArtist];
    if (artistString) {
        artistLabel.text = [NSString stringWithFormat:@"Artist: %@",artistString];
    }
    else {
        artistLabel.text = @"Artist: Unknown artist";
    }
    
    NSString *albumString = [currentItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    if (albumString) {
        albumLabel.text = [NSString stringWithFormat:@"Album: %@",albumString];
    }
    else {
        albumLabel.text = @"Album: Unknown album";
    }
    
}

- (void) handle_PlaybackStateChanged: (id) notification
{
    MPMusicPlaybackState playbackState = [musicPlayer playbackState];
    
    if (playbackState == MPMusicPlaybackStatePaused) {
        [playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
        
    }
    else if (playbackState == MPMusicPlaybackStatePlaying) {
        [playPauseButton setImage:[UIImage imageNamed:@"pauseButton.png"] forState:UIControlStateNormal];
        
    }
    else if (playbackState == MPMusicPlaybackStateStopped) {
        
        [playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
        [musicPlayer stop];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)previousSong:(id)sender {
    [musicPlayer skipToPreviousItem];
}

- (IBAction)playPause:(id)sender {
    if ([musicPlayer playbackState] == MPMusicPlaybackStatePlaying)
    {
        [musicPlayer pause];
        [timer invalidate];
    }
    else
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                                 target:self
                                               selector:@selector(updateUI:)
                                               userInfo:nil
                                                repeats:YES];
        [musicPlayer play];
    }
}
- (void)updateUI:(id)sender {
    minLabelValue.text = @"0:00";
    
    timeScale.minimumValue = 0;
    //Get the length of the song and set the max label value to that time
    NSNumber *duration = [self.musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyPlaybackDuration];
    float totalTime = [duration floatValue];
    float totalMin = floor(totalTime/60);
    float totalSec = round(totalTime - totalMin * 60);
    NSString *tTime = [NSString stringWithFormat:@"%02d:%02d", (int)totalMin, (int)totalSec];
    timeScale.maximumValue = totalTime;
    maxLabelValue.text = tTime;

    //Get current time and update the slider as well as the min label value
    NSTimeInterval currentProgress = musicPlayer.currentPlaybackTime;
    timeScale.value = currentProgress;
    float min = floor(currentProgress/60);
    float sec = round(currentProgress - min * 60);
    NSString *time = [NSString stringWithFormat:@"%02d:%02d", (int)min, (int)sec];
    minLabelValue.text = time;
    if(musicPlayer.playbackState == 0){
        [timer invalidate];
        timeScale.value = 0;
    }
}

- (IBAction)nextSong:(id)sender {
     [musicPlayer skipToNextItem];
}
- (IBAction)changePlayerTime:(id)sender{
    musicPlayer.currentPlaybackTime = timeScale.value;
}
- (IBAction)nextAlbum:(id)sender{
    MPMediaItem *currentItem = [musicPlayer nowPlayingItem];
    NSUInteger trackNumber = currentItem.albumTrackNumber;
    NSUInteger albumTracks = currentItem.albumTrackCount;
    NSUInteger difference = albumTracks - trackNumber;
    [musicPlayer pause];

    NSUInteger currIndex = [musicPlayer indexOfNowPlayingItem];
    NSUInteger diff = currIndex + difference +1;
    self.musicPlayer.nowPlayingItem = [songsCollection.items objectAtIndex:diff];
    [musicPlayer play];
}
- (IBAction)queueButton:(id)sender{
    
}


@end
