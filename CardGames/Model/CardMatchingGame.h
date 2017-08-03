//
//  CardMatchingGame.h
//  CardGames
//
//  Created by Apple on 8/2/17.
//  Copyright © 2017 Mari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic) int matchBonus;
@property (nonatomic) int mismatchPenalty;
@property (nonatomic) int flipCost;

@property (strong, nonatomic) NSString *gameName;
@property (nonatomic) NSUInteger numberOfMatches;
@property (nonatomic, readonly) int score;
@property (strong, nonatomic) NSArray *matchedCards;
@property (readonly, nonatomic) int lastFlipPoints;

@end
