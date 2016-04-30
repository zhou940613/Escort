//
//  BYWebViewController.h
//  Escort
//
//  Created by apple on 16/4/30.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYWebViewController : UIViewController<UIWebViewDelegate>

@property(strong, nonatomic) NSString *URLString;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end
