//
// Created by chris on 02.03.14.
//

#import "PodsWebservice.h"


@interface PodsWebservice ()

@property (nonatomic, strong) NSURLSessionDataTask *task;
@end

@implementation PodsWebservice

- (void)fetchAllPods:(void (^)(NSArray *pods))callback
{
    [self fetchAllPods:callback page:0];
}

- (void)fetchAllPods:(void (^)(NSArray *pods))callback page:(NSUInteger)page
{
    NSString *urlString = [NSString stringWithFormat:@"http://localhost:4567/specs?page=%d", page];
    NSURL *url = [NSURL URLWithString:urlString];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            callback(nil);
            return;
        }
        NSError *jsonError = nil;
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSArray *pods = result[@"result"];
            callback(pods);
            NSNumber* numberOfPages = result[@"number_of_pages"];
            //NSLog(@"%d", numberOfPages.unsignedIntegerValue);
            NSUInteger nextPage = page + 1;
            if (nextPage < numberOfPages.unsignedIntegerValue) {
                [self fetchAllPods:callback page:nextPage];
            }
        }
    }] resume];
}


@end
