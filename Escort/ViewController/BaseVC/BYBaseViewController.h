//
//  BYBaseViewController.h
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BYCustomNavigation.h"
#import "BYDefined.h"
#import <AFNetworking.h>
#import "UIImageView+WebCache.h"
#import "BYCustomTools.h"

@interface BYBaseViewController : UIViewController

// 自定义navigation
- (BYCustomNavigation *)customNavigation;

// 使view支持滚动
- (void)enableSupportViewScrollableWithSize:(CGSize)scrollSize;

// get 当前view 的scrollView
- (UIScrollView *)scrollableView;

// 代替或添加新的默认返回按钮
- (UIButton *)replaceBackButton;

@end
