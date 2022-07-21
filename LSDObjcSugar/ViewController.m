//
//  ViewController.m
//  LSDObjcSugar
//
//  Created by ls on 2017/10/30.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "ViewController.h"
#import "LSDObjcSugar.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[self.view lsd_xmlWithViewComponent]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
