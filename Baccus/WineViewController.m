//
//  WineViewController.m
//  Baccus
//
//  Created by Mateo Vidal on 27/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import "WineViewController.h"
#import "WebViewController.h"

@interface WineViewController ()

@end

@implementation WineViewController

-(id) initWithModel:(WineModel *) aModel{
    
    if(self = [super initWithNibName:nil
                              bundle:nil])
    {
        _model = aModel;
        self.title = aModel.name;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self syncModelWithView];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.5
                                                                        green:0
                                                                         blue:0.13
                                                                        alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)displayWeb:(id)sender{
    //NSLog(@"Go to %@", self.model.wineCompanyWeb);
    // Crear un webViewController
    WebViewController *webVC = [[WebViewController alloc] initWithModel:self.model];
    
    // Hacemos un push
    [self.navigationController pushViewController:webVC animated:YES];
    
}

#pragma mark - Utils methods

-(void) syncModelWithView{
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.photoView.image = self.model.photo;
    self.grapesLabel.text = [self arrayToString:self.model.grapes];
    [self displayRating: self.model.rating];
    [self.notesLabel setNumberOfLines:0];
}

// Limpiar los puntajes
-(void) clearRatings{
    
    for (UIImageView *imgView in self.ratingViews)
    {
        imgView.image = nil;
    }
}

// Desplegar el respectivo puntaje con las copas de vino
-(void) displayRating:(int) aRating{
    
    [self clearRatings];
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int i = 0; i < aRating; i++)
    {
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
    
}

// Pasar un arreglo a string
-(NSString *) arrayToString:(NSArray *) anArray{
    
    NSString *repr = nil;
    if ([anArray count] == 1)
    {
        repr = [@"100% " stringByAppendingString:[anArray firstObject]];
    }else
    {
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    return repr;
}

@end
