//
//  ssssViewController.m
//  uimenucontroller
//
//  Created by lj on 15/7/20.
//  Copyright (c) 2015年 lj. All rights reserved.
//

#import "ssssViewController.h"

@interface ssssViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation ssssViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];

    //注册长按事件
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressWebView:)];
    //添加到cell
    [_tableview addGestureRecognizer:longPressGesture];

}

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


- (void)longPressWebView:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [sender locationInView:_tableview];
        NSIndexPath *indexpath = [_tableview indexPathForRowAtPoint:point];
        UITableViewCell *cell = [_tableview cellForRowAtIndexPath:indexpath];
        
        [cell becomeFirstResponder];
        //得到菜单栏
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setMenuVisible:NO];
        //设置菜单
        UIMenuItem *menuItem1 = [[UIMenuItem alloc] initWithTitle:@"编辑2" action:@selector(menuItem:)];
        UIMenuItem *menuItem2 = [[UIMenuItem alloc] initWithTitle:@"删除2" action:@selector(menuItem2:)];
        [menuController setMenuItems:[NSArray arrayWithObjects:menuItem1,menuItem2, nil]];
        //设置菜单栏位置
//        [menuController setTargetRect:cell.frame inView:cell.superview];
        [menuController setTargetRect:CGRectMake(0, 0, 100, 100) inView:cell.superview];

        //显示菜单栏
        [menuController setMenuVisible:YES animated:YES];

    }
}

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
    static NSString *CellIdentifier = @"Cell2";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        
    }
    
    cell.textLabel.text = @"adfahdhfkj";
    
    
    return cell;
}

-(void)menuItem:(id)sender
{
    //得到剪切板
    //    UIPasteboard *board = [UIPasteboard generalPasteboard];
    
}

-(void)menuItem2:(id)sender
{
    //可实现自定义功能
}


- (BOOL)becomeFirstResponder
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
