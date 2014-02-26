//
//  MZRSoundManager.h
//  MZRSoundManager
//
//  Created by MORITA NAOKI on 2013/11/09.
//  Copyright (c) 2013年 molabo. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const MZRSoundManagerTypeAif;
extern NSString *const MZRSoundManagerTypeCaf;
extern NSString *const MZRSoundManagerTypeMp3;
extern NSString *const MZRSoundManagerTypeWav;

@interface MZRSoundManager : NSObject

+ (MZRSoundManager *)sharedInstance;

- (void)playSoundWithSoundName:(NSString *)soundName ofType:(NSString *)type;

- (void)stopAllSounds;

@end
