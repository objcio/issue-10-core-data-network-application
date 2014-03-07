//
//  Pod.h
//  Pods
//
//  Created by Chris Eidhof on 02.03.14.
//  Copyright (c) 2014 objc.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ModelObject.h"


@interface Pod : ModelObject

@property (nonatomic, retain) id authors;
@property (nonatomic, retain) NSString * homepage;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * identifier;

- (void)loadFromDictionary:(NSDictionary *)dictionary;
+ (Pod *)findOrCreatePodWithIdentifier:(NSString *)identifier inContext:(NSManagedObjectContext *)context;

@end
