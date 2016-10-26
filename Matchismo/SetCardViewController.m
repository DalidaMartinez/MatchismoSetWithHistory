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




@end
