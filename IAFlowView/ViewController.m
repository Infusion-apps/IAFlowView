//
//  ViewController.m
//  IAFlowView
//
//  Created by Omar on 11/8/12.
//  Copyright (c) 2012 InfusionApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.flowView.itemHeight = 20;
    self.flowView.delegate = self;
    
    UIView *viewToAdd;
    
    viewToAdd = [[UIView alloc] init];
    viewToAdd.backgroundColor = [UIColor redColor];
    viewToAdd.tag = 0;
    [self.flowView addItem:viewToAdd withWidth:150];
    
    viewToAdd = [[UIView alloc] init];
    viewToAdd.backgroundColor = [UIColor redColor];
    viewToAdd.tag = 1;
    [self.flowView addItem:viewToAdd withWidth:100];
    
    viewToAdd = [[UIView alloc] init];
    viewToAdd.backgroundColor = [UIColor redColor];
    viewToAdd.tag = 2;
    [self.flowView addItem:viewToAdd withWidth:220];
    
    viewToAdd = [[UIView alloc] init];
    viewToAdd.backgroundColor = [UIColor redColor];
    viewToAdd.tag = 3;
    [self.flowView addItem:viewToAdd withWidth:100];
        
    self.textFlowView.itemHeight = 20;
    self.textFlowView.delegate = self;
    
    UILabel *label;
    
    label = [[UILabel alloc] init];
    label.text = @"Word1";
    [self.textFlowView addLabel:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Some_really_long_scentence";
    [self.textFlowView addLabel:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Word2";
    [self.textFlowView addLabel:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Hello!!!";
    [self.textFlowView addLabel:label];
}

- (void)flowView:(IAFlowView *)flowView didPressView:(UIView *)view
{
    UIAlertView *alertView;
    if([flowView isKindOfClass:[IATextFlowView class]])
    {
        UIButton *button = (UIButton*)view;
        alertView = [[UIAlertView alloc] initWithTitle:@"Flow View"
                                               message:[button titleForState:UIControlStateNormal]
                                              delegate:nil
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"Ok", nil];
    }
    else
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"Flow View"
                                               message:[NSString stringWithFormat:@"View with tag %d was pressed", view.tag]
                                              delegate:nil
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"Ok", nil];
    }
    
    [alertView show];
}

@end
