//
//  WineModel.m
//  Baccus
//
//  Created by Mateo Vidal on 27/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import "WineModel.h"

@implementation WineModel

#pragma mark - Class methods

+(id) wineWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
            origin:(NSString *) anOrigin
            grapes:(NSArray *) arrayOfGrapes
    wineCompanyWeb:(NSURL *) aURL
             notes:(NSString *) aNotes
            rating:(int) aRating
             photo:(UIImage *) aPhoto{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin
                               grapes:arrayOfGrapes
                       wineCompanyWeb:aURL
                                notes:aNotes
                               rating:aRating
                                photo:aPhoto];
}

+(id) wineWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
            origin:(NSString *) anOrigin{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin];
    
}

#pragma mark - Init

// Inicializador DESIGNADO
- (id) initWithName:(NSString *) aName
    wineCompanyName:(NSString *) aWineCompanyName
               type:(NSString *) aType
             origin:(NSString *) anOrigin
             grapes:(NSArray *) arrayOfGrapes
     wineCompanyWeb:(NSURL *) aURL
              notes:(NSString *) aNotes
             rating:(int) aRating
              photo:(UIImage *) aPhoto{
    
    if(self = [super init])
    {
        // Asignando los parametros a las variables de instancia
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = anOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _photo = aPhoto;
        _rating = aRating;
    }
    
    return self;
}

- (id) initWithName:(NSString *) aName
    wineCompanyName:(NSString *) aWineCompanyName
               type:(NSString *) aType
             origin:(NSString *) anOrigin{
    
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType origin:anOrigin
                       grapes:nil
               wineCompanyWeb:nil
                        notes:nil
                       rating:NO_RATING
                        photo:nil];
}

@end
