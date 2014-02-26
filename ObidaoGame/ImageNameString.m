//
//  NSString+ImageName.m
//  Obidao
//
//  Created by work on 6/21/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import "ImageNameString.h"

@implementation ImageNameString

+ (NSString *)getInhabitantImageNameOnIslandMap:(VeggieType)veggieType {
  switch (veggieType) {
    case VeggieCorn:
      return @"corn_happy_ipadhd.png";
    case VeggieCarot:
      return @"carot_happy_ipadhd.png";
    case VeggieOnion:
      return @"onion_happy_ipadhd.png";
    case VeggieTomato:
      return @"tomato_happy_ipadhd.png";
    case VeggiePotato:
      return @"potato_happy_ipadhd.png";
    case VeggieRadish:
      return @"radish_happy_ipadhd.png";
    case VeggieCucumber:
      return @"cucumber_happy_ipadhd.png";
    case VeggieEggplant:
      return @"eggplant_happy_ipadhd.png";
    default:
      return nil;
  }
  return  nil;
}

+ (NSString *)getNetuarlImageName:(VeggieType)veggieType {
  switch (veggieType) {
    case VeggieCorn:
      return @"corn_netuarl.png";
    case VeggieCarot:
      return @"carrot_neutral.png";
    case VeggieOnion:
      return @"foxy_neutral.png";
    case VeggieTomato:
      return @"tomato_neutral.png";
    case VeggiePotato:
      return @"potato_netuarl.png";
    case VeggieRadish:
      return @"radish_netuarl.png";
    case VeggieCucumber:
      return @"cucumber_netuarl.png";
    case VeggieEggplant:
      return @"eggplant_netuarl.png";
    default:
      return nil;
  }
  return  nil;
}


+ (NSString *)getStringOfImageFileWithImageType:(ImageType)imageType {
  switch (imageType) {
    case Image_Background_Island_Map:
      return @"island_map_ipadhd.png";
    case Image_Background_Emotion_Page:
      return @"bg_Emotion_page_ipadhd.png";
    case Image_Background_Parent_Corner:
      return @"bg_Parent_Corner_ipadhd.png";
    case Image_Button_Parent_Corner:
      return @"button_parent_corner_ipadhd.png";
    case Image_Button_Sound_On:
      return @"music_on_ipadhd.png";
    case Image_Button_Sound_Off:
      return @"music_off_ipadhd.png";
    case Image_Button_Back:
      return @"button_back_ipadhd.png";
    default:
      return nil;
  }
  return nil;
}

+ (NSString *)getBackgroundImageName:(VeggieType)veggieType {
  switch (veggieType) {
    case VeggieCorn:
    case VeggieCarot:
    case VeggieOnion:
    case VeggieTomato:
    case VeggiePotato:
      return @"background_image_potato_ipadhd.png";
    case VeggieCucumber:
    case VeggieEggplant:
      return @"background_image_foxy_ipadhd.png";
    case VeggieRadish:
      return @"background_image_radish_ipadhd.png";
    default:
      return nil;
  }
  return nil;
}

@end
