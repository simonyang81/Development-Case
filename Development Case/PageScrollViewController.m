//
//  PageScrollViewController.m
//  Development Case
//
//  Created by Simon Yang on 11/22/16.
//  Copyright © 2016 Simon Yang. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "PageScrollViewController.h"

@interface PageScrollViewController ()

@end

@implementation PageScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"Page Scroll";

    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image01.jpg"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image02.jpg"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image03.jpg"]];

    [imageView1 setContentMode:UIViewContentModeScaleToFill];
    [imageView2 setContentMode:UIViewContentModeScaleToFill];
    [imageView3 setContentMode:UIViewContentModeScaleToFill];

    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;

//    [scrollView showsVerticalScrollIndicator];
//    [scrollView showsHorizontalScrollIndicator];
    [scrollView setScrollEnabled:YES];
    [scrollView setShowsVerticalScrollIndicator:NO];

//    // 控制控件遇到边框是否反弹
    [scrollView setBounces:YES];
    // 控制缩放的时候是否会反弹
    [scrollView setBouncesZoom:YES];
    [scrollView setDelaysContentTouches:YES];
    [scrollView setCanCancelContentTouches:YES];

    [scrollView setMinimumZoomScale:1];
    [scrollView setMaximumZoomScale:3];

    [self.view addSubview: scrollView];
//    scrollView.frame = self.view.frame;

//    [scrollView setPagingEnabled:YES];

    [scrollView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.width.centerY.mas_equalTo(self.view);
        maker.height.mas_equalTo(self.view).multipliedBy(0.5);
    }];

    [scrollView addSubview:imageView1];
    [scrollView addSubview:imageView2];
    [scrollView addSubview:imageView3];

    [imageView1 mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.height.mas_equalTo(self.view.mas_height).multipliedBy(0.5);
        maker.centerY.mas_equalTo(@[self.view, imageView2, imageView3]);
        maker.width.mas_equalTo(self.view).offset(-30);
    }];

    [imageView2 mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.left.mas_equalTo(imageView1.mas_right);
        maker.height.mas_equalTo(self.view).multipliedBy(0.5);
        maker.width.mas_equalTo(self.view).offset(-30);
    }];

    [imageView3 mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.left.mas_equalTo(imageView2.mas_right);
        maker.height.mas_equalTo(self.view).multipliedBy(0.5);
        maker.width.mas_equalTo(self.view).offset(-30);
    }];


    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];

    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面的代码才起作用
    [self.view updateConstraintsIfNeeded];

    // 如果要更新frame，需要调用layoutIfNeeded函数进行布局，然后所约束的控件才会按照约束条件，
    // 生成当前布局相应的frame和bounds
    [self.view layoutIfNeeded];

    NSLog(@"imageView1.frame.size.width: %f", imageView1.frame.size.width);
    NSLog(@"imageView2.frame.size.width: %f", imageView2.frame.size.width);
    NSLog(@"imageView3.frame.size.width: %f", imageView3.frame.size.width);

    NSLog(@"scrollView.frame.origin.y: %f", scrollView.frame.origin.y);
    NSLog(@"scrollView.frame.size.height: %f", scrollView.frame.size.height);
    NSLog(@"scrollView.frame.size.width: %f", scrollView.frame.size.width);

    [scrollView setContentSize:CGSizeMake(imageView1.frame.size.width
            + imageView2.frame.size.width
            + imageView3.frame.size.width, scrollView.frame.size.height)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

//    // 告诉self.view约束需要更新
//    [self.view setNeedsUpdateConstraints];
//    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
//    [self.view updateConstraintsIfNeeded];

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
