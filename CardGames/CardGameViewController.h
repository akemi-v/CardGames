//
//  CardGameViewController.h
//  CardGames
//
//  Created by Apple on 8/2/17.
//  Copyright © 2017 Mari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController

- (Deck *)createDeck;
- (NSUInteger)numberOfMatches;
- (NSString *)gameName;

- (void)updateCardButton:(UIButton *)cardButton usingCard:(Card *)card;
- (NSAttributedString *)textForSingleCard:(Card *)card;
- (NSAttributedString *)attributedCardsDescription:(NSArray *)cards;

@end
