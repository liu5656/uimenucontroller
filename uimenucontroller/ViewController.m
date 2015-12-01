//
//  ViewController.m
//  uimenucontroller
//
//  Created by lj on 15/7/20.
//  Copyright (c) 2015年 lj. All rights reserved.
//

#import "ViewController.h"
#import "ssssViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)click
{
    ssssViewController *view = [[ssssViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

#pragma mark - UIResponder


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        //注册长按事件
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressWebView:)];
        [longPressGesture setDelegate:self];
        //添加到cell
        [cell addGestureRecognizer:longPressGesture];

    }
    
    cell.textLabel.text = @"adfahdhfkj";
    
    
    return cell;
}

//长按后触发该方法
-(void)longPressWebView:(UILongPressGestureRecognizer *)gestureRecognizer
{
    //判断长按状态
    if ([gestureRecognizer state]==UIGestureRecognizerStateBegan)
    {
        //得到按的cell
        UITableViewCell *cell = (UITableViewCell *)gestureRecognizer.view;
        //处理选中问题
        //必须设置为第一响应者
//        [cell becomeFirstResponder];
        
        //得到菜单栏
        UIMenuController *menuController = [UIMenuController sharedMenuController];
//        [menuController setMenuVisible:NO];
        //设置菜单
        UIMenuItem *menuItem1 = [[UIMenuItem alloc] initWithTitle:@"编辑" action:@selector(menuItem:)];
        UIMenuItem *menuItem2 = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(menuItem2:)];
        [menuController setMenuItems:[NSArray arrayWithObjects:menuItem1,menuItem2, nil]];
        //设置菜单栏位置
        [menuController setTargetRect:cell.frame inView:cell.superview];
        
        //显示菜单栏
        [menuController setMenuVisible:YES animated:YES];
        
    }
}

-(void)menuItem:(id)sender
{
    //得到剪切板
//    UIPasteboard *board = [UIPasteboard generalPasteboard];
    
}

-(void)menuItem2:(id)sender
{
    //可实现自定义功能
    ssssViewController *view = [[ssssViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];

}

//哪些菜单能够显示
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(menuItem:) || action == @selector(menuItem2:))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
