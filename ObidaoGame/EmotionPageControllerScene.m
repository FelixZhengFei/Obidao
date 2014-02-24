//
//  EmotionPageControllerScene.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "EmotionPageControllerScene.h"
#import "FingerMoveDirection.h"
#import "ScreenScaleFactor.h"
#import "IslandMapScene.h"
#import "Defaults.h"
#import "CCSprite+SpriteTransparency.h"
#import "ImageNameString.h"
#import "SKAction+Helper.h"
#import "MyAVAudioPlayer.h"
#import "UITouch+FingerTouch.h"

@interface EmotionPageControllerScene() {
  SKSpriteNode *_currentEmotionSprite;
  SKSpriteNode *_ballSpriteNode;

  EmotionType _currentEmotionType;
  VeggieType _currentVeggieType;
  int _countsOfEmotionClick;
  SKSpriteNode *_backButtonSprite;
  MyAVAudioPlayer *_soundPlayer;
  BOOL isTouchAble;
}

@end

@implementation EmotionPageControllerScene

#pragma mark - Public methods

- (void)backObidaoIsland {
  [_currentEmotionSprite removeAllActions];
  [self removeAllActions];
  [_soundPlayer stopSound];
  SKScene * myScene = [[IslandMapScene alloc] initWithSize:self.size];
  myScene.scaleMode = SKSceneScaleModeAspectFill;
  [self.view presentScene:myScene];
}

- (void)addBackButtonItem {
  _backButtonSprite = [SKSpriteNode spriteNodeWithImageNamed:[ImageNameString getStringOfImageFileWithImageType:Image_Button_Back]];
  if (IS_IPID) {
    _backButtonSprite.position = CGPointMake(self.size.width * 0.1, self.size.height * 0.75);
  } else {
    _backButtonSprite.position = CGPointMake(self.size.width * 0.1, self.size.height * 0.62);
  }
  _backButtonSprite.xScale = _backButtonSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:10];
  [self addChild:_backButtonSprite];
}

- (void)addBackgroundImage:(VeggieType)veggieType {
  SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:[ImageNameString getBackgroundImageName:veggieType]];
  background.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
  background.xScale = background.yScale = [ScreenScaleFactor screenScaleFactorForDevices:10];
  [self addChild:background];
}

- (void)initAllThingsOfInhabitantPage:(VeggieType)veggieType {
  _countsOfEmotionClick = 0;
  isTouchAble = TRUE;
  _currentEmotionType = Emotion_Happy;
  NSError *error;
  [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
  [self initSoundPlayer];
}

- (void)initSoundPlayer {
  _soundPlayer = [[MyAVAudioPlayer alloc] initPlayerWithEmotionType:_currentEmotionType];
}

- (void)showTheFirstComeVeggieEmotion:(VeggieType)veggieType {
  _currentVeggieType = veggieType;
  _countsOfEmotionClick = 0;
  SKSpriteNode *emotionSprite = [self createEmotionSprite];
  emotionSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
  emotionSprite.xScale = emotionSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:_currentVeggieType];
  _currentEmotionSprite = emotionSprite;
  [self addChild:_currentEmotionSprite];
}

- (SKSpriteNode *)createEmotionSprite {
  SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:[ImageNameString getNetuarlImageName:_currentVeggieType]] ;
  return sprite;
}

- (void)showTheNextEmotionSprite {
  [_currentEmotionSprite removeFromParent];
  isTouchAble = TRUE;
  _countsOfEmotionClick = 0;
  SKSpriteNode *emotionSprite = [self createEmotionSprite];
  emotionSprite.xScale = emotionSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:_currentVeggieType];
  emotionSprite.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
  _currentEmotionSprite = emotionSprite;
  [self addChild:_currentEmotionSprite];
}

- (BOOL)isCurrentEmotionTouched:(CGPoint)location {
  BOOL isTran = [SKSpriteNode containsTouchLocation:location veggieType:_currentVeggieType];
  return _currentEmotionSprite && isTran;
}

- (BOOL)isBackgroundTouched:(CGPoint)location {
  return _backButtonSprite && CGRectContainsPoint(_backButtonSprite.frame, location);
}

- (void)changeFingerTouchAble {
  if (isTouchAble) {
    isTouchAble = NO;
  }
  isTouchAble = TRUE;
}

#pragma mark - finger touched methods

- (void)timeUpdateOrFingerTouchedActions {
  _countsOfEmotionClick++;
  [_soundPlayer stopSound];
  
  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  if (_countsOfEmotionClick == 1) {
    SKAction *action = [UITouch fingerClickAtOneTime:_currentVeggieType soundPlay:_soundPlayer];
    _currentEmotionSprite.xScale = _currentEmotionSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:_currentVeggieType];
    [_currentEmotionSprite runAction:[SKAction sequence:@[action,chaneFingerTouchAbleAction]]];
    if (_currentVeggieType == VeggieCarot) {
      _ballSpriteNode = [SKSpriteNode spriteNodeWithImageNamed:@"blowing_balloon0001.png"];
      _ballSpriteNode.position = CGPointMake(CGRectGetMidX(self.frame)-10,CGRectGetMidY(self.frame));
      _ballSpriteNode.anchorPoint = CGPointMake(0,1);
      [self addChild:_ballSpriteNode];
      [_ballSpriteNode runAction:[SKAction carrotPlayBallon:YES]];
    }
  }
  else if (_countsOfEmotionClick == 2) {
    if (_currentVeggieType == VeggieCarot) {
      [_ballSpriteNode removeFromParent];
    }
    SKAction *action = [UITouch fingerClickAtThreeTime:_currentVeggieType soundPlay:_soundPlayer];
    _currentEmotionSprite.xScale = _currentEmotionSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:_currentVeggieType];
    [_currentEmotionSprite runAction:[SKAction sequence:@[action,chaneFingerTouchAbleAction]]];
  }
  else if (_countsOfEmotionClick == 3) {
    SKAction *action = [UITouch fingerClickAtFourTime:_currentVeggieType soundPlay:_soundPlayer];
    SKAction *runNextEmotion = [SKAction performSelector:@selector(showTheNextEmotionSprite) onTarget:self];
    _currentEmotionSprite.xScale = _currentEmotionSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:_currentVeggieType];
    if (_currentVeggieType == VeggieCarot) {
      _ballSpriteNode = [SKSpriteNode spriteNodeWithImageNamed:@"blowing_balloon0001.png"];
      _ballSpriteNode.position = CGPointMake(CGRectGetMidX(self.frame)-10,CGRectGetMidY(self.frame));
      _ballSpriteNode.anchorPoint = CGPointMake(0,1);
      [self addChild:_ballSpriteNode];
      SKAction *pressBall = [SKAction carrotPlayBallon:YES];
      SKAction *waitime = [SKAction waitForDuration:0.28];
      SKAction *removeball = [SKAction runBlock:^{
        [_ballSpriteNode removeFromParent];
      }];
      [_ballSpriteNode runAction:[SKAction sequence:@[pressBall,waitime,removeball]]];
    }
    if (_currentVeggieType == VeggieEggplant) {
      [_currentEmotionSprite runAction:[SKAction sequence:@[action,chaneFingerTouchAbleAction]]];
    } else {
      [_currentEmotionSprite runAction:[SKAction sequence:@[action,runNextEmotion,chaneFingerTouchAbleAction]]];
    }
    
  }else if (_countsOfEmotionClick == 4) {
    SKAction *action = [UITouch fingerClickAtFiveTime:_currentVeggieType soundPlay:_soundPlayer];
    _currentEmotionSprite.xScale = _currentEmotionSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:_currentVeggieType];
    [_currentEmotionSprite runAction:[SKAction sequence:@[action,chaneFingerTouchAbleAction]]];
    
  } else if (_countsOfEmotionClick == 5) {
    SKAction *action = [UITouch fingerClickAtSixTime:_currentVeggieType soundPlay:_soundPlayer];
    SKAction *runNextEmotion = [SKAction performSelector:@selector(showTheNextEmotionSprite) onTarget:self];
    _currentEmotionSprite.xScale = _currentEmotionSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:_currentVeggieType];
    [_currentEmotionSprite runAction:[SKAction sequence:@[action,runNextEmotion,chaneFingerTouchAbleAction]]];
  }
  else{
  }
}

#pragma mark -Touch Delegete

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  if ([touch tapCount] == 1) {
    CGPoint location = [touch locationInNode:self];
    if ([self isBackgroundTouched:location]) {
      [self backObidaoIsland];
    }
    else if ([self isCurrentEmotionTouched:location] && isTouchAble) {
      isTouchAble = FALSE;
      [self timeUpdateOrFingerTouchedActions];
    }
  }
}



@end
