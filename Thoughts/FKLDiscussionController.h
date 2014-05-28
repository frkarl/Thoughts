//
//  FKDiscussionControllerViewController.h
//  Retro
//
//  Created by Fredrik on 10/19/12.
//  Copyright (c) 2012 Fredrik K. All rights reserved.
//

#import "FKLAddDiscussionController.h"
#import "FKLDataHandler.h"
#import "Discussion.h"

@interface FKLDiscussionController : UITableViewController <FKAddDiscussionControllerDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *discussions;

- (IBAction)clear:(id)sender;

@end
