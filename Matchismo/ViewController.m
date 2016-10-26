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
#import "HistoryViewController.h"


@interface ViewController ()
@property (nonatomic) int flipCount;
@property (nonatomic, strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *matchTypeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *matchType;
@property (weak, nonatomic) IBOutlet UITextField *historyLabel;
@property (strong, nonatomic) NSMutableArray *statusHistory;
@property (strong, nonatomic) Card *chosenCard;




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
                                                      withMatchType:@"3"];
    return _game;
}


- (NSMutableArray *)statusHistory
{
    if (!_statusHistory) _statusHistory = [[NSMutableArray alloc] init];
    return _statusHistory;
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
    [self.statusHistory addObject:self.historyLabel.attributedText];

    [self updateUI];
}


- (void)updateUI {
    
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setAttributedTitle:[self attributedStringForCard:card]
                              forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
        self.historyLabel.text =[NSString stringWithFormat:@"%@", self.game.history];
       /* [self.historyLabel setAttributedText: [self historyOfGame:self.chosenCard
                                                      cardsChosen:self.game.cardsToMatch
                                                     currentScore:self.game.scoreForHistory]];
        */
        
    }
}







/*
- (NSMutableAttributedString *) historyOfGame: (Card *) cardPicked
                          cardsChosen : (NSArray  *) allCardsPicked
                          currentScore: (NSInteger) currentScore
{
    NSMutableAttributedString *gameHistory = [[NSMutableAttributedString alloc ]init];
    
    if(cardPicked.isChosen){
        
        [gameHistory appendAttributedString:[[NSMutableAttributedString alloc]initWithString:@"Chosing "]];
        [gameHistory appendAttributedString:[self statusForCard:cardPicked]];

        if (currentScore < 0){
            int i = 0;
            for (Card *card in allCardsPicked){
                i++;
                [gameHistory appendAttributedString:[self attributedStringForCard:card]];
                if (i != [allCardsPicked count]){
                    [gameHistory appendAttributedString:[[NSAttributedString alloc]initWithString:@" and "]];
                }
            }
            
            [gameHistory appendAttributedString : [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Mismatch penalty! Total Score: %ld points",(long)currentScore]]];

             }else if (currentScore > 0){
                 int i = 0;
                 for (Card *card in allCardsPicked){
                     i++;
                     [gameHistory appendAttributedString:[self attributedStringForCard:card]];
                     if (i != [allCardsPicked count]){
                         [gameHistory appendAttributedString:[[NSAttributedString alloc]initWithString:@" and "]];
                     }
                 }
                 
                 [gameHistory appendAttributedString : [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Matched! Total Score: %ld points", currentScore]]];
                 
    
             }
    }
    
    return gameHistory;
}

*/


- (NSAttributedString *)attributedStringForCard:(Card *)card {
    return [[NSAttributedString alloc] initWithString:[self titleForCard:card]
                                           attributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
}


- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"?";
    
    
}
- (NSAttributedString *)statusForCard:(Card *)card  
{
    return nil;
}


- (UIImage *)backgroundImageForCard:(Card *) card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" :@"cardback"];
    
}

- (IBAction)reDeal:(UIButton *)sender {
    self.game = nil;
    self.matchType.enabled = YES;
    [self.matchType setOn:NO];
    
    self.scoreLabel.text = 0;
    [self updateUI];
    self.historyLabel.text = [NSString stringWithFormat:@"Welcome!"];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"History"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *cardGameHistoryVC = (HistoryViewController*)segue.destinationViewController;
            cardGameHistoryVC.statusHistory = self.statusHistory;
        }
    }
}

@end
