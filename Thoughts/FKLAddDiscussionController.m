//
//  FKAddDiscussionController.m
//  Retro
//
//  Created by Fredrik on 10/19/12.
//  Copyright (c) 2012 Fredrik K. All rights reserved.
//

#import "FKLAddDiscussionController.h"
#import "Discussion.h"

@implementation FKLAddDiscussionController

@synthesize delegate;
@synthesize discussionTextField;
@synthesize managedObjectContext = __managedObjectContext;

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

- (IBAction)cancel:(id)sender
{
	[self.delegate addForceControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
    if ([discussionTextField.text length] > 0)
    {
        Discussion *discussion = [NSEntityDescription insertNewObjectForEntityForName:@"Discussion" inManagedObjectContext:self.managedObjectContext];
        
        discussion.discussion = discussionTextField.text;
        [self.managedObjectContext save:nil];
	}
    [self.delegate addForceControllerDidSave:self];
}
@end
