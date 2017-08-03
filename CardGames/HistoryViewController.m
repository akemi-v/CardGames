//
//  HistoryViewController.m
//  CardGames
//
//  Created by Apple on 8/2/17.
//  Copyright © 2017 Mari. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@property (weak, nonatomic) IBOutlet UITextView *historyTextView;

@end

@implementation HistoryViewController

- (void)setFlipsHistory:(NSArray *)flipsHistory
{
    _flipsHistory = flipsHistory;
    if (self.view.window) [self updateUI];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void)updateUI
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] init];
    int i = 1;
    for (NSAttributedString *step in self.flipsHistory) {
         [text appendAttributedString:
            [[NSMutableAttributedString alloc] initWithString:
                                     [NSString stringWithFormat:@"%3d:  ",i]]];
         [text appendAttributedString:step];
         [text appendAttributedString:[
                          [NSAttributedString alloc] initWithString:@"\n\n "]];
        i++;
    }
    self.historyTextView.attributedText = text;
}

@end
