//
//  CustomeButton.m
//  CustomeButtomWithCallBack
//
//  Created by 方冬冬 on 2017/7/26.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#import "CustomeButton.h"


@interface CustomeButton()

@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL action;

@end
@implementation CustomeButton


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)addTarget:target action:(SEL)action{
    //接受外部传来的  target 和action
    self.target = target;
    
    self.action = action;
    
}
//当button点击结束时，如果结束点在button区域中执行action方法
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取触摸对象
    UITouch *touche = [touches anyObject];
    //获取touche的位置
    CGPoint point = [touche locationInView:self];
    
    //判断点是否在button中
    if (CGRectContainsPoint(self.bounds, point))
    {
        //执行action
        if (!_target) { return; }
        NSString *methodName = NSStringFromSelector(_action);
        SEL selector = NSSelectorFromString(methodName);
        IMP imp = [_target methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        func(_target, selector);

    }
    
}

@end
