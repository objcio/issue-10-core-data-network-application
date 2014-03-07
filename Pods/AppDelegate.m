//
//  AppDelegate.m
//  Pods
//
//  Created by Chris Eidhof on 02.03.14.
//  Copyright (c) 2014 objc.io. All rights reserved.
//

#import "AppDelegate.h"

#import "OBJMasterViewController.h"
#import "PersistentStack.h"
#import "PodsWebservice.h"
#import "Importer.h"
#import "PodsListViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) Importer *importer;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.persistentStack = [[PersistentStack alloc] initWithStoreURL:self.storeURL modelURL:self.modelURL];
    self.webservice = [[PodsWebservice alloc] init];
    self.importer = [[Importer alloc] initWithContext:self.persistentStack.backgroundManagedObjectContext webservice:self.webservice];
    [self.importer import];
    // Override point for customization after application launch.
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    PodsListViewController *listViewController = (PodsListViewController *) navigationController.topViewController;
    listViewController.managedObjectContext = self.persistentStack.managedObjectContext;
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    [self.persistentStack.managedObjectContext save:&error];
    if (error) {
        NSLog(@"error saving: %@", error.localizedDescription);
    }
}

- (NSURL*)storeURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                       inDomain:NSUserDomainMask
                                                              appropriateForURL:nil
                                                                         create:YES
                                                                          error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"Pods" withExtension:@"momd"];
}

@end
