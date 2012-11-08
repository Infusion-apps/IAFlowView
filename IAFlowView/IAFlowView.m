//
//  IAFlowView.m
//  IAFlowView
//
//  Created by Omar on 11/8/12.
//  Copyright (c) 2012 InfusionApps. All rights reserved.
//

#import "IAFlowView.h"

@interface IAFlowView ()
{
    NSMutableArray *items;
    float xPosition;
    float rowNumber;
    
    //Defines?
    float horizontalSpacing;
    float horizontalMargins;    
    float verticalSpacing;
    float verticalMargins;
}

@end

@implementation IAFlowView
@synthesize itemHeight;
@synthesize rightToLeft;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initParams];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initParams];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initParams];
}

- (void) initParams
{
    items = [[NSMutableArray alloc] init];
    rightToLeft = NO;
    
    horizontalSpacing = 5;
    horizontalMargins = 5;
    
    verticalSpacing = 5;
    verticalMargins = 5;
    
    xPosition = horizontalMargins;
    rowNumber = 0;
}

- (void)setRightToLeft:(BOOL)value
{
    rightToLeft = value;
    
    if (rightToLeft)
    {
        xPosition = self.frame.size.width - horizontalMargins;
    }
    else
    {
        xPosition = horizontalMargins;
    }
}

- (void) addItem:(UIView*)view
       withWidth:(float) itemWidth
{
    //Get the current x position
    
    //Check if the item fits in the current row
    if([self checkItemFitsInCurrentRow:itemWidth])
    {
        //If item checks place it
        [self addSubview:view];
        [self addGestureOnView:view];
        
        //Calculate the y position
        CGRect rect = [self rectForItemWithWidth:itemWidth];
        view.frame = rect;
        
        //Change the x position
        if(rightToLeft)
            xPosition = xPosition - itemWidth - horizontalSpacing;
        else
            xPosition = xPosition + itemWidth + horizontalSpacing;
    }
    else
    {
        //Reset the x position
        self.rightToLeft = rightToLeft;
        
        //Feed one more row
        rowNumber ++;
        
        //Call add item recursevly
        [self addItem:view withWidth:itemWidth];
    }
}

- (void) clearItems
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (float) yPoitionForItem
{
    float yPosition;
    
    if(rowNumber == 0)
        yPosition = verticalMargins;
    else
        yPosition = verticalMargins + (rowNumber * (itemHeight + verticalSpacing));
    
    return yPosition;
}

- (CGRect) rectForItemWithWidth:(float)itemWidth
{
    float yPosition = [self yPoitionForItem];
    CGRect rect;
    
    if(rightToLeft)
        rect = CGRectMake(xPosition - itemWidth, yPosition,
                          itemWidth, itemHeight);
    else
        rect = CGRectMake(xPosition, yPosition,
                          itemWidth, itemHeight);
    
    return rect;
}

- (BOOL) checkItemFitsInCurrentRow:(float)itemWidth
{
    BOOL fits;
    
    if(rightToLeft)
    {
        float xFinalPosition;
        float minXPosition;
        //Add the current width to the x position
        xFinalPosition = xPosition - itemWidth - horizontalMargins;
        
        //Check if its equal to the
        minXPosition = horizontalMargins;
        
        fits = xFinalPosition > minXPosition;
    }
    else
    {
        float xFinalPosition;
        float maxXPosition;
        
        //Add the current width to the x position
        xFinalPosition = xPosition + itemWidth + horizontalMargins;
        
        //Check if its equal to the
        maxXPosition = self.frame.origin.x + self.frame.size.width;
        
        fits = xFinalPosition < maxXPosition;
    }
    
    return fits;
}

- (void) addGestureOnView:(UIView*)view
{
    if([view isKindOfClass:[UIButton class]])
    {
        UIButton *button = (UIButton*)view;
        [button addTarget:self action:@selector(didTapItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if ([view isKindOfClass:[UIView class]]) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        [view addGestureRecognizer:tapGesture];
        [tapGesture addTarget:self action:@selector(didTapItem:)];
    }
}

- (void) didTapItem:(id) sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton*)sender;
        [delegate flowView:self didPressView:button];
    }
    else
    {
        UIGestureRecognizer *recognizer = (UIGestureRecognizer *)sender;
        [delegate flowView:self didPressView:recognizer.view];
    }
}


@end
