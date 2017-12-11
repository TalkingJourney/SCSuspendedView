
#import <UIKit/UIKit.h>

@interface SCSuspendedViewInteractionController : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController*)viewController; 

@end
