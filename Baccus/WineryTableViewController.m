//
//  WineryTableViewController.m
//  Baccus
//
//  Created by Mateo Vidal on 6/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import "WineModel.h"
#import "WineViewController.h"
#import "WebViewController.h"
#import "WineryModel.h"
#import "WineryTableViewController.h"

@interface WineryTableViewController ()

@end

@implementation WineryTableViewController

-(id) initWithModel:(WineryModel *) aModel
              style:(UITableViewStyle) aStyle{
    
    if (self = [super initWithStyle:aStyle]) {
        _model = aModel;
        self.title = @"Baccus";
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.5
                                                                        green:0
                                                                         blue:0.13
                                                                        alpha:1];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == RED_WINE_SECTION)
    {
        return @"Red wines";
    }
    else if (section == WHITE_WINE_SECTION)
    {
        return @"White wines";
    }
    else
    {
        return @"Other wines";
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == RED_WINE_SECTION)
    {
        return self.model.redWineCount;
    }
    else if (section == WHITE_WINE_SECTION)
    {
        return self.model.whiteWineCount;
    }
    else
    {
        return self.model.otherWineCount;
    
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    // Averiguar de que modelo (vino) nos estan hablando
    WineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION)
    {
        wine = [self.model redWineAtIndex:indexPath.row];
    }
    else if (indexPath.section == WHITE_WINE_SECTION)
    {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }
    else
    {
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    // Sincronizar celda (vista) y modelo (wine)
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Escogemos el vino seleccionado
    WineModel *wine = [self wineForIndexPath:indexPath];
    
    // Avisar al delegado
    [self.delegate wineryTableViewController:self didSelecteWine:wine];
    
    //Enviar notificacion
    NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME object:self userInfo:@{WINE_KEY: wine}];
    
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
    // Guardar el ultimo vino seleccionado
    [self saveLastSelectedWineAtSection:indexPath.section row:indexPath.row];
    
    
    /*
    // Suponemos que estamos en n navigation controller
    
    // Averiguamos de que vino se trata
    WineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION)
    {
        wine = [self.model redWineAtIndex:indexPath.row];
    }
    else if (indexPath.section == WHITE_WINE_SECTION)
    {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }
    else
    {
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    // Con esto le mandamos el mensaje al delegado y el se encarga del resto
    [self.delegate wineryTableViewController:self
                              didSelecteWine:wine];
    
    
    // Creamos un controlador para dicho vino
    //WineViewController *wineVC = [[WineViewController alloc] initWithModel:wine];
    
    // Hacemos un push al navigation controller dentro del cual estamos
    //[self.navigationController pushViewController:wineVC animated:YES];
    
    
    // Notificacion
    NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                      object:self
                                                    userInfo:@{WINE_KEY: wine}];
    
    [[NSNotificatioCenter defaultCenter]postNotification:n];
     */
}

#pragma mark - NSUserDefaults

- (NSDictionary *) setDefaults{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Creo el diccionario con las claves que tengo definidas
    // Por defecto, mostramos el primero de los tintos
    NSDictionary *defaultWineCoords = @{SECTION_KEY : @(RED_WINE_SECTION), ROW_KEY : @0};
    
    // lo asignamos
    [defaults setObject:defaultWineCoords
                 forKey:LAST_WINE_KEY];
    
    // Guardamos por si las moscas
    [defaults synchronize];
    
    return defaultWineCoords;
}

// Guardar las coordenadas del ultimo vino seleccionado
- (void)saveLastSelectedWineAtSection:(NSInteger)section
                                   row:(NSInteger)row{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY : @(section), ROW_KEY : @(row)}
                 forKey:LAST_WINE_KEY];
                          
    [defaults synchronize];
}

- (WineModel *)lastSelectedWine{
    
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil; // Guardar coordenadas del vino
    
    /* Obtener las coordenadas creando una instancia 
     * NSUserDefaults y le mando el 
     * mensaje objectForKey (constante)
     */
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_WINE_KEY];
    
    if (coords == nil) {
        /*
         * No hay nada bajo la clave LAST_WINE_KEY,
         * esto quiere decir que es la primera vez que se llama a la app
         * Ponemos un valor por defecto: el primero de los tintos
         */
        coords = [self setDefaults];
    }else{
        /*
         * Ya hay algo, es decir, en algun momento se guardó
         * No hay nada en especial que hacer
         */
    }
    
    // Transformamos esas coordenadas del diccionariox  en un indexPath
    indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey: ROW_KEY] integerValue]
                                   inSection:[[coords objectForKey: SECTION_KEY] integerValue]];
    
    // Devolvemos el vino en cuestion, le pasamos un indexPath y nos devuelve un vino
    return [self wineForIndexPath:indexPath];
}

#pragma mark - Utils
-(WineModel *)wineForIndexPath:(NSIndexPath *)indexPath{

    //Averiguamos de que vino se trata
    WineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    }else if (indexPath.section == WHITE_WINE_SECTION)
    {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else{
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    return wine;
}

@end
