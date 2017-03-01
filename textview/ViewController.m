//
//  ViewController.m
//  textview
//
//  Created by 张衡 on 2017/2/27.
//  Copyright © 2017年 张衡. All rights reserved.
//

#import "ViewController.h"
#import "NSString+ignore_continuous_line_breaks.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)ignoreBreaks:(UIButton *)sender {
    
    self.textView.text = [self.textView.text ignoreContinuousLineBreaks];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
