//
//  BasViewController.h
//  Development Case
//
//  Created by Simon Yang on 11/17/16.
//  Copyright © 2016 Simon Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MASConstraintMaker;
@class MASConstraintMaker;
@class MASViewAttribute;

@interface BasViewController : UIViewController

-(void)addMarginTopConstraints:(MASConstraintMaker *)maker withMASAttr:(MASViewAttribute *) attribute;

-(void)addView:(NSArray *)subView toSuperView:(UIView *)superView;

@end
