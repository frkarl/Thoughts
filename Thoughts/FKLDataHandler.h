//
//  FKLDataHandler.h
//  Thoughts
//
//  Created by Fredrik on 27/05/14.
//  Copyright (c) 2014 Fredrik K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKLDataHandler : NSObject

+ (void)clearData:(NSManagedObjectContext*)managedObjectContext;
+ (NSArray*)performFetchForName: (NSString*) name withContext:(NSManagedObjectContext*)managedObjectContext;

@end
