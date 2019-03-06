//
//  ViewController.m
//  ppp
//
//  Created by zglnbjys on 2019/1/4.
//  Copyright © 2019年 tianyaoqi. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "CustomTextView.h"
@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)NSLock *lock;

@property (nonatomic,strong)UICollectionView *myCollection;

@end

#define App_Width [UIScreen mainScreen].bounds.size.width
#define App_Height [UIScreen mainScreen].bounds.size.height
static NSString *cellId = @"UICollectionViewCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.myCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
//    self.myCollection.alwaysBounceHorizontal = YES;
//    self.myCollection.showsHorizontalScrollIndicator = NO;
//    [self.view addSubview:self.myCollection];
//    [self addChildView];
    
    CustomTextView *textV = [[CustomTextView alloc] initWithFrame:CGRectMake(10, 100, 394, 300)];
    textV.placeHolder = @"测试";
    textV.textCount = 120;
    [self.view addSubview:textV];
    
}

- (void)addChildView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, App_Width, 120)];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
//    [self.myCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
//    [view addSubview:self.myCollection];
    
    FirstViewController *firstVc = [[FirstViewController alloc] init];
//    firstVc.view.frame = CGRectMake(0, 0, App_Width, App_Height - 120);
    [self addChildViewController:firstVc];
    [self.view addSubview:firstVc.view];
}

- (UICollectionView *)myCollection {
    if (!_myCollection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0;
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _myCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 300) collectionViewLayout:layout];
//        _myCollection.pagingEnabled = YES;
        _myCollection.backgroundColor = [UIColor whiteColor];
        _myCollection.delegate = self;
        _myCollection.dataSource = self;
    }
    return _myCollection;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}


@end
