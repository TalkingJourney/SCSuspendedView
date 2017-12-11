
#import "SCSuspendedViewInteractionController.h"
#import "UIViewController+SCSuspendedView.h"

@interface SCSuspendedViewInteractionController ()

@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, weak) UIViewController *presentedViewController;

@end

@implementation SCSuspendedViewInteractionController

- (void)wireToViewController:(UIViewController *)viewController
{
    self.presentedViewController = viewController;
    SCSuspendedViewConfiguration *configuration = self.presentedViewController.sc_suspendedViewConfiguration;
    if (!configuration) return;
    
    switch (configuration.direction) {
        case SCSuspendedViewDirectionTop:
        case SCSuspendedViewDirectionBottom:
        case SCSuspendedViewDirectionLeft:
        case SCSuspendedViewDirectionRight:
        {
            UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
            [self.presentedViewController.view addGestureRecognizer:panGestureRecognizer];
        }
            break;
        
        case SCSuspendedViewDirectionCenter:
        {
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizer:)];
            [self.presentedViewController.view addGestureRecognizer:tapGestureRecognizer];
        }
        default:
            break;
    }
}

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer {
    SCSuspendedViewConfiguration *configuration = self.presentedViewController.sc_suspendedViewConfiguration;
    if (!configuration) return;
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interacting = YES;
            [self.presentedViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGFloat total, part;
            CGSize presentedViewSize = self.presentedViewController.view.bounds.size;
            switch (configuration.direction) {
                case SCSuspendedViewDirectionTop:
                    total = presentedViewSize.height;
                    part = -translation.y;
                    break;
                    
                case SCSuspendedViewDirectionBottom:
                    total = presentedViewSize.height;
                    part = translation.y;
                    break;
                    
                case SCSuspendedViewDirectionLeft:
                    total = presentedViewSize.width;
                    part = -translation.x;
                    break;
                    
                case SCSuspendedViewDirectionRight:
                    total = presentedViewSize.width;
                    part = translation.x;
                    break;
                    
                default:
                    total = 1;
                    part = 1;
                    break;
            }

            CGFloat fraction = part / total;
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.shouldComplete = (fraction > 0.5 || part > 80);
            [self updateInteractiveTransition:fraction];
        }
            break;
        
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            self.interacting = NO;
        }
            break;
            
        default:
            break;
    }
}

- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer
{
    SCSuspendedViewConfiguration *configuration = self.presentedViewController.sc_suspendedViewConfiguration;
    if (!configuration) return;
    if (configuration.direction != SCSuspendedViewDirectionCenter) return;
    
    [self.presentedViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
