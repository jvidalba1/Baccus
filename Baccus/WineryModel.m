//
//  WineryModel.m
//  Baccus
//
//  Created by Mateo Vidal on 30/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import "WineryModel.h"

@interface WineryModel ()

@property (strong, nonatomic) NSArray *redWines;
@property (strong, nonatomic) NSArray *whiteWines;
@property (strong, nonatomic) NSArray *otherWines;

@end

@implementation WineryModel

#pragma mark - Properties

// Getters

-(int) redWineCount{
    return [self.redWines count];
}

-(int) whiteWineCount{
    return [self.whiteWines count];
}

-(int) otherWineCount{
    return [self.otherWines count];
}


-(id) init{
    if (self = [super init]) {
        
        // Creamos los modelos
        WineModel *tintorro = [WineModel wineWithName:@"Bembibre"
                                      wineCompanyName:@"Dominio de Tares"
                                                 type:@"tinto"
                                               origin:@"El Bierzo"
                                               grapes:@[@"Mencia"]
                                       wineCompanyWeb:[NSURL URLWithString:@"http://www.google.com.co"]
                                                notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencia. En fase visual luce un color rojo picota muy cubierto con tonalidades..."
                                               rating:5
                                                photo:[UIImage imageNamed:@"bembibre.jpg"]];
        
        WineModel *albarinno = [WineModel wineWithName:@"Zarate"
                                       wineCompanyName:@"Zarate"
                                                  type:@"white"
                                                origin:@"Rias bajas"
                                                grapes:@[@"Alberibo"]
                                        wineCompanyWeb:[NSURL URLWithString:@"http://www.google.com.co"]
                                                 notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencia. En fase visual luce un color rojo picota muy cubierto con tonalidades..."
                                                rating:3
                                                 photo:[UIImage imageNamed:@"zarate.gif"]];
        
        WineModel *champagne = [WineModel wineWithName:@"Contes de champagne"
                                       wineCompanyName:@"Nombre de champagne"
                                                  type:@"other"
                                                origin:@"Francia"
                                                grapes:@[@"Chamber light"]
                                        wineCompanyWeb:[NSURL URLWithString:@"http://www.google.com.co"]
                                                 notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencia. En fase visual luce un color rojo picota muy cubierto con tonalidades..."
                                                rating:4
                                                 photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
        
        self.redWines = @[tintorro];
        self.whiteWines = @[albarinno];
        self.otherWines = @[champagne];
    }
    return self;
}

-(WineModel *) redWineAtIndex:(int) index{
    return [self.redWines objectAtIndex:index];
}

-(WineModel *) whiteWineAtIndex:(int) index{
    return [self.whiteWines objectAtIndex:index];
}

-(WineModel *) otherWineAtIndex:(int) index{
    return [self.otherWines objectAtIndex:index];
}

@end
