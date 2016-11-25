//
//  BasViewController.m
//  Development Case
//
//  Created by Simon Yang on 11/17/16.
//  Copyright © 2016 Simon Yang. All rights reserved.
//

#import <Masonry/MASConstraintMaker.h>
#import <Masonry/MASViewAttribute.h>
#import "BasViewController.h"

@interface BasViewController ()

@end

@implementation BasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addMarginTopConstraints:(MASConstraintMaker *)maker withMASAttr:(MASViewAttribute *)attribute {
    maker.top.equalTo(attribute)
            .offset(self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 10);
}

- (void)addView:(NSArray *)subView toSuperView:(UIView *)superView {

    for (int i = 0; i < [subView count]; ++i) {
        [superView addSubview:[subView objectAtIndex:i]];
    }

}



//- (void)mas_makeConstraints:(MASConstraintMaker *)maker superView:(UIView *)view offset:(CGFloat)offset {
//
//    maker.top.equalTo(view.mas_top)
//            .offset(self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 10);
//
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
