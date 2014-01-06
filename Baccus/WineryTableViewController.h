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

@interface WineryTableViewController : UITableViewController

@property (strong, nonatomic) WineryModel *model;

-(id) initWithModel:(WineryModel *) aModel style:(UITableViewStyle) aStyle;

@end
