
#import "SCSuspendedViewTransitionDelegate.h"
#import "SCSuspendedViewAnimationController.h"
#import "SCSuspendedViewPresentationController.h"
#import "SCSuspendedViewInteractionController.h"
#import "UIViewController+SCSuspendedView.h"

@interface SCSuspendedViewTransitionDelegate ()

@property (nonatomic, strong) SCSuspendedViewInteractionController *interactionController;

@end

@implementation SCSuspendedViewTransitionDelegate

#pragma mark - UIViewControllerAnimatedTransitioning

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    SCSuspendedViewAnimationController *animationController = [SCSuspendedViewAnimationController new];
    SCSuspendedViewConfiguration *configuration = presented.sc_suspendedViewConfiguration;
    if (configuration && configuration.hasGestureRecognizer) {
        self.interactionController = [SCSuspendedViewInteractionController new];
        [self.interactionController wireToViewController:presented];
    }
    return animationController;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    SCSuspendedViewAnimationController *animationController = [SCSuspendedViewAnimationController new];
    return animationController;
}

#pragma mark - UIPresentationController

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    SCSuspendedViewPresentationController *presentationController = [[SCSuspendedViewPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return presentationController;
}

#pragma mark - UIViewControllerInteractiveTransitioning

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactionController.interacting ? self.interactionController : nil;
}

@end
