//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Dalida Martinez on 09/28//16.
//  Copyright © 2016 Dalida. All rights reserved.
//
#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, readwrite) NSString *history;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) NSString *matchtype;
@property (nonatomic, strong) NSMutableArray *cardsToMatch;

@end



@implementation CardMatchingGame


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (NSMutableArray *)cardsToMatch {
    if (!_cardsToMatch) {
        _cardsToMatch = [[NSMutableArray alloc] init];
    }
    return _cardsToMatch;
}

- (Card *) cardAtIndex:(NSUInteger)index {
    if (index < [self.cards count]) {
        return self.cards[index];
    } else {
        return nil;
    }
}


- (void) chooseCardAtIndex:(NSUInteger)index {
    
    Card *card = self.cards[index];
    //NSArray *cardsToMatch;
    
    if(![card isMatched] && [card isChosen]) {
        self.history = [NSString stringWithFormat:@" You have unchosen %@", card.contents ];
        
        card.chosen = NO; //unchoose it
        
    }else {
        
        //NSArray *cardsToMatch = [[NSArray alloc] init]; //stores cards we are going to match with the selected card
        NSLog(@"cardsToMatch %@", self.cardsToMatch);
        
        if ([self.matchtype  isEqual: @"2"]){
             self.history = [NSString stringWithFormat:@" You have chosen %@", card.contents ];
            
            NSLog(@"matchtype: %@", self.matchtype);
            
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    
                    [self.cardsToMatch addObject:otherCard];
                    // adds the single card we want to match to  the cardsToMatch array
                    NSLog(@"cardsToMatch %@", self.cardsToMatch);

                    
                    int matchScore = [card match:self.cardsToMatch];
                    
                    NSLog(@"matchScore: %d", matchScore);
                    
                    
                    if(matchScore) {
                        self.cardsToMatch = nil;//do somn
                        self.score += matchScore * MATCH_BONUS;
                        self.history = [NSString stringWithFormat:@"Matching %@ & %@ for %d points",
                                        card.contents,
                                        otherCard.contents,
                                        MATCH_BONUS * matchScore];
                        otherCard.matched = YES;
                        card.matched = YES;
                        
                    } else {
                        self.cardsToMatch = nil;
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        self.history = [NSString stringWithFormat:@" %@ does not match %@. Penalty of %d points", card.contents, otherCard.contents, MISMATCH_PENALTY ];
                    }
                    break;
                }
            }
            
            
        }else if ([self.matchtype isEqual:@"3"]){
          
            NSLog(@"matchtype: %@", self.matchtype);
            self.history = [NSString stringWithFormat:@" You have chosen %@", card.contents ];
            
            self.cardsToMatch = nil;
            
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    
                    [self.cardsToMatch addObject:otherCard];
                    //add selected card to otherCards
                    NSLog(@"cards: %@", self.cardsToMatch);
                       self.history = [NSString stringWithFormat:@" You have chosen %@ and %@", card.contents,otherCard.contents ];
                    
                    if([self.cardsToMatch count]==2){
                        
                        int matchScore = [card match:self.cardsToMatch];
                        
                        Card *card1 = [self.cardsToMatch objectAtIndex:0]; //because we need to retrieve Card properties but Arrays return id
                        Card *card2 = [self.cardsToMatch objectAtIndex:1];
                        
                        
                        if(matchScore) {
                            self.cardsToMatch = nil;
                            self.score += matchScore * MATCH_BONUS;
                            self.history = [NSString
                                            stringWithFormat:@"Matching %@, %@ & %@ for %d points",
                                            card.contents,
                                            card1.contents,
                                            card2.contents,
                                            MATCH_BONUS * matchScore];
                            
                            card1.matched = YES;
                            card2.matched = YES;
                            card.matched = YES;
                        } else {
                            self.cardsToMatch = nil;
                            self.score -= MISMATCH_PENALTY;
                            card1.chosen = NO;
                            card2.chosen = NO;
                            card.chosen = NO;
                            self.history = [NSString
                                            stringWithFormat:@" %@ does not match %@ nor %@. Penalty of %d points",
                                            card.contents,
                                            card1.contents,
                                            card2.contents,
                                            MISMATCH_PENALTY ];
                        }
                        
                        break;
                    }
                }
                
            }
        }
        
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES; //leave card faceup

    }
}



- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck withMatchType:(NSString *)matchType{ //contructor
    
    self = [super init]; // designated superclass initiliizer
    
    if (self) {
        for ( int i = 0 ; i < count ; i++ ) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.matchtype = matchType;
    }
    
    return self;
}



@end
