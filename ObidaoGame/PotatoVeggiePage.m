//
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
  SKSpriteNode *_potatoInhabitantSprite;
  SKSpriteNode *_cornInhabitantSprite;
  SKSpriteNode *_cucumberInhabitantSprite;
}

@end

@implementation PotatoVeggiePage

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self configBackgroundImage];
    [self addTreeSprites];
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
  self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
  SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:[ImageNameString getBackgroundImageName:VeggiePotato]];
  background.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
  background.xScale = background.yScale = 0.4;
  [self addChild:background];
}

- (void)addTreeSprites {
  SKSpriteNode *tree1 = [SKSpriteNode spriteNodeWithImageNamed:@"tree1"];
  tree1.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.5);
  tree1.xScale = tree1.yScale = 0.4;
  [self addChild:tree1];
  
  SKSpriteNode *tree2 = [SKSpriteNode spriteNodeWithImageNamed:@"tree2"];
  tree2.position = CGPointMake(0,CGRectGetMidY(self.frame));
  tree2.xScale = tree2.yScale = 0.4;
  [self addChild:tree2];
  
  SKSpriteNode *tree3 = [SKSpriteNode spriteNodeWithImageNamed:@"tree3"];
  tree3.position = CGPointMake(CGRectGetMidX(self.frame) * 1.8,CGRectGetMidY(self.frame) * 1.2);
  tree3.xScale = tree3.yScale = 0.4;
  [self addChild:tree3];
}

- (void)initThreeInhabitants {
  _cornInhabitantSprite = [self createEmotionSprite:VeggieCorn];
  _cornInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame) * 0.7,CGRectGetMidY(self.frame) * 1.1);
  _cornInhabitantSprite.xScale = _cornInhabitantSprite.yScale = 1;
  [self addChild:_cornInhabitantSprite];
  
  _potatoInhabitantSprite = [self createEmotionSprite:VeggiePotato];
  _potatoInhabitantSprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1.1);
  _potatoInhabitantSprite.xScale = _potatoInhabitantSprite.yScale = 1;
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
}

- (void)fingerTouchOneActions {
  SKAction * chaneFingerTouchAbleAction = [SKAction runBlock:^{[self changeFingerTouchAble];}];
  SKAction *move = [SKAction moveToY:CGRectGetMidY(self.frame) * 0.85 duration:4];
  SKAction *unionAction = [SKAction sequence:@[move,chaneFingerTouchAbleAction]];
  [_cornInhabitantSprite runAction:[SKAction group:@[unionAction,[SKAction cornSpriteWalks]]]];
  [_potatoInhabitantSprite runAction:[SKAction group:@[unionAction,[SKAction potatoSpriteWalks]]]];
}

- (void)fingerTouchTwoActions {
}

@end
