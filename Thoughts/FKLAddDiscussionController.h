//
//  FKAddDiscussionController.h
//  Retro
//
//  Created by Fredrik on 10/19/12.
//  Copyright (c) 2012 Fredrik K. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FKLAddDiscussionController;

@protocol FKAddDiscussionControllerDelegate <NSObject>
- (void)addForceControllerDidCancel:(FKLAddDiscussionController *)controller;
- (void)addForceControllerDidSave:(FKLAddDiscussionController *)controller;
@end

@interface FKLAddDiscussionController : UITableViewController

@property (nonatomic, weak) id <FKAddDiscussionControllerDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UITextView *discussionTextField;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
