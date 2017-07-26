//
//  ViewController.m
//  CustomeButtomWithCallBack
//
//  Created by 方冬冬 on 2017/7/26.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ViewController.h"
#import "CustomeButton.h"

#import "CustomeDelegateButton.h"

#import "CustomeBlockButton.h"

@interface ViewController ()<CustomeDelegateButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"iOS开发之自定义Button(集成三种回调模式)";
    
    
    CustomeButton *button = [[CustomeButton alloc] initWithFrame:CGRectMake(200, 200, 80, 80)];
    
    [button addTarget:self action:@selector(buttonClick)];
    
    [self.view addSubview:button];
    
    
    
    
    CustomeDelegateButton *buttonTwo = [[CustomeDelegateButton alloc] initWithFrame:CGRectMake(200, 340, 100, 100)];
    
    
    buttonTwo.delegate = self;
    
    
    [self.view addSubview:buttonTwo];
    
    
    
    CustomeBlockButton *buttonThree = [[CustomeBlockButton alloc] initWithFrame:CGRectMake(180, 500, 100, 100)];
    
    [self.view addSubview:buttonThree];
    
    
    
    
    [buttonThree setButtonDidBlock:^(CustomeBlockButton *sender) {
        NSLog(@"我是did: will方法");

    }];
    
    
    
    [buttonThree setButtonWillBlock:^(CustomeBlockButton *sender) {
        NSLog(@"我是block: will方法");

    }];
    
    [buttonThree setButtonShouldBlock:^BOOL(CustomeBlockButton *sender) {
          return YES;
    }];
    
    
    
    
}

- (void)buttonClick{
    

    

}


//当button将要点击时调用
-(void) myButtonWillTap:(CustomeDelegateButton *) sender{

    NSLog(@"我是Delegate: will方法");


}

//当button点击后做的事情
-(void) myButtonDidTap: (CustomeDelegateButton *) sender{
    
    
    NSLog(@"我是Delegate: did方法");

}

//判断button是否可以被点击
-(BOOL) myButtonShouldTap: (CustomeDelegateButton *) sender{

    NSLog(@"我是Delegate：should方法");

    //按钮可以被点击
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
