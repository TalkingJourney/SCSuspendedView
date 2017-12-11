
#import <UIKit/UIKit.h>
#import "SCSuspendedViewConfiguration.h"

@interface UIViewController (SCSuspendedView)

@property (nonatomic, strong) SCSuspendedViewConfiguration *sc_suspendedViewConfiguration;

- (void)sc_makeSuspendedView;

@end
