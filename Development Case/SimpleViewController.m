//
//  SimpleViewController.m
//  Development Case
//
//  Created by Simon Yang on 11/25/16.
//  Copyright © 2016 Simon Yang. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "SimpleViewController.h"

@interface SimpleViewController ()

@end

@implementation SimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"Simple View";

    UISlider *slider = [[UISlider alloc] init];
    [slider setMinimumValue:0];
    [slider setMaximumValue:1];
    [slider setValue:0.5 animated:YES];
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];

    UISwitch *uiSwitch = [[UISwitch alloc] init];
    [uiSwitch setOn:YES animated:YES];

    UITextField *textField = [[UITextField alloc] init];
    textField.borderStyle = UITextBorderStyleRoundedRect;

    NSMutableArray *uiViews = @[slider, uiSwitch, textField];
    [super addView:uiViews toSuperView:self.view];

    [slider mas_makeConstraints:^(MASConstraintMaker *maker) {
        [super addMarginTopConstraints:maker withMASAttr:self.view.mas_top];
        maker.width.mas_equalTo(self.view).multipliedBy(.5);//.multipliedBy(.5);
        maker.centerX.mas_equalTo(self.view);
        maker.centerX.mas_equalTo(uiViews);
    }];

    [uiSwitch mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.top.mas_equalTo(slider.mas_bottom).offset(10);
    }];

    [textField mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.top.mas_equalTo(uiSwitch.mas_bottom).offset(10);
        maker.width.mas_equalTo(self.view).multipliedBy(.618);
    }];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) valueChanged:(UISlider *)sender{
    NSLog(@"Slider Value: %f", sender.value);
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
