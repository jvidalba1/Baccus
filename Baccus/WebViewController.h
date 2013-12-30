//
//  WebViewController.h
//  Baccus
//
//  Created by Mateo Vidal on 28/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineModel.h"
@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) WineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel:(WineModel *) aModel;

@end
