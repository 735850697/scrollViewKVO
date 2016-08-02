//
//  ViewController.m
//  scrollViewjia
//
//  Created by jiayazi on 16/8/2.
//  Copyright © 2016年 dbjyz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(strong, nonatomic)UIScrollView * scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*2);
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    
    
    /*
        object : 被观察对象
     
     　　observer: 观察对象
     
     　　forKeyPath里面带上property的name，如UIView的frame、center等等
     */
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    //_scrollView.contentOffset
}



#pragma mark - KVO
/*
    keyPath: 对应forKeyPath
 
 　　object:  被观察的对象
 
 　　change:  对应options里的NSKeyValueObservingOptionNew、NSKeyValueObservingOptionOld等

 　　context： 对应context
 
 
 
    NSKeyValueObservingOptionNew 把更改之前的值提供给处理方法
 
 　　NSKeyValueObservingOptionOld 把更改之后的值提供给处理方法
 
 　　NSKeyValueObservingOptionInitial 把初始化的值提供给处理方法，一旦注册，立马就会调用一次。通常它会带有新值，而不会带有旧值。
 
 　　NSKeyValueObservingOptionPrior 分2次调用。在值改变之前和值改变之后。
 
 
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        NSLog(@"object == %@",object);
        
        NSLog(@"context == %@",context);

        
        NSLog(@"change == %@",change);
        
    }
}


- (void)dealloc {
    [_scrollView removeObserver:self forKeyPath:@"currentPage"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
