//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Dalida Martinez on 10/16/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck
- (instancetype) init
{
    self = [super init];
    
    if (self) {
        for (NSNumber *number in [SetCard validNumbers]) {
            for (NSString  *character in [SetCard validCharacter]){
                for (NSString *color in [SetCard validColor]) {
                    for (NSString *shading in [SetCard validShading]) {
                        SetCard* card = [[SetCard alloc ]init];
                        card.number = number;
                        card.character = character;
                        card.color = color;
                        card.shading = shading;
                        
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
        
    }
    return self;
    
}

@end
