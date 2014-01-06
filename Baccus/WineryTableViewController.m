//
//  WineryTableViewController.m
//  Baccus
//
//  Created by Mateo Vidal on 6/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import "WineryTableViewController.h"
#import "WineViewController.h"

@interface WineryTableViewController ()

@end

@implementation WineryTableViewController

-(id) initWithModel:(WineryModel *) aModel style:(UITableViewStyle) aStyle{
    
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
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
    
}

@end
