//
//  ViewController.m
//  MZRSoundManager
//
//  Created by MORITA NAOKI on 2014/02/27.
//  Copyright (c) 2014年 molabo. All rights reserved.
//

#import "ViewController.h"

#import <MZRSoundManager.h>
#import <MZRSoundManager+OctaveSounds.h>

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *soundNames;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Octave Sounds";
    
    self.soundNames = [MZRSoundManager sharedInstance].octaveSounds;
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.soundNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *soundName = self.soundNames[indexPath.row];
    soundName = [soundName stringByReplacingOccurrencesOfString:@"MZRSoundManager" withString:@""];
    soundName = [soundName stringByReplacingOccurrencesOfString:@".aif" withString:@""];
    
    cell.textLabel.text = soundName;
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *soundName = self.soundNames[indexPath.row];
    
    MZRSoundManager *soundManager = [MZRSoundManager sharedInstance];
    
//    if ([soundManager isPlayingWithSoundName:soundName ofType:nil])
//    {
//        [soundManager stopSoundWithSoundName:soundName ofType:nil];
//    }
//    else
//    {
//        [soundManager playSoundWithSoundName:soundName ofType:nil];
//    }
    
    [soundManager playSoundWithSoundName:soundName ofType:nil];
}

@end
