//
//  PodsListViewController.m
//  Pods
//
//  Created by Chris Eidhof on 02.03.14.
//  Copyright (c) 2014 objc.io. All rights reserved.
//

#import "PodsListViewController.h"
#import "FetchedResultsControllerDataSource.h"
#import "Pod.h"
#import "PodDetailViewController.h"

@interface PodsListViewController () <FetchedResultsControllerDataSourceDelegate>

@property (nonatomic, strong) FetchedResultsControllerDataSource *dataSource;
@end

@implementation PodsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Pod"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES], [NSSortDescriptor sortDescriptorWithKey:@"version" ascending:NO]];
    self.dataSource = [[FetchedResultsControllerDataSource alloc] initWithTableView:self.tableView];
    self.dataSource.delegate = self;
    self.dataSource.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.dataSource.reuseIdentifier = @"Cell";    
}

- (void)configureCell:(UITableViewCell *)cell withObject:(Pod*)object
{
    cell.textLabel.text = object.name;
    cell.detailTextLabel.text = object.version;
}

- (void)deleteObject:(id)object
{

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PodDetailViewController *detailViewController = segue.destinationViewController;
    detailViewController.pod = self.dataSource.selectedItem;
}


@end
