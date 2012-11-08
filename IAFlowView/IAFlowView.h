//
//  IAFlowView.h
//  IAFlowView
//
//  Created by Omar on 11/8/12.
//  Copyright (c) 2012 InfusionApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IAFlowView;
@protocol IAFlowViewDelegate <NSObject>
- (void) flowView:(IAFlowView*)flowView
     didPressView:(UIView*)view;
@end

@interface IAFlowView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, assign) float itemHeight;
@property (nonatomic, assign) BOOL rightToLeft;
@property (nonatomic, assign) id<IAFlowViewDelegate> delegate;

- (void) addItem:(UIView*)view
       withWidth:(float) itemWidth;
- (void) clearItems;
@end
