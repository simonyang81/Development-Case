//
//  ScrollViewController.m
//  Development Case
//
//  Created by Simon Yang on 11/22/16.
//  Copyright © 2016 Simon Yang. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIScrollView *scrollView = [[UIScrollView alloc] init];

    [scrollView showsHorizontalScrollIndicator];
    [scrollView showsVerticalScrollIndicator];
    [scrollView setScrollEnabled:YES];

    // 控制控件遇到边框是否反弹
    [scrollView setBounces:YES];
    // 控制缩放的时候是否会反弹
    [scrollView setBouncesZoom:YES];
    [scrollView setDelaysContentTouches:YES];
    [scrollView setCanCancelContentTouches:YES];

    [scrollView setMinimumZoomScale:1];
    [scrollView setMaximumZoomScale:4];
    scrollView.delegate = self;

    [self.view addSubview:scrollView];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sample.JPG"]];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [scrollView addSubview:imageView];

    [scrollView mas_makeConstraints: ^(MASConstraintMaker *maker) {
//        [super addMarginTopConstraints:maker withMASAttr:self.view.mas_top];
//        maker.top.equalTo(self.view.mas_top);
        maker.width.equalTo(self.view.mas_width);
        maker.height.equalTo(self.view.mas_height).multipliedBy(.5);
        maker.centerY.equalTo(self.view.mas_centerY);
//        maker.bottom.equalTo(self.view.mas_bottom);
    }];

//    scrollView.frame = CGRectMake(0, self.view.frame.size.height/2, 100, 100);

    NSLog(@"scrollView.frame.size.width: %f", scrollView.frame.size.width);
    NSLog(@"scrollView.frame.size.height: %f", scrollView.frame.size.height);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView.subviews objectAtIndex:0];
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
