//
// Created by chris on 02.03.14.
//

#import <Foundation/Foundation.h>

@class PodsWebservice;


@interface Importer : NSObject
- (id)initWithContext:(NSManagedObjectContext *)context
           webservice:(PodsWebservice *)webservice;
- (void)import;
@end
