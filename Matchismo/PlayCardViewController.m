//
//  PlayCardViewController.m
//  Matchismo
//
//  Created by Dalida Martinez on 10/16/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "PlayCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayCardViewController ()

@end

@implementation PlayCardViewController

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

@end
