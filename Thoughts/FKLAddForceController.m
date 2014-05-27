//
//  FKSecondViewController.m
//  Retro
//
//  Created by Fredrik on 10/16/12.
//  Copyright (c) 2012 Fredrik K. All rights reserved.
//

#import "FKLAddForceController.h"

@implementation FKLAddForceController

@synthesize delegate;
@synthesize forceTextField;
@synthesize selectedForceType;
@synthesize managedObjectContext = __managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.selectedForceType = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)cancel:(id)sender
{
	[self.delegate addForceControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    if ([forceTextField.text length] > 0)
    {
        //Force *force = [NSEntityDescription insertNewObjectForEntityForName:@"Force" inManagedObjectContext:self.managedObjectContext];
    
        //force.strDescription = forceTextField.text;
        //force.intForceType = [NSNumber numberWithUnsignedInteger:selectedForceType];
        [self.managedObjectContext save:nil];
	}
    [self.delegate addForceControllerDidSave:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    if (section == 1 && row == self.selectedForceType) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    if (section==1) {
        self.selectedForceType = row;
    }
    [self.tableView reloadData];
}



@end
