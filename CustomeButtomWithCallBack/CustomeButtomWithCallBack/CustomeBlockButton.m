//
//  CustomeBlockButton.m
//  CustomeButtomWithCallBack
//
//  Created by 方冬冬 on 2017/7/26.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "CustomeBlockButton.h"
@interface CustomeBlockButton()
//接受block块
@property (nonatomic, strong) ButtonWillAndDidBlock willBlock;
@property (nonatomic, strong) ButtonWillAndDidBlock didBlock;
@property (nonatomic, strong) ButtonShouldBlock shouldBlock;
//按钮状态
@property(nonatomic,assign)BOOL buttonState;

@end
@implementation CustomeBlockButton

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
    }

    return self;
}

-(void)setButtonShouldBlock: (ButtonShouldBlock) block{
    
    self.shouldBlock = block;
    

}
-(void)setButtonWillBlock: (ButtonWillAndDidBlock) block{
    
    self.willBlock = block;

}
-(void)setButtonDidBlock:(ButtonWillAndDidBlock) block{

    self.didBlock = block;

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸对象对象
    UITouch *touche = [touches anyObject];
    //获取touches的位置
    CGPoint point = [touche locationInView:self];
    
    //判断点是否在button中
    if (CGRectContainsPoint(self.bounds, point)){
        //block回调
        if (self.shouldBlock) {
            //block回调获取按钮状态
            _buttonState = self.shouldBlock(self);
        }
        //block回调实现willTap
        if (self.willBlock)
        {
            self.willBlock(self);
        }
        
        //block回调
        if (self.didBlock) {
            self.didBlock(self);
        }

    }
}
@end
