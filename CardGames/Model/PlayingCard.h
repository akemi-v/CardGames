//
//  PlayingCard.h
//  CardGames
//
//  Created by Apple on 8/2/17.
//  Copyright © 2017 Mari. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
