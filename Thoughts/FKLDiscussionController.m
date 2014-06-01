//
//  FKDiscussionControllerViewController.m
//  Retro
//
//  Created by Fredrik on 10/19/12.
//  Copyright (c) 2012 Fredrik K. All rights reserved.
//

#import "FKLDiscussionController.h"

@implementation FKLDiscussionController

@synthesize managedObjectContext = __managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [FKLDataHandler performFetchForName:@"Discussion" withContext:self.managedObjectContext];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddDiscussion"])
    {
		UINavigationController *navigationController =
        segue.destinationViewController;
		FKLAddDiscussionController *addDiscussionController = [[navigationController viewControllers] objectAtIndex:0];
		addDiscussionController.delegate = self;
        addDiscussionController.managedObjectContext = self.managedObjectContext;
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

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        [FKLDataHandler clearData:self.managedObjectContext];
        [FKLDataHandler performFetchForName:@"Discussion" withContext:self.managedObjectContext];
        [self.tableView reloadData];
    }
}

#pragma mark - tableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiscussionCell"];
    
    Discussion *discussion = [self.discussions objectAtIndex:indexPath.row];
    UILabel *descussionLabel = (UILabel *)[cell viewWithTag:100];
	descussionLabel.text = discussion.discussion;
    
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.discussions count];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		Discussion *discussion = [self.discussions objectAtIndex:indexPath.row];
        [self.managedObjectContext deleteObject:discussion];
        NSError *error = nil;
        if ([self.managedObjectContext save:&error]) {
            [FKLDataHandler performFetchForName:@"Discussion" withContext:self.managedObjectContext];
            [self.tableView reloadData];
        }
    }
}

#pragma mark - FKAddForceControllerDelegate

- (void)addForceControllerDidCancel:(FKLAddDiscussionController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addForceControllerDidSave:(FKLAddDiscussionController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
    [FKLDataHandler performFetchForName:@"Discussion" withContext:self.managedObjectContext];
    [self.tableView reloadData];
}

@end
