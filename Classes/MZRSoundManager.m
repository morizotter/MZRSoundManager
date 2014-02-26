//
//  MZRSoundManager.m
//  MZRSoundManager
//
//  Created by MORITA NAOKI on 2013/11/09.
//  Copyright (c) 2013年 molabo. All rights reserved.
//

@import AVFoundation;

#import "MZRSoundManager.h"

NSString *const MZRSoundManagerTypeAif = @"aif";
NSString *const MZRSoundManagerTypeCaf = @"caf";
NSString *const MZRSoundManagerTypeMp3 = @"mp3";
NSString *const MZRSoundManagerTypeWav = @"wav";

@interface MZRSoundManager()
<AVAudioPlayerDelegate>

@end

@implementation MZRSoundManager
{
    NSMutableSet *_players;
}

static MZRSoundManager *sharedInstance = nil;

+ (MZRSoundManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MZRSoundManager alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _players = [NSMutableSet set];
    }
    return self;
}

- (void)playSoundWithSoundName:(NSString *)soundName ofType:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:type];
    NSURL* url = [NSURL fileURLWithPath:path];
    AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [player setDelegate:self];
    [_players addObject:player];
    
    [player play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [_players removeObject:player];
}

- (void)stopAllSounds
{
    [_players enumerateObjectsUsingBlock:^(AVAudioPlayer *player, BOOL *stop) {
        [player stop];
    }];
}

@end
