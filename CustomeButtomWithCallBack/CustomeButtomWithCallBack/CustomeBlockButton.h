//
//  CustomeBlockButton.h
//  CustomeButtomWithCallBack
//
//  Created by 方冬冬 on 2017/7/26.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomeBlockButton;
typedef void (^ButtonWillAndDidBlock)(CustomeBlockButton *sender);
typedef BOOL (^ButtonShouldBlock) (CustomeBlockButton *sender);

@interface CustomeBlockButton : UIView

/**
  block回调设计
 */

//接受block的方法
-(void)setButtonShouldBlock: (ButtonShouldBlock) block;
-(void)setButtonWillBlock: (ButtonWillAndDidBlock) block;
-(void)setButtonDidBlock:(ButtonWillAndDidBlock) block;
@end
