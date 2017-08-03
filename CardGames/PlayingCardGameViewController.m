//
//  PlayingCardGameViewController.m
//  CardGames
//
//  Created by Apple on 8/2/17.
//  Copyright © 2017 Mari. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}
- (NSUInteger)numberOfMatches
{
    return 2;
}
- (NSString *)gameName
{
    return @"Matchismo";
}

-(void)updateCardButton:(UIButton *)cardButton usingCard:(Card *)card
{
    [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
    [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
    [cardButton setAlpha:card.isMatched ? 0.2 : 1.0];
}

- (NSAttributedString *)attributedCardsDescription:(NSArray *)cards
{
    NSString *text = [cards componentsJoinedByString:@" & "];
    return [[NSAttributedString alloc] initWithString:text];
}

- (NSAttributedString *)textForSingleCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:
                    @" %@ flipped %@",card,(card.isChosen) ? @"up!" : @"back!"]];
}

-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

@end
