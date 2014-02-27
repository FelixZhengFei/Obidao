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
}

- (void)backToObidaoIsland {
  [self removeAllActions];
  SKScene * myScene = [[IslandMapScene alloc] initWithSize:self.size];
  myScene.scaleMode = SKSceneScaleModeAspectFill;
  [self.view presentScene:myScene];
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
  _cornInhabitantSprite.xScale = _cornInhabitantSprite.yScale = 0.8;
  [self addChild:_cornInhabitantSprite];
  
  _potatoInhabitantSprite = [self createEmotionSprite:VeggiePotato];
  _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.1);
  _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 0.8;
  [self addChild:_potatoInhabitantSprite];
  
  _cucumberInhabitantSprite = [self createEmotionSprite:VeggieCucumber];
  _cucumberInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) *1.6,CGRectGetMidY(self.frame) * 0.8);
  _cucumberInhabitantSprite.xScale = _cucumberInhabitantSprite.yScale = 1;
  [self addChild:_cucumberInhabitantSprite];
}

- (SKSpriteNode *)createEmotionSprite:(VeggieType)veggieType {
  SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:[ImageNameString getNetuarlImageName:veggieType]] ;
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
  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *move = [SKAction moveToY:CGRectGetMidY(self.frame) * 0.85 duration:4];
  SKAction *unionAction = [SKAction sequence:@[move,chaneFingerTouchAbleAction]];
  [_cornInhabitantSprite runAction:[SKAction group:@[unionAction,[SKAction cornSpriteWalks]]]];
  [_potatoInhabitantSprite runAction:[SKAction group:@[unionAction,[SKAction potatoSpriteWalks]]]];
}

- (void)fingerTouchTwoActions {
  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *cucumberJoinAction = [SKAction cucumberJion];
//  SKAction *ballFlyoutAction = [SKAction potatoBallFlyOut];
  SKAction *cornFearAction =[SKAction repeatAction:[SKAction scareAnimationWithInhabitantType:VeggieCorn] count:5] ;
  SKAction *potatoFearAction = [SKAction repeatAction:[SKAction scareAnimationWithInhabitantType:VeggiePotato] count:5];
  [_cucumberInhabitantSprite runAction:cucumberJoinAction];
  [_cornInhabitantSprite runAction:cornFearAction];
  [_potatoInhabitantSprite runAction:[SKAction sequence:@[potatoFearAction,chaneFingerTouchAbleAction]]];
  
  SKSpriteNode *balloon = [SKSpriteNode spriteNodeWithImageNamed:@"qiqiu"];
  balloon.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 0.85);
  balloon.xScale = balloon.yScale = 0.8;
  [self addChild:balloon];
  SKAction *action0 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.2, CGRectGetMidY(self.frame) * 1.) duration:0.32];
  SKAction *action1 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.24, CGRectGetMidY(self.frame) * 1.24) duration:0.24];
  SKAction *action2 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.32, CGRectGetMidY(self.frame)* 1.35) duration:0.25];
  SKAction *action3 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.42, CGRectGetMidY(self.frame)* 1.56) duration:0.12];
  SKAction *action4 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.62, CGRectGetMidY(self.frame)* 1.7) duration:0.62];
  SKAction *action5 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * 1.82, CGRectGetMidY(self.frame)* 1.8) duration:0.12];
  [balloon runAction:[SKAction sequence:@[action0,action1,action2,action3,action4,action5]]];
}

- (void)fingerTouchThreeActions {
  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *cornHappyAction = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggieCorn] count:5] ;
  SKAction *potatoHappyAction = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggiePotato] count:5];
  [_cornInhabitantSprite runAction:cornHappyAction];
  [_potatoInhabitantSprite runAction:[SKAction sequence:@[potatoHappyAction,chaneFingerTouchAbleAction]]];
}

- (void)fingerTouchFourActions {
  SKAction *hide = [SKAction fadeAlphaTo:0 duration:0.5];
  SKAction *hideOtherTwoSprites = [SKAction runBlock:^{
//    _cornInhabitantSprite.hidden = YES;
//    _cucumberInhabitantSprite.hidden = YES;
    _backgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.2);
    _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.3);
    _cornInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * .2,CGRectGetMidY(self.frame) * 0.8);
    _cucumberInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) *1.8,CGRectGetMidY(self.frame) * 1);
    _wallowSprite.hidden = NO;
  }];
  SKAction *show = [SKAction fadeAlphaTo:1 duration:.25];
  [self runAction:[SKAction sequence:@[hide,hideOtherTwoSprites,show]] completion:^{
    _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 1;
    SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
    SKAction *getLostAction = [SKAction potatoGetLost];
    SKAction *potatoCryAction = [SKAction repeatAction:[SKAction sadAnimationWithInhabitantType:VeggiePotato] count:3];
    [_potatoInhabitantSprite runAction:[SKAction sequence:@[getLostAction,potatoCryAction,chaneFingerTouchAbleAction]]];
  }];
}

- (void)fingerTouchFiveActions {
  SKAction *chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *running = [SKAction repeatAction:[SKAction potatoBeginRunning] count:3];
  SKAction *moveTo = [SKAction moveToY:CGRectGetMidY(self.frame) * 0.9 duration:2];
  SKAction *unionAction = [SKAction group:@[running,moveTo]];
  SKAction *fallIntoGround = [SKAction potatoFallIntoGround];
  SKAction *potatoDisgust = [SKAction disgustAnimationWithInhabitantType:VeggiePotato];
  [_potatoInhabitantSprite runAction:[SKAction sequence:@[unionAction,fallIntoGround,potatoDisgust,chaneFingerTouchAbleAction]]];
}

- (void)fingerTouchSixActions {
  SKAction *chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *cornFindPotato = [SKAction cornFindPotato];
  SKAction *cornTicklePotato = [SKAction repeatAction:[SKAction cornTicklePotato] count:5];
  SKAction *cornMoveTo = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) * .7,CGRectGetMidY(self.frame) * 1) duration:0.6];
  SKAction *cornUnionAction = [SKAction group:@[cornFindPotato,cornMoveTo]];
  
  SKAction *cucumberFindPotato = [SKAction cucumberFindPotato];
  SKAction *cucumberTicklePotato = [SKAction repeatAction:[SKAction cucumberTicklePotato] count:5] ;
  SKAction *cucumberMoveTo = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) *1.3,CGRectGetMidY(self.frame) * 1) duration:0.6];
  SKAction *cucumberUnionAction = [SKAction group:@[cucumberMoveTo,cucumberFindPotato]];
  _cornInhabitantSprite.hidden = NO;
  _cucumberInhabitantSprite.hidden = NO;
  
//  _cornInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * .8,CGRectGetMidY(self.frame) * 0.9);
//  _cucumberInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) *1.3,CGRectGetMidY(self.frame) * 0.9);

  [_cucumberInhabitantSprite runAction:[SKAction sequence:@[cucumberUnionAction,cucumberTicklePotato]]];
  [_cornInhabitantSprite runAction:[SKAction sequence:@[cornUnionAction,cornTicklePotato,chaneFingerTouchAbleAction]]];
  [_potatoInhabitantSprite runAction:[SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:VeggiePotato] count:5]];
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
