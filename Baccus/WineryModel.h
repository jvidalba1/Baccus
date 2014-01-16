//
//  WineryModel.h
//  Baccus
//
//  Created by Mateo Vidal on 30/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineModel.h"

#define RED_WINE_KEY    @"Tinto"
#define WHITE_WINE_KEY  @"Blanco"
#define OTHER_WINE_KEY  @"Rosado"

@interface WineryModel : NSObject

@property (readonly, nonatomic) int redWineCount;
@property (readonly, nonatomic) int whiteWineCount;
@property (readonly, nonatomic) int otherWineCount;

-(WineModel *) redWineAtIndex:(NSInteger) index;
-(WineModel *) whiteWineAtIndex:(NSInteger) index;
-(WineModel *) otherWineAtIndex:(NSInteger) index;

@end
