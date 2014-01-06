//
//  AppDelegate.m
//  Baccus
//
//  Created by Mateo Vidal on 26/12/13.
//  Copyright (c) 2013 Mateo Vidal. All rights reserved.
//

#import "AppDelegate.h"
#import "WineModel.h"
#import "WineViewController.h"
#import "WebViewController.h"
#import "WineryModel.h"
#import "WineryTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Creamos los modelos
    /*
    WineModel *tintorro = [WineModel wineWithName:@"Bembibre"
                                  wineCompanyName:@"Dominio de Tares"
                                             type:@"tinto"
                                           origin:@"El Bierzo"
                                           grapes:@[@"Mencia"]
                                   wineCompanyWeb:[NSURL URLWithString:@"http://www.google.com.co"]
                                            notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencia. En fase visual luce un color rojo picota muy cubierto con tonalidades..."
                                           rating:5
                                            photo:[UIImage imageNamed:@"bembibre.jpg"]];
    
    WineModel *albarinno = [WineModel wineWithName:@"Zarate"
                                   wineCompanyName:@"Zarate"
                                              type:@"white"
                                            origin:@"Rias bajas"
                                            grapes:@[@"Alberibo"]
                                    wineCompanyWeb:[NSURL URLWithString:@"http://www.google.com.co"]
                                             notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencia. En fase visual luce un color rojo picota muy cubierto con tonalidades..."
                                            rating:3
                                             photo:[UIImage imageNamed:@"zarate.gif"]];
    
    WineModel *champagne = [WineModel wineWithName:@"Contes de champagne"
                                   wineCompanyName:@"Nombre de champagne"
                                              type:@"other"
                                            origin:@"Francia"
                                            grapes:@[@"Chamber light"]
                                    wineCompanyWeb:[NSURL URLWithString:@"http://www.google.com.co"]
                                             notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencia. En fase visual luce un color rojo picota muy cubierto con tonalidades..."
                                            rating:4
                                             photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
     */
    
    // Creamos los modelos
    WineryModel *winery = [[WineryModel alloc] init];
    
    // Creamos los controladores
    WineryTableViewController *wineryVC = [[WineryTableViewController alloc] initWithModel:winery style:UITableViewStylePlain];
    
    //WineViewController *tintoVC = [[WineViewController alloc] initWithModel:tintorro];
    //WineViewController *blancoVC = [[WineViewController alloc] initWithModel:albarinno];
    //WineViewController *otroVC = [[WineViewController alloc] initWithModel:champagne];
    //WebViewController *webVC = [[WebViewController alloc] initWithModel:tintorro];
    
    // Creamos los navigation
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    
    //UINavigationController *tintoNav = [[UINavigationController alloc] initWithRootViewController:tintoVC];
    //UINavigationController *blancoNav = [[UINavigationController alloc] initWithRootViewController:blancoVC];
    //UINavigationController *otroNav = [[UINavigationController alloc] initWithRootViewController:otroVC];
    
    // Creamos el combinador
    
    
    // UITabViewController
    
    //UITabBarController *tabVC = [[UITabBarController alloc] init];
    //tabVC.viewControllers = @[tintoNav, blancoNav, otroNav];
    
    //UITabBarController *tabVC = [[UITabBarController alloc] init];
    //tabVC.viewControllers = @[wineVC, webVC];
    
    //UINavigationController
    //UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:wineVC];
    
    // Lo asignamos como controlador raiz
    self.window.rootViewController = navVC;
    //self.window.rootViewController = tabVC;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor greenColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
