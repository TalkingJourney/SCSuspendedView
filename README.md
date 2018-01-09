# SCSuspendedView
SCSuspendedView provide a suspended view with transition animation.

# 功能
从上下左右中弹出一个浮层，可以遮挡或不遮挡层级下的ViewController，写了一个控件[SCSuspendedView](https://github.com/TalkingJourney/SCSuspendedView)，实现如下图效果。
![Demo动图.gif](https://github.com/TalkingJourney/SCSuspendedView/blob/master/SCSuspendedViewDemo/Snapshots/demo.gif)

# 优点
1. 可以从任意方向弹出，弹出浮层的位置、圆角等信息可以自定义；
2. 浮层可以添加手势隐藏；
3. 浮层可以选择是否遮挡层级下面的ViewController。

# 使用方法（可参考demo）
## 1.必须在你要设置的VC的初始化方法里调用sc_makeSuspendedView方法；
## 2.必须在viewDidLoad之前，设置浮层配置信息sc_suspendedViewConfiguration属性。

# 结束
[SCSuspendedView](https://github.com/TalkingJourney/SCSuspendedView)使用接口简单方便，可以通过Pod导入到项目中。对于这个小控件有什么建议或者意见的话，可以向我反馈，喜欢的话，也可以通过star来鼓励下我，谢谢大家捧场。
