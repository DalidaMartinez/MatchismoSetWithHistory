//
//  SetCard.m
//  Matchismo
//
//  Created by Dalida Martinez on 10/16/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard






-(NSString *) contents
{
    return [NSString stringWithFormat:@"%lu%@%@%@",
            self.number,self.character,self.color,self.shading];
}


@synthesize color = _color;

- (void) setColor:(NSString *)color {
    if ([[SetCard validColor] containsObject:color]) {
        
        _color = color;
    }
}


//@synthesize character = _character;

- (void) setCharacter:(NSString *)character {
    if ([[SetCard validCharacter] containsObject:character]) {
        
        _character = [[NSAttributedString alloc]  initWithString:character];
    }
}


@synthesize shading = _shading;


- (void) setShading:(NSString *)shading
{
    if ([[SetCard validShading] containsObject:shading]) {
        
        _shading = shading;
    }
}


+ (NSArray *) validCharacter {
    return @ [@"▲",@"⬤", @" ◼" ];
}


+ (NSArray *) validColor {
    return @ [@"cyan",@"magenta", @"green" ];
}


+ (NSArray *) validShading {
    return @ [@"fill",@"noFill", @"striped" ];
}

+ (NSUInteger) maxNumber
{
    return 2;
}














@end
