
#import "UIViewController+SCSuspendedView.h"
#import "SCSuspendedViewTransitionDelegate.h"
#import <objc/runtime.h>

@interface UIViewController ()

@property (nonatomic, strong) SCSuspendedViewTransitionDelegate *sc_suspendedViewTransitionDelegate;

@end

@implementation UIViewController (SCSuspendedView)

#pragma mark - Public Method

- (void)sc_makeSuspendedView
{
    self.transitioningDelegate = self.sc_suspendedViewTransitionDelegate;
    self.modalPresentationStyle = UIModalPresentationCustom;
}

#pragma mark - Getter and Setter

- (SCSuspendedViewTransitionDelegate *)sc_suspendedViewTransitionDelegate
{
    SCSuspendedViewTransitionDelegate *sc_suspendedViewTransitionDelegate = objc_getAssociatedObject(self, @selector(sc_suspendedViewTransitionDelegate));
    if (!sc_suspendedViewTransitionDelegate) {
        sc_suspendedViewTransitionDelegate = [SCSuspendedViewTransitionDelegate new];
        objc_setAssociatedObject(self, @selector(sc_suspendedViewTransitionDelegate), sc_suspendedViewTransitionDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return sc_suspendedViewTransitionDelegate;
}

- (SCSuspendedViewConfiguration *)sc_suspendedViewConfiguration
{
    return objc_getAssociatedObject(self, @selector(sc_suspendedViewConfiguration));
}

- (void)setSc_suspendedViewConfiguration:(SCSuspendedViewConfiguration *)sc_suspendedViewConfiguration
{
    objc_setAssociatedObject(self, @selector(sc_suspendedViewConfiguration), sc_suspendedViewConfiguration, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

