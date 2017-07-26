//
//  CustomeDelegateButton.h
//  CustomeButtomWithCallBack
//
//  Created by 方冬冬 on 2017/7/26.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
//二代理模式
@class CustomeDelegateButton;
//定义MyButton要实现的协议, 用于委托回调
@protocol CustomeDelegateButtonDelegate <NSObject>
//可选择的实现
@optional

//当button将要点击时调用
-(void) myButtonWillTap:(CustomeDelegateButton *) sender;

//当button点击后做的事情
-(void) myButtonDidTap: (CustomeDelegateButton *) sender;

//判断button是否可以被点击
-(BOOL) myButtonShouldTap: (CustomeDelegateButton *) sender;

@end


@interface CustomeDelegateButton : UIView

@property(nonatomic,weak)id<CustomeDelegateButtonDelegate>delegate;

@end
