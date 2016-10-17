//
//  SetCard.h
//  Matchismo
//
//  Created by Dalida Martinez on 10/16/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger number;
@property (nonatomic) NSAttributedString* character;
@property (nonatomic) NSString* shading;
@property (nonatomic) NSString* color;

+ (NSUInteger) maxNumber;
+ (NSArray *) validCharacter;
+ (NSArray *) validShading;
+ (NSArray *) validColor;



@end
