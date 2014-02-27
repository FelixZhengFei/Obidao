//
//  SKAction+Helper.m
//  ObidaoGame
//
//  Created by work on 12/19/13.
//  Copyright (c) 2013 Originate Inc. All rights reserved.
//

#import "SKAction+Helper.h"

@implementation SKAction (Helper)

+ (SKAction *)happyAnimationWithInhabitantType:(VeggieType)veggieType {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  switch (veggieType) {
    case VeggieOnion: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"onion_surprise"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"foxy_swing%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieTomato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"tomato_happy"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"zola_hoappy%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieCarot: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"carrot_happy"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"carrot_happy%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieRadish: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"radish_happy_poor"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"godas_happy%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieEggplant: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"ina_paly_ball"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"ina_paly_ball%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieCorn: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"corn_happy"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"Momo_happy%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggiePotato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_happy"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"Nobi_happy%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    default: {
      return nil;
    }
  }
  return nil;
}

+ (SKAction *)angerAnimationWithInhabitantType:(VeggieType)veggieType {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  switch (veggieType) {
    case VeggieOnion: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"onion_anger"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"foxy_swing_anger%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieTomato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"tomato_anger"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"zola_anger%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieCarot: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"cattot_next_ball"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"carrot_anohter_ballon%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieEggplant: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"ina_anger"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"ina_anger%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    default:
      break;
  }
  return nil;
}

+ (SKAction *)sadAnimationWithInhabitantType:(VeggieType)veggieType {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  switch (veggieType) {
    case VeggieOnion: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"onion_cry"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"foxy_swing_earth%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieTomato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"tomato_cry"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"zola_cry%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieCarot: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"ballon_deceare"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"carrot_ballon_deceare%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieRadish: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"raddish_cry"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"godas_cry%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieEggplant: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"ina_cry"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"ina_cry%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggiePotato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_cry"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"Nobi_cry%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    default:
      return nil;
  }
  return nil;
}

+ (SKAction *)surpriseAnimationWithInhabitantType:(VeggieType)veggieType {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  switch (veggieType) {
    case VeggieTomato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"tomato_surprise"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"zola_jump_surprise%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieCarot: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"carrot_surprise"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"carrot_surprise%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieRadish: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"radish_happy"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"radish_happy_%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieEggplant: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"surprise"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"ina_surprise%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    default:
      return nil;
  }
  return nil;
}

+ (SKAction *)noEmotionAnimationWithInhabitantType:(VeggieType)veggieType {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  switch (veggieType) {
    case VeggieCarot: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"carrot_increase"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"carrot_blowing_balloons%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    default:
      return nil;
  }
  return nil;
}

+ (id)scareAnimationWithInhabitantType:(VeggieType)veggieType {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  switch (veggieType) {
    case VeggieTomato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"tomato_fear"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"zola_fear%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.12 resize:YES restore:NO];
    }
    case VeggieCarot: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"carrot_scare"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"nunno_scared%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggiePotato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_fear"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"Nobi_fear%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggieCorn: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"corn_fear"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"momo_fear%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    default:
      return nil;
  }
  return nil;
}

+ (id)disgustAnimationWithInhabitantType:(VeggieType)veggieType {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  switch (veggieType) {
    case VeggieRadish: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"radish_eat_3"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"godas_eat_3%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
    }
    case VeggiePotato: {
      SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_digust"];
      for (int i = 1; i < atlas.textureNames.count + 1; i++) {
        NSString* texture = [NSString stringWithFormat:@"nobi_disgust%04d",i];
        [walkAnimFrames addObject:[atlas textureNamed:texture]];
      }
      return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.28 resize:YES restore:NO];
    }
    default:
      return nil;
  }
  return nil;
}

+ (id)foxyCryAnimation {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"onion_cry"];
  for (int i = 15; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"foxy_swing_earth%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return [SKAction repeatAction:[SKAction animateWithTextures:walkAnimFrames timePerFrame:0.12 resize:YES restore:NO] count:10];
}

+ (id)carrotPlayBallon:(BOOL)isBlowing {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  if (isBlowing) {
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"ball_kinds"];
    for (int i = 1; i <atlas.textureNames.count + 1; i++) {
      NSString* texture = [NSString stringWithFormat:@"blowing_balloon%d",i];
      [walkAnimFrames addObject:[atlas textureNamed:texture]];
    }
    return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.8 resize:YES restore:NO];
  }
  return nil;
}

+ (SKAction *)radishStartEatSand {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"radish_eat_1"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"godas_eat_1%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.15 resize:YES restore:NO];
}

+ (SKAction *)radishEattingSand {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"radish_eat_2"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"godas_eat_2%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction repeatAction:[SKAction animateWithTextures:walkAnimFrames timePerFrame:0.1 resize:YES restore:NO] count:3];
}

+ (SKAction *)eggplantBallDisappear {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"ina_high"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"ina_high%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
}

+ (SKAction *)eggplantBallHitHead {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"ina_head"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"ina_head%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:YES restore:NO];
}

+ (SKAction *)eggplantBallDown {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"ina_happy_down"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"ina_happy_down%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.1 resize:YES restore:NO];
}

+ (SKAction *)potatoSpriteWalks {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_walk"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"Nobi_walk%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction repeatAction:[SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:NO restore:NO] count:5];
}

+ (SKAction *)cornSpriteWalks {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"corn_walk"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"momo_walk%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction repeatAction:[SKAction animateWithTextures:walkAnimFrames timePerFrame:0.06 resize:NO restore:NO] count:6];
}

+ (SKAction *)cucumberJion {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"cucumber_join"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"cucumber_join%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:NO restore:NO];
}

+ (SKAction *)potatoBallFlyOut {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_fear"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"potato_ball_fly%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.06 resize:NO restore:NO];
}

+ (SKAction *)potatoGetLost {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_lost"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"Nobi_lost%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.16 resize:NO restore:NO];
}

+ (SKAction *)potatoBeginRunning {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_running"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"nobi_run%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:NO restore:NO];
}

+ (SKAction *)potatoFallIntoGround {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"potato_fall_intoground"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"nibo_fall%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.08 resize:NO restore:NO];
}

+ (SKAction *)cornFindPotato {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"corn_found_potato"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"momo_found%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.06 resize:NO restore:NO];
}

+ (SKAction *)cornTicklePotato {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"corn_tickle"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"Momo_Tickle%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.06 resize:NO restore:NO];
}

+ (SKAction *)cucumberFindPotato {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"cucumber_found_potato"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"gogo_found%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.06 resize:NO restore:NO];
}

+ (SKAction *)cucumberTicklePotato {
  NSMutableArray *walkAnimFrames = [NSMutableArray array];
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"cucumber_tickle"];
  for (int i = 1; i < atlas.textureNames.count + 1; i++) {
    NSString* texture = [NSString stringWithFormat:@"Gogo_Tickle%04d",i];
    [walkAnimFrames addObject:[atlas textureNamed:texture]];
  }
  return  [SKAction animateWithTextures:walkAnimFrames timePerFrame:0.06 resize:NO restore:NO];
}

@end
