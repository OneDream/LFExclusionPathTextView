//
//  LFExclusionPathTextViewController.m
//  Pods
//
//  Created by linxiaobin on 15/6/12.
//
//

#import "LFExclusionPathTextViewController.h"
#import <UIKit/UITextView.h>
#import "LFExclusionPathTextView.h"

@implementation LFExclusionPathTextViewController
{
    UITextView *mTextView;
    NSTextStorage *mStorage;
    NSTextContainer *mTextContainer;
    LFExclusionPathTextView *exclusionView;
}

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // rect
    CGRect textViewRect = CGRectMake(5, 80, 310, 380);
    
    NSDictionary* attrs = @{NSFontAttributeName:
                                [UIFont preferredFontForTextStyle:UIFontTextStyleBody]};
    NSAttributedString* attrString = [[NSAttributedString alloc]
                                      initWithString:@"Furthermore, exclusion paths can be as simple or as complicated as you want. Need to render text in the shape of a star or a butterfly? As long as you can define the path, exclusionPaths will handle it without problem!As the text container notifies the layout manager when an exclusion path is changed, dynamic or even animated exclusions paths are possible to implement — just don’t expect your user to appreciate the text moving around on the screen as they’re trying to read!"
                                      attributes:attrs];
    
    // Text Storage
    mStorage = [[NSTextStorage alloc] init];
    [mStorage appendAttributedString:attrString];
    
    // Layout Manager
    NSLayoutManager *mLayoutMange = [[NSLayoutManager alloc] init];
    [mStorage addLayoutManager:mLayoutMange];
    
    // Text Container
    mTextContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(CGRectGetWidth(textViewRect), CGFLOAT_MAX)];
    [mLayoutMange addTextContainer:mTextContainer];
    
    // Text View
    mTextView = [[UITextView alloc] initWithFrame:textViewRect textContainer:mTextContainer];
    //    mTextView.delegate = self;
    mTextView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    mTextView.layer.borderWidth = 1.0;
    [self.view addSubview:mTextView];
    
    // LFExclusionPathTextView
    exclusionView = [[LFExclusionPathTextView alloc] initWithFrame:CGRectMake(50, 200, 50, 50)];
    exclusionView.backgroundColor = [UIColor clearColor];
    exclusionView.layer.borderWidth = 1;
    exclusionView.layer.borderColor = [UIColor greenColor].CGColor;
    [self.view addSubview:exclusionView];
    
    // UIPanGesture
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onGesture:)];
    [exclusionView addGestureRecognizer:pan];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self updateExclusionPath];
}

- (void)updateExclusionPath
{
    CGPoint pos = CGPointMake(exclusionView.center.x - CGRectGetMinX(mTextView.frame), exclusionView.center.y - CGRectGetMinY(mTextView.frame));
    UIBezierPath *path = [exclusionView curvePathWithOrigin:pos];
    mTextContainer.exclusionPaths = @[path];
}

// 调整缩放的焦点
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}

- (void)onGesture:(UIPanGestureRecognizer *)panGesture
{
    [self adjustAnchorPointForGestureRecognizer:panGesture];
    
    if (panGesture.state == UIGestureRecognizerStateChanged) {
        
        UIView *piece = panGesture.view;
        CGPoint locationInSuperview = [panGesture locationInView:piece.superview];
        piece.center = locationInSuperview;
        
        [self updateExclusionPath];
    }
    
    
}
@end
