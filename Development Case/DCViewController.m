//
//  DCViewController.m
//  Development Case
//
//  Created by Simon Yang on 11/16/16.
//  Copyright © 2016 Simon Yang. All rights reserved.
//

#import <Masonry/MASConstraintMaker.h>
#import <Masonry/View+MASAdditions.h>
#import "DCViewController.h"
#import "PickerViewController.h"

@interface DCViewController ()

@end

@implementation DCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"Practice";
    self.view.backgroundColor = UIColor.whiteColor;

//    UILabel *label = [[UILabel alloc] init];
//    [self.view addSubview:label];
////    [label setTextColor: UIColor.blackColor];
//
////    UIFont *font = [[UIFont alloc] init];
////    [label setFont:];
//
////    label.frame = CGRectMake(50, 50, 50, 21);
//
//    [label setText:@"Simon's practice"];
//    [label setTextAlignment:NSTextAlignmentCenter];
//    [label setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
//
//    [label mas_makeConstraints:^(MASConstraintMaker *maker){
//        maker.width.equalTo(self.view.mas_width).multipliedBy(0.5);
//        maker.centerX.equalTo(self.view.mas_centerX);
//        maker.top.equalTo(self.view.mas_top).offset(
//                self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 10);
//
//    }];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:button];

    [button setTitle:@"Show PickerView" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];

    [button mas_makeConstraints:^(MASConstraintMaker *maker){
//        maker.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        maker.centerX.equalTo(self.view.mas_centerX);
        maker.top.equalTo(self.view.mas_top)
                .offset(self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 10);
    }];

    [button addTarget:self action:@selector(gotoPickerView) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void) gotoPickerView {
    PickerViewController *controller = [[PickerViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
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
