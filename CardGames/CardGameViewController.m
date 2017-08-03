//
//  CardGameViewController.m
//  CardGames
//
//  Created by Apple on 8/2/17.
//  Copyright © 2017 Mari. All rights reserved.
//

#import "CardGameViewController.h"
#import "HistoryViewController.h"
#import "Deck.h"

@interface CardGameViewController ()

@property (strong, nonatomic) Deck *deck;
@property (nonatomic,strong) CardMatchingGame *game;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) NSMutableArray *flipsHistory;
@property (weak, nonatomic) IBOutlet UILabel *dealLabel;

@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    _game.numberOfMatches =[self numberOfMatches];
    _game.gameName = [self gameName];
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [self updateCardButton:cardButton usingCard:(Card *)card];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    [self updateFlipResult];
    
}

- (Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

 - (Deck *)createDeck
{
    return nil;
}
- (NSUInteger)numberOfMatches
{
    return 0;
}

- (NSString *)gameName
{
    return nil;
}

-(void)updateCardButton:(UIButton *)cardButton usingCard:(Card *)card
{

}

- (NSAttributedString *)textForSingleCard:(Card *)card
{
    return nil;
}

- (NSAttributedString *)attributedCardsDescription:(NSArray *)cards
{
    return nil;
}

- (NSMutableArray *)flipsHistory
{
    if (!_flipsHistory)_flipsHistory = [[NSMutableArray alloc] init];
    return _flipsHistory;
}

- (IBAction)Deal
{
    self.game = nil;
    self.flipCount = 0;
    self.flipsHistory = nil;
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    self.flipCount++;
    [self updateUI];
}

-(void)updateFlipResult
{
    NSString *text = @" ";
    NSMutableAttributedString *textResult = [[NSMutableAttributedString alloc] init];
    if ([self.game.matchedCards count] > 0)
    {
        if ([self.game.matchedCards count] == [self numberOfMatches])
        {
           [textResult appendAttributedString:
                         [self attributedCardsDescription:self.game.matchedCards]];
            if (self.game.lastFlipPoints < 0) {
                text = [text stringByAppendingString:
                        [NSString stringWithFormat:
                                 @"%ld penalty",(long)self.game.lastFlipPoints]];
            } else {
                text = [text stringByAppendingString:
                        [NSString stringWithFormat:
                                  @"+%ld bonus",(long)self.game.lastFlipPoints]];
            }
            
        } else textResult = [[NSMutableAttributedString alloc] initWithAttributedString:
                             [self textForSingleCard:[self.game.matchedCards lastObject]]];
        
        [textResult appendAttributedString:[[NSAttributedString alloc] initWithString:text]];
        [self.flipsHistory addObject:textResult];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowHistory"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *hsvc = (HistoryViewController *)segue.destinationViewController;
            hsvc.flipsHistory = self.flipsHistory;
        }
    }
    
}
@end
