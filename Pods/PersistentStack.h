//
// Created by Chris Eidhof
//


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PersistentStack : NSObject

- (id)initWithStoreURL:(NSURL*)storeURL modelURL:(NSURL*)modelURL;

@property (nonatomic,readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,readonly) NSManagedObjectContext* backgroundManagedObjectContext;

@end


// - (NSURL*)storeURL
// {
//     NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
//                                                                        inDomain:NSUserDomainMask
//                                                               appropriateForURL:nil
//                                                                          create:YES
//                                                                           error:NULL];
//     return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
// }
//
// - (NSURL*)modelURL
// {
//     return [[NSBundle mainBundle] URLForResource:@"Stacks" withExtension:@"momd"];
// }
