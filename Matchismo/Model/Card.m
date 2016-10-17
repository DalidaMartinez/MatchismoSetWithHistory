//
//  Card.m
//  Matchismo
//
//  Created by Dalida Martinez on 9/26/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *) otherCards
{
    
    int score = 0;
    
    for (Card *card in otherCards) {
        
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
        
    }
    
    return score;
    
}

@end
