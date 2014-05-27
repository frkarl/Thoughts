//
//  FKSecondViewController.h
//  Retro
//
//  Created by Fredrik on 10/16/12.
//  Copyright (c) 2012 Fredrik K. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Force.h"

@class FKLAddForceController;

@protocol FKLAddForceControllerDelegate <NSObject>
- (void)addForceControllerDidCancel:(FKLAddForceController *)controller;
- (void)addForceControllerDidSave:(FKLAddForceController *)controller;
@end

@interface FKLAddForceController : UITableViewController

@property (nonatomic) NSUInteger selectedForceType;
@property (nonatomic, weak) id <FKLAddForceControllerDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UITextField *forceTextField;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
