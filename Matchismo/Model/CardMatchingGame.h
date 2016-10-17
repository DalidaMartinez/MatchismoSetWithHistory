//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Dalida Martinez on 09/28/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initializer

- (instancetype)initWithCardCount:(NSUInteger) count
                        usingDeck:(Deck *) deck
                    withMatchType:(NSString *)matchType;

- (void)chooseCardAtIndex:(NSUInteger) index;
- (Card *)cardAtIndex:(NSUInteger) index;

//provide an API for CardMatchingGame that allows you to switch matchType property

@property (nonatomic, readonly) NSUInteger score;
@property ( nonatomic, readonly) NSString *history;




@end
