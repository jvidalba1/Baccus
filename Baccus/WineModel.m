//
//  WineModel.m
//  Baccus
//
//  Created by Mateo Vidal on 27/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import "WineModel.h"

@implementation WineModel

/*
 * Cuando creas una propiedad de solo lectura e implementas un getter personalizado,
 * como estamos haciendo con photo, el compilador da por hecho que no vas a necesitar
 * una variable de instancia. En este caso no es así, y si que necesitamos la variable,
 * asi que hay que obligarle a que la incluya. Esto se hace con la linea de @synthesize, 
 * con la que le indicamos que queremos una propiedad llamada photo con una variable
 * de instancia llamada _photo.
 * En la inmensa mayoria de los casos, esto es opcional.
 * Para mas info: http://www.cocoaosx.com/2012/12/04/auto-synthesize-property-reglas-excepciones/
 *
 */

@synthesize photo = _photo;

#pragma mark - Propiedades

-(UIImage *)photo{
    // Esto va a bloquear y se deberia de hacer en segundo plano
    // sin embargo, aun no sabemos hacer eso, asi que de momento lo dejamos
    
    // carga perezosa, solo cargo la imagen si hace falta
    if (_photo == nil) {
        _photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.photoURL]];
    }
    return _photo;
}

#pragma mark - Metodos de clase

+(id) wineWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
            origin:(NSString *) anOrigin
            grapes:(NSArray *) arrayOfGrapes
    wineCompanyWeb:(NSURL *) aURL
             notes:(NSString *) aNotes
            rating:(int) aRating
          photoURL:(NSURL *) aPhotoURL{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin
                               grapes:arrayOfGrapes
                       wineCompanyWeb:aURL
                                notes:aNotes
                               rating:aRating
                             photoURL:aPhotoURL];
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

#pragma mark - JSON

-(id) initWithDictionary:(NSDictionary *)aDict{
    
    // sacando los datos del diccionario y pasandoselo al designador asignado
    return [self initWithName:[aDict objectForKey:@"name"]
              wineCompanyName:[aDict objectForKey:@"wineCompanyName"]
                         type:[aDict objectForKey:@"type"]
                       origin:[aDict objectForKey:@"origin"]
                       grapes:[self extractGrapesFromJSONArray:[aDict objectForKey:@"grapes"]]
               wineCompanyWeb:[NSURL URLWithString:[aDict objectForKey:@"wine_web"]]
                        notes:[aDict objectForKey:@"notes"]
                       rating:[[aDict objectForKey:@"rating"] intValue]
                     photoURL:[NSURL URLWithString:[aDict objectForKey:@"picture"]]];
}

-(NSDictionary *)proxyForJSON{
    
    return @{@"name"                : self.name,
             @"wineCompanyName"     : self.wineCompanyName,
             @"wineCompanyWeb"      : [self.wineCompanyWeb path],
             @"type"                : self.type,
             @"origin"              : self.origin,
             @"grapes"              : self.grapes,
             @"notes"               : self.notes,
             @"rating"              : @(self.rating),
             @"picture"             : [self.photoURL path]};
             
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
              photoURL:(NSURL *) aPhotoURL{
    
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
        _photoURL = aPhotoURL;
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
                        photoURL:nil];
}

-(NSString *) description{
    return [NSString stringWithFormat:@"Name: %@\nCompany name: %@\nType: %@\nOrigin: %@\nGrapes: %@\nWine company web: %@\nNotes: %@\nRating: %d\n", self.name, self.wineCompanyName, self.type, self.origin, self.grapes, self.wineCompanyWeb, self.notes, self.rating];
}

#pragma mark - Utils

-(NSArray *) extractGrapesFromJSONArray:(NSArray *)JSONArray{
    NSMutableArray *grapes = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    for (NSDictionary *dict in JSONArray) {
        [grapes addObject:[dict objectForKey:@"grape"]];
    }
    
    return grapes;
}

-(NSArray *) packGrapesIntoJSONArray{
    NSMutableArray *jsonArray = [NSMutableArray arrayWithCapacity:[self.grapes count]];
    for (NSString *grape in self.grapes) {
        [jsonArray addObject:@{@"grape": grape}];
    }
    
    return jsonArray;
}

@end
