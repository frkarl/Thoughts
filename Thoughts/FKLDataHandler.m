//
//  FKLDataHandler.m
//  Thoughts
//
//  Created by Fredrik on 27/05/14.
//  Copyright (c) 2014 Fredrik K. All rights reserved.
//

#import "FKLDataHandler.h"

@implementation FKLDataHandler

+ (void)clearData:(NSManagedObjectContext*)managedObjectContext
{
    NSError* error = nil;
    
    NSURL * storeURL = [[managedObjectContext persistentStoreCoordinator] URLForPersistentStore:[[[managedObjectContext persistentStoreCoordinator] persistentStores] lastObject]];
    
    [managedObjectContext lock];
    [managedObjectContext reset];
    
    if ([[managedObjectContext persistentStoreCoordinator] removePersistentStore:[[[managedObjectContext persistentStoreCoordinator] persistentStores] lastObject] error:&error]) {
        
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
        
        [[managedObjectContext persistentStoreCoordinator] addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    }
    [managedObjectContext unlock];
}

@end
