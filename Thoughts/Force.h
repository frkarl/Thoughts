//
//  Force.h
//  Thoughts
//
//  Created by Fredrik on 26/05/14.
//  Copyright (c) 2014 Fredrik K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Force : NSManagedObject

@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * text;

@end
