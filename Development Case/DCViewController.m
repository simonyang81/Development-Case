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
#import "ScrollViewController.h"
#import "PageScrollViewController.h"

@interface DCViewController ()

@end

@implementation DCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"Practice";

    UISlider *slider = [[UISlider alloc] init];
    [slider setMinimumValue:0];
    [slider setMaximumValue:1];
    [slider setValue:0.5 animated:YES];

    [self.view addSubview:slider];

    [slider mas_makeConstraints:^(MASConstraintMaker *maker){
        [super addMarginTopConstraints:maker withMASAttr:self.view.mas_top];
        maker.centerX.mas_equalTo(self.view);
        maker.width.mas_equalTo(self.view).multipliedBy(.5);//.multipliedBy(.5);
    }];

    UISwitch *uiSwitch = [[UISwitch alloc] init];
    [uiSwitch setOn:YES animated:YES];

    [self.view addSubview:uiSwitch];

    [uiSwitch mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.top.equalTo(slider.mas_bottom).offset(10);
        maker.centerX.equalTo(self.view.mas_centerX);
    }];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:button];

    [button setTitle:@"Show PickerView" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];

    [button mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.centerX.equalTo(self.view.mas_centerX);
        maker.top.equalTo(uiSwitch.mas_bottom).offset(10);
    }];

    [button addTarget:self action:@selector(gotoPickerView) forControlEvents:UIControlEventTouchUpInside];
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];

    UIButton *imgBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [imgBtn setTitle:@"Scroll View" forState:UIControlStateNormal];
    imgBtn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    [self.view addSubview:imgBtn];
    [imgBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.centerX.mas_equalTo(self.view);
        maker.top.equalTo(button.mas_bottom).offset(10);
    }];


    [imgBtn addTarget:self action:@selector(gotoImageView) forControlEvents:UIControlEventTouchUpInside];

    UIButton *pageScrollBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pageScrollBtn setTitle:@"Page Scroll View" forState:UIControlStateNormal];
    pageScrollBtn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    [self.view addSubview:pageScrollBtn];

    [pageScrollBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.centerX.mas_equalTo(self.view);
        maker.top.equalTo(imgBtn.mas_bottom).offset(10);
    }];

    [pageScrollBtn addTarget:self action:@selector(gotoPageScrollView) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (IBAction) gotoPickerView {
    PickerViewController *controller = [[PickerViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction) valueChanged:(UISlider *)sender{
    NSLog(@"Slider Value: %f", sender.value);
}

- (IBAction) gotoImageView {
    ScrollViewController *controller = [[ScrollViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction) gotoPageScrollView {
    PageScrollViewController *controller = [[PageScrollViewController alloc] init];
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
