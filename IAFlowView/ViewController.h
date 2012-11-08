//
//  ViewController.h
//  IAFlowView
//
//  Created by Omar on 11/8/12.
//  Copyright (c) 2012 InfusionApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IATextFlowView.h"

@interface ViewController : UIViewController <IAFlowViewDelegate>
@property (weak, nonatomic) IBOutlet IAFlowView *flowView;

@property (weak, nonatomic) IBOutlet IATextFlowView *textFlowView;

@end
