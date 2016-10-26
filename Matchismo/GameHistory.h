//
//  GameHistory.h
//  Matchismo
//
//  Created by Dalida Martinez on 10/26/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameHistory : NSObject

@property (nonatomic, strong) NSMutableAttributedString *history;
-(NSAttributedString *) historyString;
-(void) nextLine:(NSAttributedString *) line;
-(void) clearHistory;



@end
