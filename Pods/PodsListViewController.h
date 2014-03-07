//
//  PodsListViewController.h
//  Pods
//
//  Created by Chris Eidhof on 02.03.14.
//  Copyright (c) 2014 objc.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FetchedResultsControllerDataSource;

@interface PodsListViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
