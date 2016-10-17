//
//  ViewController.m
//  Matchismo
//
//  Created by Dalida Martinez on 9/26/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "CardMatchingGame.h"


@interface ViewController ()
@property (nonatomic) int flipCount;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *matchTypeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *matchType;
@property (weak, nonatomic) IBOutlet UITextField *historyLabel;



@end

@implementation ViewController


- (IBAction)matchSwitchPressed:(id)sender {
    
        if(_matchType.on){
            
            self.matchTypeLabel.text = [NSString stringWithFormat:@"Match Type: 3-card"];
            
            self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]
                                                      withMatchType:@"3"];
            
            
        }
        
        else{
            self.matchTypeLabel.text = [NSString stringWithFormat:@"Match Type: 2-card"];
            
            self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                              usingDeck:[self createDeck]
                                          withMatchType:@"2"];

            
        }
    }



- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]
                                                          withMatchType:@"2"];
    return _game;
}



//abstract method
- (Deck *)createDeck
{
    return nil;
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    self.matchType.enabled = NO;

    [self updateUI];
}


- (void)updateUI {
    
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %lu", self.game.score];
       self.historyLabel.text =[NSString stringWithFormat:@"%@", self.game.history];
    }
}

       
   






- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
    
}


- (UIImage *)backgroundImageForCard:(Card *) card {
        return [UIImage imageNamed:card.isChosen ? @"cardfront" :@"cardback"];
    
}

- (IBAction)reDeal:(UIButton *)sender {
    self.game = nil;
    self.matchType.enabled = YES;
    [self.matchType setOn:NO];

   // self.scoreLabel.text =
    [self updateUI];
    self.historyLabel.text = [NSString stringWithFormat:@"Welcome!"];

}

@end
