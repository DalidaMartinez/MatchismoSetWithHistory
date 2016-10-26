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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation PlayCardViewController

@synthesize cardButtons = _cardButtons;

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}
- (NSAttributedString *)attributedStringForCard:(Card *)card {
    return [[NSAttributedString alloc] initWithString:[self titleForCard:card]
                                           attributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
    
}


- (UIImage *)backgroundImageForCard:(Card *) card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" :@"cardback"];
    
}
- (NSAttributedString *)statusForCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString:card.contents];
}

@end
