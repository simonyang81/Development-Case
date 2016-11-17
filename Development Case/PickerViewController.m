//
//  PickerViewController.m
//  Development Case
//
//  Created by Simon Yang on 11/17/16.
//  Copyright © 2016 Simon Yang. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "PickerViewController.h"

@interface PickerViewController ()

@property (retain, nonatomic) NSMutableArray *pickerData;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"Picker View";

    if (self.pickerData == nil) {
        self.pickerData = [[NSMutableArray alloc] init];
    }
    [self.pickerData addObject:@"亚洲"];
    [self.pickerData addObject:@"非洲"];
    [self.pickerData addObject:@"欧洲"];
    [self.pickerData addObject:@"美洲"];
    [self.pickerData addObject:@"大洋洲"];
    [self.pickerData addObject:@"南极洲"];

    UIPickerView *pickerView = [[UIPickerView alloc] init];
    [pickerView setDataSource:self];
    [pickerView setDelegate:self];

    [self.view addSubview:pickerView];

    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];

    [label setText:@"Picker View:"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];

    [label mas_makeConstraints:^(MASConstraintMaker *maker){

        maker.width.equalTo(self.view.mas_width).multipliedBy(.5);
        maker.centerX.equalTo(self.view.mas_centerX);
        maker.top.equalTo(self.view.mas_top).offset(self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 10);

    }];

    [pickerView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.width.equalTo(self.view.mas_width);
        maker.centerX.equalTo(self.view.mas_centerX);
        maker.top.equalTo(label.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerData count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"You selected: %@", self.pickerData[row]);
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
