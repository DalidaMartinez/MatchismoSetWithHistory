//
//  SetCard.m
//  Matchismo
//
//  Created by Dalida Martinez on 10/16/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard



@synthesize contents = _contents;


-(NSString *) contents
{
    NSString* nums = @"";
    for (int i = 0; i<self.number.integerValue; i++){
        nums = [nums stringByAppendingString:[self character]];
    }
    return nums;
}




- (NSString *)color {
    return _color ? _color : @"?";
}
- (NSString *)character {
    return _character ? _character : @"?";
}
- (NSString *)shading {
    return _shading ? _shading : @"?";
}

- (NSNumber *)number {
    return _number ? _number : @-1;
}

+ (NSArray *) validCharacter {
    return @[@"▲",@"●", @"◼︎" ];
}


+ (NSArray *) validColor {
    return @[@"red",@"blue", @"green" ];
}


+ (NSArray *) validShading {
    return @[@"fill",@"noFill", @"striped" ];
}

+ (NSArray *)validNumbers {
    return @[@(1), @(2), @(3)];
}
- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    SetCard* otherCard1 = otherCards[0];
    SetCard* otherCard2 = otherCards[1];
    
    NSMutableSet *charSet = [[NSMutableSet alloc] init];
    NSMutableSet *colorSet = [[NSMutableSet alloc] init];
    NSMutableSet *shadingSet = [[NSMutableSet alloc] init];
    NSMutableSet *numberSet = [[NSMutableSet alloc] init];
    
    for (SetCard* myCard in @[self, otherCard1, otherCard2])
    {
        [charSet addObject:myCard.character];
        [numberSet addObject:myCard.number];
        [colorSet addObject:myCard.color];
        [shadingSet addObject:myCard.shading];
    }
    
    
    
    
    
    if (([colorSet count]==1 || ([colorSet count] == 3)) &&
        
        (([shadingSet count]== 1 || [shadingSet count] == 3))&&
        
        (([numberSet count]== 1 || [numberSet count]==3))&&
        
        (([charSet count]== 1 || [charSet count] == 3)))
    {
       
        score = 4;
    }   else {
        score = 0;
    }
    NSLog(@"colorSet: %@", colorSet);
    NSLog(@"shadingSet: %@", shadingSet);
    NSLog(@"numberSet: %@", numberSet);
    NSLog(@"charSet: %@", charSet);
    
    
    NSLog(@"matchScoreInCard: %d", score);
    return score;
    
}





- (BOOL)checkForSimilarObjects:(NSArray *)cardObject {
    NSSet *objectsSet = [NSSet setWithArray:cardObject];
    
    return (objectsSet.count == 1) || (objectsSet.count == 3);
}


@end
