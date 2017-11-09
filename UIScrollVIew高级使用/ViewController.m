//
//  ViewController.m
//  UIScrollVIew高级使用
//
//  Created by zh dk on 2017/8/22.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    scrollview = [[UIScrollView alloc] init];
    scrollview.frame = CGRectMake(10, 50, 300, 400);
    //取消弹动效果
    scrollview.bounces = NO;
    
    //是否允许点击屏幕让滚动视图响应事
//    scrollview.userInteractionEnabled = NO;
    //设置画布大小，纵向效果
    scrollview.contentSize =CGSizeMake(300, 400*6);
    for(int i=0;i<6;i++){
        NSString *strName = [NSString stringWithFormat:@"%d.jpg",i+1];
        UIImage *image = [UIImage imageNamed:strName];
        //创建图像视图对象
        UIImageView *imgView = [[UIImageView alloc] init];
        //图像赋值
        imgView.image = image;
        //设置图像视图在滚动视图画布中的位置
        imgView.frame = CGRectMake(0, 400*i, 300, 400);
        [scrollview addSubview:imgView];
        
    }
    
    [self.view addSubview:scrollview];
    
    //滚动视图画布的移动位置，偏移位置；决定画布显示图像的最终结果
    scrollview.contentOffset = CGPointMake(0, 0);
    //将当前视图控制器作为代理对象
    scrollview.delegate = self;
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //让滚动视图移动到指定位置，动画移动
    [scrollview scrollRectToVisible:CGRectMake(0, 0, 300, 400) animated:true];
}
//当滚动视图移动时，只要offset坐标发生变化，都会调用此函数
-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"y= %f",scrollView.contentOffset.y);
}

//当滚动视图结束拖动时调用此函数
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"Did end drag!");
}

//当滚动视图即将开始被拖动时调用
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"willbeginDrag");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
