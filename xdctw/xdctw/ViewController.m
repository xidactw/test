//
//  ViewController.m
//  xdctw
//
//  Created by zhangdi on 14-5-12.
//  Copyright (c) 2014年 xida. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property (nonatomic,strong)CMMotionManager *motionManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)initialize{
    
    _motionManager = [CMMotionManager new];
    
    if (!_motionManager.accelerometerAvailable) {
        NSLog(@"motionManager c f");
        return;
    }
    

    
    
    // 设置更新频率 100Hz
    _motionManager.accelerometerUpdateInterval = 5.0;
    _motionManager.deviceMotionUpdateInterval = 5.0;
    
    NSOperationQueue *queue = [NSOperationQueue currentQueue];
    
    // 加速剂信息
    [_motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
       
        NSLog(@"x = %f , y = %f , c = %f",accelerometerData.acceleration.x,accelerometerData.acceleration.y,accelerometerData.acceleration.z);
    }];
    
    [_motionManager startDeviceMotionUpdatesToQueue:queue withHandler:^(CMDeviceMotion *motion, NSError *error) {

        // 三维信息 空间位置和姿势
        CMAttitude *attibude = motion.attitude;
        
        
        NSLog(@"%@",attibude);
        
        // 倾斜
        NSLog(@"%f",attibude.pitch);
        
        // 旋转
        NSLog(@"%f",attibude.roll);
        
        // 偏转
        NSLog(@"%f",attibude.yaw);
        
        // 重力信息
        CMAcceleration gravity = motion.gravity;
        
        // 加速信息
        CMAcceleration userAcceleration = motion.userAcceleration;
        
        // 旋转速率
        CMRotationRate rotationRate = motion.rotationRate;
        
    }];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
