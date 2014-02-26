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

- (void)stopSoundWithSoundName:(NSString *)soundName ofType:(NSString *)type
{
    AVAudioPlayer *player = [self playerWithSoundName:soundName ofType:type];
    if (player)
    {
        [player stop];
    }
}

- (BOOL)isPlayingWithSoundName:(NSString *)soundName ofType:(NSString *)type
{
    AVAudioPlayer *player = [self playerWithSoundName:soundName ofType:type];
    if (player)
    {
        return player.playing;
    }
    
    return NO;
}

- (void)stopAllSounds
{
    [_players enumerateObjectsUsingBlock:^(AVAudioPlayer *player, BOOL *stop) {
        [player stop];
    }];
}

#pragma mark - audio player delegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [_players removeObject:player];
}

#pragma mark - private

- (NSString *)soundFileNameWithSoundName:(NSString *)soundName ofType:(NSString *)type
{
    NSString *soundFileName = soundName;
    if (type)
    {
        soundFileName = [NSString stringWithFormat:@"%@.%@",soundName,type];
    }
    
    return soundFileName;
}

- (AVAudioPlayer *)playerWithSoundName:(NSString *)soundName ofType:(NSString *)type
{
    __block AVAudioPlayer *targetPlayer = nil;
    [_players enumerateObjectsUsingBlock:^(AVAudioPlayer *player, BOOL *stop) {
        
        NSString *soundFileName = [self soundFileNameWithSoundName:soundName ofType:type];
        NSString *playerLastPathComponent = [player.url lastPathComponent];
        
        if ([playerLastPathComponent isEqualToString:soundFileName])
        {
            targetPlayer = player;
            *stop = YES;
        }
    }];
    
    return targetPlayer;
}

@end
