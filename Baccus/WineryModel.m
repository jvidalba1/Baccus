//
//  WineryModel.m
//  Baccus
//
//  Created by Mateo Vidal on 30/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import "WineryModel.h"

@interface WineryModel ()

@property (strong, nonatomic) NSMutableArray *redWines;
@property (strong, nonatomic) NSMutableArray *whiteWines;
@property (strong, nonatomic) NSMutableArray *otherWines;

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
        
        // Descargar los datos a partir de la url q le pasemos al request
        NSURLRequest *request   = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baccusapp.herokuapp.com/wines"]];
        NSURLResponse *response = [[NSURLResponse alloc]init];
        NSError *error;
        NSData *data            = [NSURLConnection sendSynchronousRequest:request
                                                        returningResponse:&response
                                                                    error:&error];
        
        if (data != nil) {
            NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:kNilOptions
                                                                    error:&error];
            
            if (JSONObjects != nil) {
                for (NSDictionary *dict in JSONObjects) {
                    WineModel *wine = [[WineModel alloc]initWithDictionary:dict];
                    
                    // Añadimos al tipo adecuado
                    if ([wine.type isEqualToString:RED_WINE_KEY]) {
                        
                        if (!self.redWines) {
                            self.redWines = [NSMutableArray arrayWithObject:wine];
                        }else{
                            [self.redWines addObject:wine];
                        }
                    }else if ([wine.type isEqualToString:WHITE_WINE_KEY]){
                        if (!self.whiteWines) {
                            self.whiteWines = [NSMutableArray arrayWithObject:wine];
                        }else{
                            [self.whiteWines addObject:wine];
                        }
                    }else{
                        if (!self.otherWines) {
                            self.otherWines = [NSMutableArray arrayWithObject:wine];
                        }else{
                            [self.otherWines addObject:wine];
                        }
                    }
                }
            }else{
                // Se ha producido un error al parsear el JSON
                NSLog(@"Error al parsear JSON: %@", error.localizedDescription);
            }
        }else{
            // Error al descargar los datos del servidor
            NSLog(@"Error al descargar los datos del servidor: %@",error.localizedDescription);
        }
    }
    return self;
}

#pragma mark - Other

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
