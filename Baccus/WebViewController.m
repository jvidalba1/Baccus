//
//  WebViewController.m
//  Baccus
//
//  Created by Mateo Vidal on 28/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

-(id) initWithModel:(WineModel *) aModel{
    if (self = [super initWithNibName:nil bundle:nil])
    {
        _model = aModel;
        self.title = @"Web";
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self displayURL:self.model.wineCompanyWeb];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate methods

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityView stopAnimating];
    self.activityView.hidden = YES;
}

#pragma mark - Util methods

-(void) displayURL:(NSURL *) aURL{
    self.browser.delegate = self;
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    [self.browser loadRequest:[NSURLRequest requestWithURL:aURL]];
}

@end
