//
// Created by chris on 03.03.14.
//

#import "PodDetailViewController.h"
#import "Pod.h"

@interface PodDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *version;
@property (strong, nonatomic) IBOutlet UILabel *authors;
@property (strong, nonatomic) IBOutlet UILabel *homepage;
@property (strong, nonatomic) IBOutlet UILabel *source;

@end

@implementation PodDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.pod.name;
    self.version.text = self.pod.version;
    self.authors.text = [[self.pod.authors allKeys] componentsJoinedByString:@", "];
    self.homepage.text = self.pod.homepage;
    self.source.text = self.pod.source;
}


@end
