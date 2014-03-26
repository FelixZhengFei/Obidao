//f
//  PotatoVeggiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "PotatoVeggiePage.h"
#import "FingerMoveDirection.h"
#import "ScreenScaleFactor.h"
#import "IslandMapScene.h"
#import "Defaults.h"
#import "CCSprite+SpriteTransparency.h"
#import "ImageNameString.h"
#import "SKAction+Helper.h"
#import "MyAVAudioPlayer.h"
#import "UITouch+FingerTouch.h"

@interface PotatoVeggiePage () {
  int _countsOfEmotionClick;
  BOOL _isTouchAble;
  EmotionType _currentEmotionType;
  MyAVAudioPlayer *_soundPlayer;

  SKSpriteNode *_backButtonSprite;
  SKSpriteNode *_backgroundSprite;
  SKSpriteNode *_wallowSprite;
  
  SKSpriteNode *_potatoInhabitantSprite;
  SKSpriteNode *_cornInhabitantSprite;
  SKSpriteNode *_cucumberInhabitantSprite;
}

@end

@implementation PotatoVeggiePage

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    self.backgroundColor = [SKColor colorWithRed:0.486 green:0.678 blue:0.227 alpha:1.0];
    [self configBackgroundImage];
    [self configBackButtonItem];
    [self configView];
  }
  return self;
}

#pragma mark - Private methods

- (void)configView {
  _countsOfEmotionClick = 0;
  _isTouchAble = TRUE;
  _currentEmotionType = Emotion_Happy;
  [self initThreeInhabitants];
  [self initSoundPlayer];
}

- (void)backToObidaoIsland {
  [self removeAllActions];
  SKScene * myScene = [[IslandMapScene alloc] initWithSize:self.size];
  myScene.scaleMode = SKSceneScaleModeAspectFill;
  [self.view presentScene:myScene];
}

- (void)initSoundPlayer {
  _soundPlayer = [[MyAVAudioPlayer alloc] initPlayerWithEmotionType:_currentEmotionType];
}

- (void)configBackButtonItem {
  _backButtonSprite = [SKSpriteNode spriteNodeWithImageNamed:[ImageNameString getStringOfImageFileWithImageType:Image_Button_Back]];
  if (IS_IPID) {
    _backButtonSprite.position = CGPointMake(self.size.width * 0.1, self.size.height * 0.75);
  } else {
    _backButtonSprite.position = CGPointMake(self.size.width * 0.1, self.size.height * 0.62);
  }
  _backButtonSprite.xScale = _backButtonSprite.yScale = [ScreenScaleFactor screenScaleFactorForDevices:10];
  [self addChild:_backButtonSprite];
}

- (void)configBackgroundImage {
  _backgroundSprite = [SKSpriteNode spriteNodeWithImageNamed:[ImageNameString getBackgroundImageName:VeggiePotato]];
  _backgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
  _backgroundSprite.xScale = _backgroundSprite.yScale = 0.8;
  [self addChild:_backgroundSprite];
  [self addTreeSprites];
}

- (void)addTreeSprites {
  SKSpriteNode *tree1 = [SKSpriteNode spriteNodeWithImageNamed:@"tree1"];
  tree1.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * .2);
  tree1.xScale = tree1.yScale = 0.8;
  [_backgroundSprite addChild:tree1];
  
  SKSpriteNode *tree2 = [SKSpriteNode spriteNodeWithImageNamed:@"tree2"];
  tree2.position = CGPointMake(0,CGRectGetMidY(self.frame) * 0.6);
  tree2.xScale = tree2.yScale = 0.8;
  [_backgroundSprite addChild:tree2];
  
  SKSpriteNode *tree3 = [SKSpriteNode spriteNodeWithImageNamed:@"tree3"];
  tree3.position = CGPointMake(CGRectGetMidX(self.frame) *(-1) ,CGRectGetMidY(self.frame) * (- 0.1));
  tree3.xScale = tree3.yScale = 0.8;
  [_backgroundSprite addChild:tree3];
  
  _wallowSprite = [SKSpriteNode spriteNodeWithImageNamed:@"wallow"];
  _wallowSprite.position = CGPointMake(CGRectGetMidX(self.frame) *0.1,CGRectGetMidY(self.frame) * (-.6));
  _wallowSprite.xScale = _wallowSprite.yScale = 1;
  _wallowSprite.hidden = YES;
  [_backgroundSprite addChild:_wallowSprite];
}

- (void)initThreeInhabitants {
  _cornInhabitantSprite = [self createEmotionSprite:VeggieCorn];
  _cornInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * 0.7,CGRectGetMidY(self.frame) * 1.1);
  _cornInhabitantSprite.xScale = _cornInhabitantSprite.yScale = 0.5;
  [self addChild:_cornInhabitantSprite];
  
  [self addPotatoSpriteInName:[ImageNameString getNetuarlImageName:VeggiePotato] position:CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.1)];
  
  _cucumberInhabitantSprite = [self createEmotionSprite:VeggieCucumber];
  _cucumberInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) *1.6,CGRectGetMidY(self.frame) * 0.8);
  _cucumberInhabitantSprite.xScale = _cucumberInhabitantSprite.yScale = .5;
  [self addChild:_cucumberInhabitantSprite];
}

- (SKSpriteNode *)createEmotionSprite:(VeggieType)veggieType {
  SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:[UIImage imageNamed:[ImageNameString getNetuarlImageName:veggieType]]]] ;

  return sprite;
}

- (void)changeFingerTouchAble {
  if (_isTouchAble) {
    _isTouchAble = NO;
  }
  _isTouchAble = TRUE;
}

- (BOOL)isBackButtonTouched:(CGPoint)location {
  return _backButtonSprite && CGRectContainsPoint(_backButtonSprite.frame, location);
}

- (BOOL)isInhabitantSpriteTouched:(CGPoint)location {
  return (_potatoInhabitantSprite && CGRectContainsPoint(_potatoInhabitantSprite.frame, location)) ||  (_cucumberInhabitantSprite && CGRectContainsPoint(_cucumberInhabitantSprite.frame, location)) || (_cornInhabitantSprite && CGRectContainsPoint(_cornInhabitantSprite.frame, location));
}

#pragma mark -Touch Delegete

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  if ([touch tapCount] == 1) {
    CGPoint location = [touch locationInNode:self];
    if ([self isBackButtonTouched:location]) {
      [self backToObidaoIsland];
    }
    if ([self isInhabitantSpriteTouched:location] && _isTouchAble) {
      _isTouchAble = NO;
      _countsOfEmotionClick++;
      [self removeAllActions];
      NSLog(@"_countsOfEmotionClick = %d",_countsOfEmotionClick);
      [self updateFingerTouchedActions];
    }
  }
}

#pragma mark -Finger Touch methods

- (void)updateFingerTouchedActions {
  if (1 == _countsOfEmotionClick) {
    [self fingerTouchOneActions];
  } else if (2 == _countsOfEmotionClick)
    [self fingerTouchTwoActions];
  else if (3 == _countsOfEmotionClick)
    [self fingerTouchThreeActions];
  else if (4 == _countsOfEmotionClick)
    [self fingerTouchFourActions];
  else if (5 == _countsOfEmotionClick)
    [self fingerTouchFiveActions];
  else if (6 == _countsOfEmotionClick)
    [self fingerTouchSixActions];
  else if (7 == _countsOfEmotionClick)
    [self fingerTouchSevenActions];
}

- (void)fingerTouchOneActions {
  SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.10],[SKAction runBlock:^{
    [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
  }]]];
  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *move = [SKAction moveToY:CGRectGetMidY(self.frame) * 0.9 duration:1.6];
  SKAction *stopAction = [SKAction runBlock:^{
    [_soundPlayer stopSound];
    [_cornInhabitantSprite removeAllActions];
    [_potatoInhabitantSprite removeAllActions];
  }];
  SKAction *unionAction = [SKAction sequence:@[move,chaneFingerTouchAbleAction,stopAction]];
  
  [_cornInhabitantSprite runAction:[SKAction group:@[soundAction,unionAction,[SKAction cornSpriteWalks]]]];
  [_potatoInhabitantSprite runAction:[SKAction group:@[unionAction,[SKAction potatoSpriteWalks]]]];

}

- (void)fingerTouchTwoActions {

  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *soundAction = [SKAction runBlock:^{[_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Fear];}];
  
  SKAction *cucumberJoinAction = [SKAction cucumberJion];
  SKAction *cornFearAction =[SKAction repeatAction:[SKAction scareAnimationWithInhabitantType:VeggieCorn] count:5] ;
  
  _cornInhabitantSprite.xScale = _cornInhabitantSprite.yScale = 1;
  _cucumberInhabitantSprite.xScale = _cucumberInhabitantSprite.yScale = 0.6;
  [_cucumberInhabitantSprite runAction:cucumberJoinAction];
  [_cornInhabitantSprite runAction:[SKAction group:@[soundAction,cornFearAction]]];
  
  
  [self addPotatoSpriteInName:@"Nobi_fear" position:CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 0.9)];
  SKAction *potatoFearAction = [SKAction repeatAction:[SKAction scareAnimationWithInhabitantType:VeggiePotato] count:5];
  [_potatoInhabitantSprite runAction:potatoFearAction completion:^{
  [self addPotatoSpriteInName:@"balloon_fly_away" position:CGPointMake(CGRectGetMidX(self.frame) * 0.92,CGRectGetMidY(self.frame) * 0.8)];
    SKAction *ballFlyoutAction = [SKAction potatoBallFlyOut];
    [_potatoInhabitantSprite runAction:[SKAction group:@[ballFlyoutAction,chaneFingerTouchAbleAction]]];

    SKSpriteNode *balloon = [SKSpriteNode spriteNodeWithImageNamed:@"qiqiu"];
    balloon.position = CGPointMake(CGRectGetMidX(self.frame) * 1.2,CGRectGetMidY(self.frame) * 0.9);
    balloon.xScale = balloon.yScale = 1;
    [self addChild:balloon];
    SKAction *action0 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.2, CGRectGetMidY(self.frame) * 1.) duration:0.32];
    SKAction *action1 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.24, CGRectGetMidY(self.frame) * 1.24) duration:0.24];
    SKAction *action2 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.32, CGRectGetMidY(self.frame)* 1.35) duration:0.25];
    SKAction *action3 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.42, CGRectGetMidY(self.frame)* 1.56) duration:0.12];
    SKAction *action4 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.62, CGRectGetMidY(self.frame)* 1.7) duration:0.62];
    SKAction *action5 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.82, CGRectGetMidY(self.frame)* 1.8) duration:0.12];
    [balloon runAction:[SKAction sequence:@[action0,action1,action2,action3,action4,action5]]];
  }];
}

- (void)fingerTouchThreeActions {
  [self addPotatoSpriteInName:@"Nobi_happy_one" position:CGPointMake(CGRectGetMidX(self.frame) * 0.93,CGRectGetMidY(self.frame) * 0.8)];
  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *soundAction = [SKAction runBlock:^{[_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Surprise];}];
  SKAction *potatoHappyAction = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggiePotato] count:5];
  [_potatoInhabitantSprite runAction:[SKAction sequence:@[potatoHappyAction,chaneFingerTouchAbleAction]]];
  
  SKAction *cornHappyAction = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggieCorn] count:5] ;
  [_cornInhabitantSprite runAction:[SKAction group:@[soundAction,cornHappyAction]]];
}

- (void)fingerTouchFourActions {
  SKAction *hide = [SKAction fadeAlphaTo:0 duration:0.5];
  SKAction *hideOtherTwoSprites = [SKAction runBlock:^{
    _backgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.2);
    _cornInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * .2,CGRectGetMidY(self.frame) * 0.9);
    _cucumberInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) *1.8,CGRectGetMidY(self.frame) * 1);
    [self addPotatoSpriteInName:@"Nobi_lost_one" position:CGPointMake(CGRectGetMidX(self.frame) * 0.9,CGRectGetMidY(self.frame) * 1.3)];
    _wallowSprite.hidden = NO;
  }];
  SKAction *show = [SKAction fadeAlphaTo:1 duration:.25];
  [self runAction:[SKAction sequence:@[hide,hideOtherTwoSprites,show]] completion:^{
    SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.10],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Sanness];
    }]]];
    SKAction *wait = [SKAction waitForDuration:0.2];
    SKAction *getLostAction = [SKAction potatoGetLost];
    SKAction *potatoCryAction = [SKAction group:@[soundAction,[SKAction repeatAction:[SKAction sadAnimationWithInhabitantType:VeggiePotato] count:3]]] ;
    [_potatoInhabitantSprite runAction:[SKAction sequence:@[wait,getLostAction]] completion:^{
      [self addPotatoSpriteInName:@"Nobi_cry_one" position:CGPointMake(CGRectGetMidX(self.frame) * 0.73,CGRectGetMidY(self.frame) * 1.16)];
      [_potatoInhabitantSprite runAction:[SKAction sequence:@[potatoCryAction,chaneFingerTouchAbleAction]]];
    }];
  }];
}

- (void)fingerTouchFiveActions {
  [self addPotatoSpriteInName:@"Nobi_run_one" position:CGPointMake(CGRectGetMidX(self.frame) * 0.73,CGRectGetMidY(self.frame) * 1.16)];

  SKAction *chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *soundAction =  [SKAction runBlock:^{
    [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Disgust];
  }];

  SKAction *running = [SKAction repeatAction:[SKAction potatoBeginRunning] count:2];
  SKAction *moveTo = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 0.9) duration:1.6];
  
  SKAction *unionAction = [SKAction group:@[running,moveTo]];
  [_potatoInhabitantSprite runAction:unionAction completion:^{
    [self addPotatoSpriteInName:@"nibi_fall_one" position:CGPointMake(CGRectGetMidX(self.frame) ,CGRectGetMidY(self.frame) * 0.85)];
    SKAction *fallIntoGround = [SKAction potatoFallIntoGround];
    [_potatoInhabitantSprite runAction:fallIntoGround completion:^{
      SKAction *potatoDisgust = [SKAction group:@[[SKAction disgustAnimationWithInhabitantType:VeggiePotato],soundAction]];
      [_potatoInhabitantSprite runAction:[SKAction sequence:@[potatoDisgust,chaneFingerTouchAbleAction]]];
    }];
  }];

}

- (void)fingerTouchSixActions {
  SKAction *chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *cornScale =  [SKAction runBlock:^{
    _cornInhabitantSprite.xScale = 1.8;
    _cornInhabitantSprite.yScale = 1.3;
  }];
  SKAction *cornPosition =  [SKAction runBlock:^{
    _cornInhabitantSprite.xScale = _cornInhabitantSprite.yScale = 1;
    _cornInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * .62,CGRectGetMidY(self.frame) * 1.0);
  }];
  SKAction *cornFindPotato = [SKAction cornFindPotato];
  SKAction *cornTicklePotato = [SKAction group:@[[SKAction repeatAction:[SKAction cornTicklePotato] count:5],cornPosition]];
  SKAction *cornMoveTo = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * .35,CGRectGetMidY(self.frame) * 1.1) duration:0.6];
  SKAction *cornUnionAction = [SKAction group:@[cornFindPotato,cornScale,cornMoveTo]];
  
  SKAction *cucumberMoveTo = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.4,CGRectGetMidY(self.frame) * 1.1) duration:0.6];
  SKAction *cucumberFindPotato = [SKAction group:@[[SKAction cucumberFindPotato],cucumberMoveTo]];
  SKAction *cucumberScale =  [SKAction runBlock:^{
    _cucumberInhabitantSprite.xScale = _cucumberInhabitantSprite.yScale = 0.5;
    _cucumberInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * 1.3,CGRectGetMidY(self.frame) * 1);
  }];
  SKAction *cucumberTicklePotato = [SKAction group:@[[SKAction repeatAction:[SKAction cucumberTicklePotato] count:5],cucumberScale]] ;

  _cucumberInhabitantSprite.xScale = 0.8;
  _cucumberInhabitantSprite.yScale = 0.75;

  _cornInhabitantSprite.hidden = NO;
  _cucumberInhabitantSprite.hidden = NO;
  
  [_cornInhabitantSprite runAction:[SKAction sequence:@[cornUnionAction,cornTicklePotato,chaneFingerTouchAbleAction]]];
  [_cucumberInhabitantSprite runAction:[SKAction sequence:@[cucumberFindPotato,cucumberTicklePotato]]];
  
  [_potatoInhabitantSprite runAction:[SKAction waitForDuration:0.5] completion:^{
    [self addPotatoSpriteInName:@"Nobi_happy_one" position:CGPointMake(CGRectGetMidX(self.frame) ,CGRectGetMidY(self.frame) * 0.9)];
    SKAction *soundAction = [SKAction runBlock:^{[_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Surprise]; }];
    SKAction *potatoHappy = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggiePotato] count:5];
    [_potatoInhabitantSprite runAction:[SKAction group:@[soundAction,potatoHappy]]];
  }];

}

- (void)fingerTouchSevenActions {
  SKAction *hide = [SKAction fadeAlphaTo:0 duration:0.5];
  SKAction *removeAll = [SKAction runBlock:^{
    [self removeAllChildren];
  }];
  SKAction *show = [SKAction fadeAlphaTo:1 duration:.25];
  [self runAction:[SKAction sequence:@[hide,removeAll,show]] completion:^{
    [self configBackgroundImage];
    [self configBackButtonItem];
    [self configView];
  }];
}



- (void)addPotatoSpriteInName:(NSString *)spriteName position:(CGPoint)point{
  [_potatoInhabitantSprite removeFromParent];
  UIImage *spriteImage = [UIImage imageNamed:spriteName];
  _potatoInhabitantSprite = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:spriteImage] size:CGSizeMake(spriteImage.size.width, spriteImage.size.height)];
  _potatoInhabitantSprite.position = point;
  [self addChild:_potatoInhabitantSprite];
}

- (float)getImageScale:(UIImage *)image {
  return image.size.height /image.size.width;
}

@end
