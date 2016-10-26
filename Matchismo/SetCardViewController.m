//
//  SetCardViewController.m
//  Matchismo
//
//  Created by Dalida Martinez on 10/16/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "Deck.h"
@interface SetCardViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//+ (NSAttributedString *) attributedTitleForCard:(SetCard *)card;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UITextField *historyLabel;
@end


@implementation SetCardViewController



@synthesize cardButtons = _cardButtons;


-(Deck *) createDeck{
    return [[SetCardDeck alloc]init];
}


-(void)updateUI {

    [super updateUI];
    
    
}



-(void)viewDidLoad{

    [super viewDidLoad];
  
    [super updateUI];
    self.historyLabel.text = [NSString stringWithFormat:@"Welcome!"];

}




/*
 +(NSDictionary *) validColor
 {
 return @ {@"cyan" : [UIColor cyanColor],
 @"magenta" : [UIColor magentaColor],
 @"green" : [UIColor greenColor]};
 
 }
 
 
 
 
 */

/*
 - (NSString *) titleForCard:(SetCard *)card{
 NSMutableString *title = [[NSMutableString alloc] init];
 if ([card isKindOfClass:[SetCard class]]) {
 SetCard *setCard = (SetCard *) card;
 
 for (int i = 0; i < setCard.number.integerValue; ++i) {
 
 [title appendString:[NSString stringWithFormat:@"%@", setCard.character]];
 }
 }
 return card.contents;
 }
 */

-(UIColor *) colorForSetCard:(SetCard *)card {
    UIColor *colorForCard =nil;
    if ([card.color isEqualToString:@"red"]) {
        colorForCard = [UIColor redColor];
    }
    if ([card.color isEqualToString:@"green"]) {
        colorForCard = [UIColor greenColor];
    }
    if ([card.color isEqualToString:@"blue"]) {
        colorForCard = [UIColor blueColor];
    }
    
    return colorForCard ? colorForCard : [UIColor redColor];
}

+(CGFloat) shading:(NSString*) shade
{
    NSDictionary *shades = @{ @"fill" : @1.0, @"noFill" : @0, @"striped" : @0.2};
    
    return [shades[shade] floatValue];
    
}



- (NSAttributedString *)attributedStringForCard:(Card *)card {
    SetCard *setcard = (SetCard *)card;
    NSString *title = [ [NSString alloc] initWithString: [self titleForCard:card]];
    NSMutableAttributedString *newTitle  = [[NSMutableAttributedString alloc] initWithString:title];
    
    UIColor *color = [self colorForSetCard:setcard];
    
    UIColor *foreground = [color copy];
    
    
    
    CGFloat alpha = 0.2;
    foreground = [foreground colorWithAlphaComponent:alpha];
    
    if ([setcard.shading isEqualToString:@"fill"]) {
        foreground = [foreground colorWithAlphaComponent:1.0];
        [newTitle setAttributes:@{NSStrokeColorAttributeName:color,
                                  NSStrokeWidthAttributeName: @"0",
                                  NSForegroundColorAttributeName:foreground}
                          range:NSMakeRange(0, [newTitle length])];
    }
    
    if ([setcard.shading isEqualToString:@"noFill"]) {
        foreground = [foreground colorWithAlphaComponent:0];
        [newTitle setAttributes:@{NSStrokeColorAttributeName:color,
                                  NSStrokeWidthAttributeName: @"5",
                                  NSForegroundColorAttributeName:foreground}
                          range:NSMakeRange(0, [newTitle length])];
    }
    
    if ([setcard.shading isEqualToString:@"striped"]) {
        foreground = [foreground colorWithAlphaComponent:0.2];
        [newTitle setAttributes:@{NSStrokeColorAttributeName:color,
                                  NSStrokeWidthAttributeName: @"-5",
                                  NSForegroundColorAttributeName:foreground}
                          range:NSMakeRange(0, [newTitle length])];
    }
    
    
    return newTitle;
    
}



- (NSString *)titleForCard:(Card *)card {
    NSMutableString *title = [[NSMutableString alloc]init];
    if ([card isKindOfClass:[SetCard class]]){
        SetCard *setCard = (SetCard *) card;
        for (int i = 0; i <setCard.number.integerValue; i++){
            [title appendString:[NSString stringWithFormat:@"%@",setCard.character]];
        }
    }
    return title;
    
    
}


- (UIImage *) backgroundImageForCard: (Card *) card
{
    return [UIImage imageNamed:card.chosen ?
            @"selectedCardFront" : @"cardfront"];
}


- (NSAttributedString *)statusForCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString:card.contents];
}


/*
 
 
 
 
 -(NSAttributedString *) attributedTitleForCard:(Card *)card{
 NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:[self titleForCard:card]];
 SetCard *setCard = (SetCard *) card;
 
 UIColor *cardsColor = [self colorForSetCard:setCard];
 
 
 [title addAttribute:NSForegroundColorAttributeName value:cardsColor
 range:NSMakeRange(0, title.length)];
 
 if ([setCard.shading isEqualToString:@"noFill"]) {
 [title addAttribute:NSStrokeWidthAttributeName value:@5
 range:NSMakeRange(0, title.length)];
 
 if ([setCard.shading isEqualToString:@"striped"]) {
 [title addAttributes:@{NSStrokeWidthAttributeName : @-5,
 NSStrokeColorAttributeName : cardsColor,
 NSForegroundColorAttributeName : [cardsColor colorWithAlphaComponent:0.15]}
 range:NSMakeRange(0, title.length)];
 }
 
 }
 return title;
 }
 
 
 
 UIColor *foreground = [[self validColor][card.color] copy];
 //foreground is a copy of [UIColor redColor]
 
 //defines foreground based on shading
 foreground = [foreground colorWithAlphaComponent:[self shading:card.shading]];
 
 // sets the color of the string to foreground
 [title setAttributes:@{NSStrokeColorAttributeName:card.color,
 NSForegroundColorAttributeName:foreground}
 range:NSMakeRange(0, [title length ])];
 
 
 
 return [title attributedSubstringFromRange:NSMakeRange(0, [title length])];
 }
 
 
 */


/*- (IBAction)putAnythingonmycardsplease:(UIBarButtonItem *)sender {
 
 Deck * testDeck = [[SetCardDeck alloc] init];
 
 for (UIButton *cardButton in self.cardButtons){
 [cardButton setAttributedTitle:[testDeck drawRandomCard ]
 forState:UIControlStateNormal];
 }
 
 }
 */





@end
