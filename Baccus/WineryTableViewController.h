//
//  WineryTableViewController.h
//  Baccus
//
//  Created by Mateo Vidal on 6/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineryModel.h"

#define RED_WINE_SECTION    0
#define WHITE_WINE_SECTION  1
#define OTHER_WINE_SECTION  2
#define NEW_WINE_NOTIFICATION_NAME @"newWine"
#define WINE_KEY @"wine"

// Protocolo para comunicar los dos MVC's

// El compilador ve q esto es una clase y confia q la declaremos mas adelante
@class WineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void) wineryTableViewController:(WineryTableViewController *) wineryVC
                   didSelecteWine:(WineModel *) aWine;

@end

@interface WineryTableViewController : UITableViewController

@property (strong, nonatomic) WineryModel *model;
@property (nonatomic, weak) id<WineryTableViewControllerDelegate> delegate;

-(id) initWithModel:(WineryModel *) aModel style:(UITableViewStyle) aStyle;

@end
