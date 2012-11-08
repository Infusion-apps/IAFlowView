//
//  IATextFlowView.m
//  IAFlowView
//
//  Created by Omar on 11/8/12.
//  Copyright (c) 2012 InfusionApps. All rights reserved.
//

#import "IATextFlowView.h"

@implementation IATextFlowView

- (void) addLabel:(UILabel*)label
{
    //Get the label correct size
    [label sizeToFit];
    
    //Wrap the text inside a button to obtain a touch color status
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:label.text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = label.font;
    
    [super addItem:button withWidth:label.frame.size.width];
}

@end
