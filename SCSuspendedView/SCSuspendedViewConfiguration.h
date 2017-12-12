
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SCSuspendedViewDirection) {
    SCSuspendedViewDirectionCenter = 0,
    SCSuspendedViewDirectionBottom,
    SCSuspendedViewDirectionTop,
    SCSuspendedViewDirectionLeft,
    SCSuspendedViewDirectionRight,
    SCSuspendedViewDirectionCustomer        // 暂时还未实现
};

@interface SCSuspendedViewConfiguration : NSObject

@property (nonatomic, assign) SCSuspendedViewDirection direction;   // 浮层弹出的方向
@property (nonatomic, assign) BOOL transparent;                     // 浮层以外可穿透
@property (nonatomic, assign) BOOL hasGestureRecognizer;            // 滑动手势
@property (nonatomic, strong) UIColor *backgroundMaskColor;         // 浮层以外遮罩颜色
@property (nonatomic, assign) CGRect suspendedViewFrameInWindow;    // 浮层弹出后的位置信息
@property (nonatomic, assign) NSTimeInterval transitionDuration;    // 浮层弹出动画时间

+ (instancetype)defaultConfiguration;
+ (instancetype)configurationWithDirection:(SCSuspendedViewDirection)direction
                               transparent:(BOOL)transparent
                      hasGestureRecognizer:(BOOL)hasGestureRecognizer
                       backgroundMaskColor:(UIColor *)backgroundMaskColor
                suspendedViewFrameInWindow:(CGRect)suspendedViewFrameInWindow
                        transitionDuration:(NSTimeInterval)transitionDuration;

@end
