//
//  CustomeDelegateButton.m
//  CustomeButtomWithCallBack
//
//  Created by 方冬冬 on 2017/7/26.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "CustomeDelegateButton.h"

@interface CustomeDelegateButton ()
//按钮状态
@property(nonatomic,assign)BOOL buttonState;
@end

@implementation CustomeDelegateButton



- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸对象对象
    UITouch *touche = [touches anyObject];
    //获取touches的位置
    CGPoint point = [touche locationInView:self];
    
    //判断点是否在button中
    if (CGRectContainsPoint(self.bounds, point))
    {
        if ([self.delegate respondsToSelector:@selector(myButtonShouldTap:)]) {
            //如果实现了，就获取button的状态
            _buttonState = [self.delegate myButtonShouldTap:self];
        }
    }
    
    //根据按钮的状态来做处理
    if (_buttonState)
    {
        //如果myButtonWillTap被实现啦，此时我们就实现myButtonWillTapf方法
        if ([self.delegate respondsToSelector:@selector(myButtonWillTap:)])
        {
            [self.delegate myButtonWillTap:self];
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸对象对象
    UITouch *touche = [touches anyObject];
    //获取touches的位置
    CGPoint point = [touche locationInView:self];
    
    //判断点是否在button中
    if (CGRectContainsPoint(self.bounds, point)){
        if ([self.delegate respondsToSelector:@selector(myButtonDidTap:)]) {
            
            [self.delegate myButtonDidTap:self];
        }
    
    }
}

@end
