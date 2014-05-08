//
//  ViewController.m
//  NSArrayTest
//
//  Created by zhangdi on 14-5-8.
//  Copyright (c) 2014年 xida. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initialize{
    
    [self arrayjiaojibingji];
    
}

// 交集 并集
- (void)arrayjiaojibingji{
    
    NSArray *A = @[@"1a",@"2a",@"3a",@"4a"];
    
    NSArray *B = @[@"3a",@"4a"];
    
    NSArray *C  = [A  filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"NOT(SELF in %@)",B ]];
    
    NSLog(@"C = %@",C );
}








@end
