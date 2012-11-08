IAFlowView
==========

Simple iOS flow or floating view implementation.

How does this work
================
First:
You specify the <code>itemHeight</code> for all the itmes that you want to add to the flowview.

    self.flowView.itemHeight = 20;

Second:
Create the any subclass of <code>UIView</code> and add it to the flow view
You dont specify the frame of this view, since the flow view will calculate the frame at runtime.
You will only need to specify the width of the added view

    UIView *viewToAdd = [[UIView alloc] init];
    viewToAdd.backgroundColor = [UIColor redColor];
    viewToAdd.tag = 0;
    [self.flowView addItem:viewToAdd withWidth:220];

Thats it, now the views will be added to the flow view.

Third (Optional):
You can set the delegate of the flow view to recieve touch event on the added views.

    self.flowView.delegate = self;

The delegete function will be called when views are tapped

    - (void)flowView:(IAFlowView *)flowView didPressView:(UIView *)view
    {
    }

Additional notes:
================
A subclass of IAFlowView, IATextFlowView is used to add labels inside the flowview, 
this object will calculate the correct text size for the label and place the label accordingly

To use it simple call (note that we dont specify any dimensions for the UILabel)

    UILabel *label = [[UILabel alloc] init];
    label.text = @"Hello!!!";
    [self.textFlowView addLabel:label];
