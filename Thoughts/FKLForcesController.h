//
//  FKFirstViewController.h
//  Thoughts
//
//  Created by Fredrik on 10/16/12.
//  Copyright (c) 2014 Fredrik K. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CoreDataTableViewController.h"
#import "FKLAddForceController.h"
#import "Force.h"
#import "FKLDataHandler.h"

@interface FKLForcesController : UITableViewController <FKLAddForceControllerDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *forces;

- (IBAction)clear:(id)sender;

@end
