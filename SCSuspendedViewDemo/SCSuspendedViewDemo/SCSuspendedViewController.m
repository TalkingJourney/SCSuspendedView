
#import "SCSuspendedViewController.h"
#import "UIViewController+SCSuspendedView.h"

@implementation SCSuspendedViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self sc_makeSuspendedView];
    }
    return self;
}

- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

@end
