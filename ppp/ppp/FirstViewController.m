//
//  FirstViewController.m
//  ppp
//
//  Created by zglnbjys on 2019/1/6.
//  Copyright © 2019年 tianyaoqi. All rights reserved.
//

#import "FirstViewController.h"
#define App_Width [UIScreen mainScreen].bounds.size.width
#define App_Height [UIScreen mainScreen].bounds.size.height
@interface FirstViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *mytable;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}


- (void)initView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 120, App_Width, App_Height - 120 )];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    [view addSubview:self.mytable];
}

- (UITableView *)mytable {
    if (!_mytable) {
        _mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 120) style:UITableViewStylePlain];
        _mytable.delegate = self;
        _mytable.dataSource = self;
        
    }
    return _mytable;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = @"dddd";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
