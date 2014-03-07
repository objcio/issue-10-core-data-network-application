//
// Created by chris on 02.03.14.
//

#import <Foundation/Foundation.h>


@interface PodsWebservice : NSObject

- (void)fetchAllPods:(void (^)(NSArray *pods))callback;

@end
