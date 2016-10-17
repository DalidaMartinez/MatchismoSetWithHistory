//
//  SetCardViewController.m
//  Matchismo
//
//  Created by Dalida Martinez on 10/16/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetCardDeck.h"

@interface SetCardViewController ()


@end

@implementation SetCardViewController

-(Deck *) createDeck{
    return [[SetCardDeck alloc]init];
}


+(NSDictionary *) validColor
{
    return @ {@"cyan" : [UIColor cyanColor],
              @"magenta" : [UIColor magentaColor],
              @"green" : [UIColor greenColor]};
    
}

+(CGFloat) shading:(NSString*) shade
{
    NSDictionary *shades = @{ @"fill" : @1.0, @"noFill" : @0, @"striped" : @0.2};
    
    return [shades[shade] floatValue];

}





+ (NSAttributedString *) titleForCard:(SetCard *)card{
    NSMutableAttributedString *title;
    
    for (int i = 0; i<card.number;i++){
        [title appendAttributedString:card.character];
    }
    
    UIColor *foreground = [[self validColor][card.color] copy];
    
    //defines foreground based on shading
    foreground = [foreground colorWithAlphaComponent:[self shading:card.shading]];
    
    // sets the color of the string to foreground
    
    [title setAttributes:@{NSForegroundColorAttributeName:foreground} range:NSMakeRange(0, [title length])];
    

    
    return title;
}

- (UIImage *) backgroundImageForCard: (Card *) card
{
    return [UIImage imageNamed:card.chosen ?
            ]
}


@end
