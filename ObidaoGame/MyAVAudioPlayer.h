//
//  MyAVAudioPlayer.h
//  ObidaoGame
//
//  Created by work on 12/20/13.
//  Copyright (c) 2013 Originate Inc. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "Emotion.h"

@interface MyAVAudioPlayer : AVAudioPlayer {
  AVAudioPlayer *_audioPlayer;
}

- (id)initPlayerWithEmotionType:(EmotionType)emotionType;
- (void)upDateSoundPlayerUnderEmotionType:(EmotionType)emotionType;
- (void)playSound;
- (void)stopSound;
@end
