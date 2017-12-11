
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SCSuspendedViewDirection) {
    SCSuspendedViewDirectionCenter = 0,
    SCSuspendedViewDirectionBottom,
    SCSuspendedViewDirectionTop,
    SCSuspendedViewDirectionLeft,
    SCSuspendedViewDirectionRight,
    SCSuspendedViewDirectionCustomer
};

@interface SCSuspendedViewConfiguration : NSObject

@property (nonatomic, assign) SCSuspendedViewDirection direction;
@property (nonatomic, assign) BOOL transparent;
@property (nonatomic, strong) UIColor *backgroundMaskColor;
@property (nonatomic, assign) CGRect suspendedViewFrameInWindow;
@property (nonatomic, assign) NSTimeInterval transitionDuration;

+ (instancetype)defaultConfiguration;
+ (instancetype)configurationWithDirection:(SCSuspendedViewDirection)direction
                               transparent:(BOOL)transparent
                       backgroundMaskColor:(UIColor *)backgroundMaskColor
                suspendedViewFrameInWindow:(CGRect)suspendedViewFrameInWindow
                        transitionDuration:(NSTimeInterval)transitionDuration;

@end
