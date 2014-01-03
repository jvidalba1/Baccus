//
//  WineryModel.h
//  Baccus
//
//  Created by Mateo Vidal on 30/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineModel.h"

@interface WineryModel : NSObject

@property (readonly, nonatomic) int redWineCount;
@property (readonly, nonatomic) int whiteWineCount;
@property (readonly, nonatomic) int otherWineCount;

-(WineModel *) redWineAtIndex:(int) index;
-(WineModel *) whiteWineAtIndex:(int) index;
-(WineModel *) otherWineAtIndex:(int) index;

@end
