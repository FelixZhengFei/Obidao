//
//  NSString+ImageName.h
//  Obidao
//
//  Created by work on 6/21/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Inhabitant.h"

typedef enum {
  Image_Background_Island_Map,
  Image_Background_Emotion_Page,
  Image_Background_Parent_Corner,
  Image_Button_Parent_Corner,
  Image_Button_Sound_On,
  Image_Button_Sound_Off,
  Image_Button_Back
} ImageType;

@interface ImageNameString : NSObject

+ (NSString *)getInhabitantImageNameOnIslandMap:(VeggieType)veggieType;
+ (NSString *)getNetuarlImageName:(VeggieType)veggieType;

+ (NSString *)getStringOfImageFileWithImageType:(ImageType)imageType;
+ (NSString *)getBackgroundImageName:(VeggieType)veggieType;
@end
