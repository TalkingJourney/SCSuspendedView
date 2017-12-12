
#import "SCSuspendedViewConfiguration.h"

#define SCSuspendedViewDefaultBackgroundMaskColor [UIColor clearColor]
#define SCSuspendedViewDefaultRect  CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width / 2, UIScreen.mainScreen.bounds.size.height / 2)
#define SCSuspendedViewDefaultTransitionDuration 0.25

@implementation SCSuspendedViewConfiguration

+ (instancetype)defaultConfiguration
{
    return [self configurationWithDirection:SCSuspendedViewDirectionCenter
                                transparent:NO
                       hasGestureRecognizer:YES
                        backgroundMaskColor:SCSuspendedViewDefaultBackgroundMaskColor
                 suspendedViewFrameInWindow:SCSuspendedViewDefaultRect
                         transitionDuration:SCSuspendedViewDefaultTransitionDuration];
}

+ (instancetype)configurationWithDirection:(SCSuspendedViewDirection)direction
                               transparent:(BOOL)transparent
                      hasGestureRecognizer:(BOOL)hasGestureRecognizer
                       backgroundMaskColor:(UIColor *)backgroundMaskColor
                suspendedViewFrameInWindow:(CGRect)suspendedViewFrameInWindow
                        transitionDuration:(NSTimeInterval)transitionDuration
{
    SCSuspendedViewConfiguration *configuration = [[self alloc] init];
    if (!configuration) return nil;
    
    configuration.direction = direction;
    configuration.transparent = transparent;
    configuration.hasGestureRecognizer = hasGestureRecognizer;
    configuration.backgroundMaskColor = backgroundMaskColor ?: SCSuspendedViewDefaultBackgroundMaskColor;
    configuration.suspendedViewFrameInWindow = suspendedViewFrameInWindow;
    configuration.transitionDuration = transitionDuration > 0 ? transitionDuration : SCSuspendedViewDefaultTransitionDuration;
    return configuration;
}

@end
