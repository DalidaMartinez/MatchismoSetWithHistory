//
//  GameHistory.m
//  Matchismo
//
//  Created by Dalida Martinez on 10/26/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "GameHistory.h"

@implementation GameHistory


-(NSMutableAttributedString *) history
{
    if (!_history) _history = [[NSMutableAttributedString alloc] init];
    return _history;
}
-(void) clearHistory
{
    self.history = nil;
}

-(NSAttributedString *)historyString
{
    return [self.history copy];
}

-(void) nextLine:(NSAttributedString *)line
{
    [self.history appendAttributedString:line];
    [self.history appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
}


@end
