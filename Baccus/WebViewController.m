//
//  WebViewController.m
//  Baccus
//
//  Created by Mateo Vidal on 28/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import "WebViewController.h"
#import "WineryTableViewController.h"

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
    
    // Darnos de alta de las notificaciones
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self // Qn se suscribe
               selector:@selector(wineDidChange:) // se envia un numero q identifica a ese mensaje, ese numero es selector, y el sgte es el nombre del mensaje
                   name:NEW_WINE_NOTIFICATION_NAME // nombre de la notificacion
                 object:nil]; // se refiere al q envia la notificacion, nil: me da igual qn lo mande desde q cumpla con el nombre de la notificacion
}

-(void) wineDidChange:(NSNotification *) notification{
    NSDictionary *dict = [notification userInfo];
    WineModel *newWine = [dict objectForKey:WINE_KEY];
    
    // Actualizar el modelo
    self.model = newWine;
    [self displayURL:self.model.wineCompanyWeb];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    // Darnos de baja de las notificaciones
    [[NSNotificationCenter defaultCenter] removeObserver:self]; // baja de todas las notificaciones
    
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
