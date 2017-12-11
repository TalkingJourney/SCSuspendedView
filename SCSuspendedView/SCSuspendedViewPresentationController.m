
#import "SCSuspendedViewPresentationController.h"
#import "UIViewController+SCSuspendedView.h"

@interface SCSuspendedViewPresentationController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation SCSuspendedViewPresentationController

- (void)presentationTransitionWillBegin
{
    SCSuspendedViewConfiguration *configuration = self.presentedViewController.sc_suspendedViewConfiguration;
    if (!configuration || configuration.transparent) return;
    
    self.dimmingView = [UIView new];
    self.dimmingView.backgroundColor = [UIColor clearColor];
    self.dimmingView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.dimmingView];
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.backgroundColor = configuration.backgroundMaskColor;
    } completion:nil];
}

- (void)dismissalTransitionWillBegin
{
    SCSuspendedViewConfiguration *configuration = self.presentedViewController.sc_suspendedViewConfiguration;
    if (!configuration || configuration.transparent) return;
    
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.backgroundColor = [UIColor clearColor];
    } completion:nil];
}

- (void)containerViewWillLayoutSubviews
{
    SCSuspendedViewConfiguration *configuration = self.presentedViewController.sc_suspendedViewConfiguration;
    if (!configuration || configuration.transparent) return;
    
//    self.dimmingView.frame = self.containerView.bounds;
//    self.presentedView.center = self.containerView.center;
//    self.presentedView.bounds = CGRectMake(0, 0, self.presentedViewSize.width, self.presentedViewSize.height);
}

@end
