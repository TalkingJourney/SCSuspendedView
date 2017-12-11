
#import "SCSuspendedViewTransitionDelegate.h"
#import "SCSuspendedViewAnimationController.h"
#import "SCSuspendedViewPresentationController.h"
#import "SCSuspendedViewInteractionController.h"

@interface SCSuspendedViewTransitionDelegate ()

@property (nonatomic, strong) SCSuspendedViewInteractionController *interactionController;

@end

@implementation SCSuspendedViewTransitionDelegate

- (void)dealloc
{
    
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    SCSuspendedViewAnimationController *animationController = [SCSuspendedViewAnimationController new];
    [self.interactionController wireToViewController:presented];
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

#pragma mark - Getter and Setter

- (SCSuspendedViewInteractionController *)interactionController
{
    if (!_interactionController) {
        _interactionController = [SCSuspendedViewInteractionController new];
    }
    return _interactionController;
}

@end
