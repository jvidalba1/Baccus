//
//  WineModel.h
//  Baccus
//
//  Created by Mateo Vidal on 27/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NO_RATING -1

@interface WineModel : NSObject

/*
 1. Propiedades
*/
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic, readonly) UIImage *photo; // solo lectura
@property (strong, nonatomic) NSURL *photoURL;
@property (strong, nonatomic) NSURL *wineCompanyWeb;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSString *origin;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *wineCompanyName;
@property (strong, nonatomic) NSArray *grapes;
@property (nonatomic) int rating; // 0 - 5 nota

/*
 2. Metodos de clase (+)
*/

+(id) wineWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
            origin:(NSString *) anOrigin
            grapes:(NSArray *) arrayOfGrapes
    wineCompanyWeb:(NSURL *) aURL
             notes:(NSString *) aNotes
            rating:(int) aRating
             photoURL:(NSURL *) aPhotoURL;

+(id) wineWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
            origin:(NSString *) anOrigin;

/*
 3. Metodos de instancia (-)
*/

-(id) initWithName:(NSString *) aName
    wineCompanyName:(NSString *) aWineCompanyName
               type:(NSString *) aType
             origin:(NSString *) anOrigin
             grapes:(NSArray *) arrayOfGrapes
     wineCompanyWeb:(NSURL *) aURL
              notes:(NSString *) aNotes
             rating:(int) aRating
              photoURL:(NSURL *) aPhotoURL;

-(id) initWithName:(NSString *) aName
    wineCompanyName:(NSString *) aWineCompanyName
               type:(NSString *) aType
             origin:(NSString *) anOrigin;

// Inicializador a partir de diccionario JSON
-(id) initWithDictionary:(NSDictionary *) aDict;

@end
