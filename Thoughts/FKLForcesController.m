//
//  FKFirstViewController.m
//  Retro
//
//  Created by Fredrik on 10/16/12.
//  Copyright (c) 2012 Fredrik K. All rights reserved.
//

#import "FKLForcesController.h"


@interface FKLForcesController ()

@end

@implementation FKLForcesController

@synthesize managedObjectContext;
@synthesize forces;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [FKLDataHandler performFetchForName:@"Force" withContext:self.managedObjectContext];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddForce"])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		FKLAddForceController *addForceController = [[navigationController viewControllers] objectAtIndex:0];
		addForceController.delegate = self;
        addForceController.managedObjectContext = self.managedObjectContext;
	}
}

-(void)clear:(id)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:@"Delete"
                                              otherButtonTitles:nil];
    [sheet showInView:[self.view window]];
}

#pragma mark - UIActionSheetDelegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        [FKLDataHandler clearData:self.managedObjectContext];
        [FKLDataHandler performFetchForName:@"Force" withContext:self.managedObjectContext];
        [self.tableView reloadData];
    }
}

#pragma mark - tableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForceCell"];
    
    Force *force = [self.forces objectAtIndex:indexPath.row];
    UILabel *descriptionLabel = (UILabel *)[cell viewWithTag:100];
	descriptionLabel.text = force.text;
    UIImageView * forceTypeImageView = (UIImageView *)[cell viewWithTag:101];
	forceTypeImageView.image = [self imageForRating:force.type];
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.forces count];
}

- (UIImage *)imageForRating:(NSNumber*)forceType
{
	switch ([forceType integerValue])
    {
		case 0: return [UIImage imageNamed:@"good.png"];
		case 1: return [UIImage imageNamed:@"bad.png"];
	}
	return nil;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		Force *force = [self.forces objectAtIndex:indexPath.row];
        [self.managedObjectContext deleteObject:force];
        NSError *error = nil;
        if ([self.managedObjectContext save:&error]) {
            [FKLDataHandler performFetchForName:@"Force" withContext:self.managedObjectContext];
            [self.tableView reloadData];
        }
    }
}

#pragma mark - FKAddForceControllerDelegate

- (void)addForceControllerDidCancel:(FKLAddForceController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addForceControllerDidSave:(FKLAddForceController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
    [FKLDataHandler performFetchForName:@"Force" withContext:self.managedObjectContext];
    [self.tableView reloadData];
}

@end
