//
//  HistoryViewController.m
//  Matchismo
//
//  Created by Dalida Martinez on 10/22/16.
//  Copyright © 2016 Dalida. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *statusHistoryTextView;
@end

@implementation HistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}


-(void) setHistoryofMatched: (NSArray *) statusHistory
{
    
    _statusHistory = statusHistory;
    if(self.view.window) [self updateUI];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
    
}


-(void) updateUI
{
    
    NSMutableAttributedString *text =
    [[NSMutableAttributedString alloc] init];
    int i = 1;
    for (NSAttributedString *line in self.statusHistory){
        [text appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%3d: ",i]]];
        [text appendAttributedString:line];
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n "]];
        
        i++;
    }
    self.statusHistoryTextView.attributedText = text;
    
 }



@end
