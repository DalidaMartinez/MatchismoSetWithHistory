//
//  SetCard.h
//  Matchismo
//
//  Created by Dalida Martinez on 10/16/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSString* character;
@property (nonatomic) NSString* shading;
@property (nonatomic) NSString* color;
@property (strong, nonatomic) NSNumber *number;

+ (NSArray *) validCharacter;
+ (NSArray *) validShading;
+ (NSArray *) validColor;
+ (NSArray *) validNumbers ;



@end
