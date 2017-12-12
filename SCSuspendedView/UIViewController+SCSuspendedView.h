
#import <UIKit/UIKit.h>
#import "SCSuspendedViewConfiguration.h"

@interface UIViewController (SCSuspendedView)

// 浮层配置信息，在初始化时设置，必须在viewDidLoad之前
@property (nonatomic, strong) SCSuspendedViewConfiguration *sc_suspendedViewConfiguration;

// 必须在你要设置的VC的初始化方法里调用
- (void)sc_makeSuspendedView;

@end
