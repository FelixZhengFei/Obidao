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
  
  _potatoInhabitantSprite = [self createEmotionSprite:VeggiePotato];
  _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.1);
  _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 0.5;
  [self addChild:_potatoInhabitantSprite];
  
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
  SKAction *potatoFearAction = [SKAction repeatAction:[SKAction scareAnimationWithInhabitantType:VeggiePotato] count:5];
  SKAction *ballFlyoutAction = [SKAction potatoBallFlyOut];
  SKAction *cornFearAction =[SKAction repeatAction:[SKAction scareAnimationWithInhabitantType:VeggieCorn] count:5] ;
  
  _cornInhabitantSprite.xScale = _cornInhabitantSprite.yScale = 1;
  _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 1;
  _cucumberInhabitantSprite.xScale = _cucumberInhabitantSprite.yScale = 0.6;
  
  [_cucumberInhabitantSprite runAction:cucumberJoinAction];
  
  [_cornInhabitantSprite runAction:[SKAction group:@[soundAction,cornFearAction]]];
  [_potatoInhabitantSprite runAction:potatoFearAction completion:^{
  SKAction *potatoPosition = [SKAction runBlock:^{
    _potatoInhabitantSprite.xScale = 0.75;
    _potatoInhabitantSprite.yScale = 0.75;
    _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * 0.95,CGRectGetMidY(self.frame) * 0.82);
  }];
    [_potatoInhabitantSprite runAction:[SKAction group:@[ballFlyoutAction,potatoPosition,chaneFingerTouchAbleAction]]];

    SKSpriteNode *balloon = [SKSpriteNode spriteNodeWithImageNamed:@"qiqiu"];
    balloon.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 0.85);
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
  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *soundAction = [SKAction runBlock:^{[_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Surprise];}];

  SKAction *cornHappyAction = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggieCorn] count:5] ;
  SKAction *potatoHappyAction = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggiePotato] count:5];
  _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 0.8);
  _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 1.0;

  [_cornInhabitantSprite runAction:[SKAction group:@[soundAction,cornHappyAction]]];
  [_potatoInhabitantSprite runAction:[SKAction sequence:@[potatoHappyAction,chaneFingerTouchAbleAction]]];
}

- (void)fingerTouchFourActions {
  SKAction *hide = [SKAction fadeAlphaTo:0 duration:0.5];
  SKAction *hideOtherTwoSprites = [SKAction runBlock:^{
    _backgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.2);
    _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * 0.9,CGRectGetMidY(self.frame) * 1.2);
    _cornInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * .2,CGRectGetMidY(self.frame) * 0.9);
    _cucumberInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) *1.8,CGRectGetMidY(self.frame) * 1);
    _wallowSprite.hidden = NO;
  }];
  SKAction *show = [SKAction fadeAlphaTo:1 duration:.25];
  [self runAction:[SKAction sequence:@[hide,hideOtherTwoSprites,show]] completion:^{
    SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.10],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Sanness];
    }]]];
    SKAction *potatoPositionOne = [SKAction runBlock:^{
      _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) *1.1,CGRectGetMidY(self.frame) * 1.3);
      _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 1.5;
    }];
    SKAction *getLostAction = [SKAction group:@[[SKAction potatoGetLost],potatoPositionOne]];

    SKAction *potatoScale =  [SKAction runBlock:^{
      _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * 0.9,CGRectGetMidY(self.frame) * 1.2);
      _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 0.9;
    }];
    SKAction *potatoCryAction = [SKAction group:@[potatoScale,soundAction,[SKAction repeatAction:[SKAction sadAnimationWithInhabitantType:VeggiePotato] count:3]]] ;
    [_potatoInhabitantSprite runAction:[SKAction sequence:@[getLostAction,potatoCryAction,chaneFingerTouchAbleAction]]];
  }];
}

- (void)fingerTouchFiveActions {
  SKAction *chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *potatoScaleOne =  [SKAction runBlock:^{ _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 1.5;}];
  SKAction *potatoScaleTwo =  [SKAction runBlock:^{
    _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 0.9;
    [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Disgust];
  }];
  _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 1.2;

  SKAction *running = [SKAction potatoBeginRunning];
  SKAction *moveTo = [SKAction moveToY:CGRectGetMidY(self.frame) * 0.9 duration:1];

  SKAction *unionAction = [SKAction group:@[running,moveTo]];
  SKAction *fallIntoGround = [SKAction group:@[[SKAction potatoFallIntoGround],potatoScaleOne]];

  SKAction *potatoDisgust = [SKAction group:@[[SKAction disgustAnimationWithInhabitantType:VeggiePotato],potatoScaleTwo]];
  [_potatoInhabitantSprite runAction:[SKAction sequence:@[unionAction,fallIntoGround,potatoDisgust,chaneFingerTouchAbleAction]]];
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
  
  SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.30],[SKAction runBlock:^{
    [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Surprise];
  }]]];
  SKAction *potatoHappy = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggiePotato] count:5];
  [_potatoInhabitantSprite runAction:[SKAction group:@[soundAction,potatoHappy]]];

  [_cornInhabitantSprite runAction:[SKAction sequence:@[cornUnionAction,cornTicklePotato,chaneFingerTouchAbleAction]]];
  [_cucumberInhabitantSprite runAction:[SKAction sequence:@[cucumberFindPotato,cucumberTicklePotato]]];
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

@end
