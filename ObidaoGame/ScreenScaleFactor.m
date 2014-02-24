//
//  ScreenScaleFactor.m
//  Obidao
//
//  Created by work on 6/21/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import "ScreenScaleFactor.h"
#import "Defaults.h"
@implementation ScreenScaleFactor

+ (float)screenScaleFactorForDevices:(VeggieType)veggieType{
    switch (veggieType) {
      case VeggieCorn:
      case VeggieCarot:
      case VeggieEggplant:
      case VeggieCucumber:
        return  [self scaleFactorForLong];
      case VeggieOnion:
      case VeggieTomato:
      case VeggiePotato:
      case VeggieRadish:
        return [self scaleFactorForShort];
      default: return [self scaleFactorForBackground];
    }
  return 1;
}

+ (float)scaleFactorForShort {
  if (IS_IPID) {
      return 0.85 * 2;
  }
//  else if (IS_IPHONE5) {
//    return 0.554688 *2;
//  }
  return 0.4167;
}

+ (float)scaleFactorForLong {
  if (IS_IPID) {
    return 0.85 *2;
  }
//  else if (IS_IPHONE5) {
//    return 0.554688 *2;
//  }
  return 0.4167;
}

+ (float)scaleFactorForBackground {
  if (IS_IPID) {
    return 2;
  }
//  else if (IS_IPHONE5) {
//    return 0.554688*2;
//  }
  return 0.8333333;
}

@end
