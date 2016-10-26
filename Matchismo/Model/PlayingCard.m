//
//  PlayingCard.m
//  Matchismo
//
//  Created by Dalida Martinez on 9/26/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    NSLog(@"matchScoreInitializedInCard: %d", score);

    
    if ([otherCards count] == 1) {
        
        NSLog(@"#cardsToScore: %lu", (unsigned long)[otherCards count]+1);

        id card = [otherCards firstObject];
        
        if ([card isKindOfClass:[PlayingCard class]]) {
            
            NSLog(@"typeOfCardsToScore: %@", [card class]);
            
            PlayingCard *otherCard = [otherCards lastObject]; //first and last card are the same object
            if(otherCard.rank == self.rank){
                score  = 4;
                
            } else if ([otherCard.suit isEqualToString:self.suit]){
                score = 1;
            }
        }
        
        NSLog(@"matchScoreInCard: %d", score);

        
        
    }else if ([otherCards count] == 2){
        
        NSLog(@"#cardsToScore: %lu", (unsigned long)[otherCards count]+1);

        id card1 = [otherCards objectAtIndex:0];
        id card2 = [otherCards objectAtIndex:1];
        if ([card1 isKindOfClass:[PlayingCard class]] && [card2 isKindOfClass:[PlayingCard class]]){
            PlayingCard *otherCard1 = [otherCards objectAtIndex:0];
            PlayingCard *otherCard2 = [otherCards objectAtIndex:1];

            //if only one card matches the current card
            if(otherCard1.rank == self.rank ||
               otherCard1.rank == otherCard2.rank ||
               otherCard2.rank == self.rank
               ){
                score = 4;
            }else if ([otherCard1.suit isEqualToString:self.suit] ||
                      [otherCard2.suit isEqualToString:self.suit] ||
                      [otherCard1.suit isEqualToString:otherCard2.suit]){
                score = 1;
            }
            
            //if both cards match
            if(otherCard2.rank == self.rank && otherCard2.rank == self.rank ){
                score = 10;
            }else if([otherCard1.suit isEqualToString:self.suit] && [otherCard2.suit isEqualToString:self.suit]){
                score = 4;
            }
            
            NSLog(@"matchScoreInCard: %d", score);

        }
        
    }else{
        NSLog(@"#cardsToScore: %lu", (unsigned long)[otherCards count]+1);
    }
    return score;
}

- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; //because we provide getter and setter
+ (NSArray *) validSuits
{
    return @[@"♥️", @"♦️", @"♠️", @"♣️"];
}


- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        
        _suit = suit;
    }
}


- (NSString *) suit {
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings {
    return @ [@"?", @"A",  @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K" ];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] -1;
}

- (void)setRank:(NSUInteger) rank
{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}




@end


