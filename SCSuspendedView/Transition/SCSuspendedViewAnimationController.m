
#import "SCSuspendedViewAnimationController.h"
#import "UIViewController+SCSuspendedView.h"

@implementation SCSuspendedViewAnimationController

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SCSuspendedViewConfiguration *configuration;
    if (toViewController.beingPresented) {
        configuration = toViewController.sc_suspendedViewConfiguration;;
    } else if (fromViewController.beingDismissed) {
        configuration = fromViewController.sc_suspendedViewConfiguration;;
    }
    NSAssert(configuration, @"sc_suspendedViewConfiguration must be set");
    return configuration.transitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = fromViewController.view;
    UIView *toView = toViewController.view;
    
    SCSuspendedViewConfiguration *configuration;
    if (toViewController.beingPresented) {
        configuration = toViewController.sc_suspendedViewConfiguration;;
    } else if (fromViewController.beingDismissed) {
        configuration = fromViewController.sc_suspendedViewConfiguration;;
    }
    NSAssert(configuration, @"sc_suspendedViewConfiguration must be set");
    
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    CGRect suspendedViewFrameInWindow = configuration.suspendedViewFrameInWindow;
    CGSize suspendedViewSize = suspendedViewFrameInWindow.size;
    
    CGFloat presentingSuspendedViewX;
    CGFloat presentingSuspendedViewY;
    CGRect presentingSuspendedViewFrame;
    CGRect presentedSuspendedViewFrame;
    
    BOOL directCenter = NO;
    switch (configuration.direction) {
        case SCSuspendedViewDirectionBottom:
        {
            presentingSuspendedViewX = suspendedViewFrameInWindow.origin.x;
            presentingSuspendedViewY = screenSize.height;
        }
            break;
            
        case SCSuspendedViewDirectionTop:
        {
            presentingSuspendedViewX = suspendedViewFrameInWindow.origin.x;
            presentingSuspendedViewY = -suspendedViewSize.height;
        }
            break;
            
        case SCSuspendedViewDirectionLeft:
        {
            presentingSuspendedViewX = -suspendedViewSize.width;
            presentingSuspendedViewY = suspendedViewFrameInWindow.origin.y;
        }
            break;
            
        case SCSuspendedViewDirectionRight:
        {
            presentingSuspendedViewX = screenSize.width;
            presentingSuspendedViewY = suspendedViewFrameInWindow.origin.y;
        }
            break;
            
        case SCSuspendedViewDirectionCenter:
        {
            presentingSuspendedViewX = suspendedViewFrameInWindow.origin.x;
            presentingSuspendedViewY = suspendedViewFrameInWindow.origin.y;
            directCenter = YES;
        }
            break;
            
        case SCSuspendedViewDirectionCustomer:
        {
            presentingSuspendedViewX = 0;
            presentingSuspendedViewY = 0;
        }
            break;
            
        default:
            break;
    }
    
    presentingSuspendedViewFrame = CGRectMake(presentingSuspendedViewX, presentingSuspendedViewY, suspendedViewSize.width, suspendedViewSize.height);
    presentedSuspendedViewFrame = suspendedViewFrameInWindow;
    
    NSTimeInterval duration = configuration.transitionDuration;
    if (toViewController.beingPresented) {
        [containerView addSubview:toView];
        
        if (configuration.transparent) {
            if (directCenter) {
                containerView.frame = presentedSuspendedViewFrame;
                containerView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } else {
                containerView.frame = presentingSuspendedViewFrame;
            }
            toView.frame = containerView.bounds;
        } else {
            
            if (directCenter) {
                toView.frame = presentedSuspendedViewFrame;
                toView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } else {
                toView.frame = presentingSuspendedViewFrame;
            }
        }
        
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            if (configuration.transparent) {
                if (directCenter) {
                    containerView.transform = CGAffineTransformIdentity;
                } else {
                    containerView.frame = presentedSuspendedViewFrame;
                    toView.frame = containerView.bounds;
                }
            } else {
                if (directCenter) {
                    toView.transform = CGAffineTransformIdentity;
                } else {
                    toView.frame = presentedSuspendedViewFrame;
                }
            }
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    } else if (fromViewController.beingDismissed) {
        
        [UIView animateWithDuration:duration animations:^{
            
            if (configuration.transparent) {
                if (directCenter) {
                    containerView.alpha = 0;
                } else {
                    containerView.frame = presentingSuspendedViewFrame;
                    fromView.frame = containerView.bounds;
                }
            } else {
                if (directCenter) {
                    fromView.alpha = 0;
                } else {
                    fromView.frame = presentingSuspendedViewFrame;
                }
            }
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    }
}

@end
