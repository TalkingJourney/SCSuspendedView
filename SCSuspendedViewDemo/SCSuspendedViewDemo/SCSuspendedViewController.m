
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    BOOL yesOrNo = self.sc_suspendedViewConfiguration.hasGestureRecognizer;
    self.sc_suspendedViewConfiguration.hasGestureRecognizer = !yesOrNo;
}

@end
