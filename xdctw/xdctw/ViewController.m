//
//  ViewController.m
//  xdctw
//
//  Created by zhangdi on 14-5-12.
//  Copyright (c) 2014年 xida. All rights reserved.
//

#import "ViewController.h"

@import CoreMotion;
@import CoreLocation;

@interface ViewController ()<CLLocationManagerDelegate>

@property (nonatomic,strong)CMMotionManager *motionManager;

@property (nonatomic,strong)CLLocationManager *locationManager;

@property (nonatomic,strong)UILabel *zhinanzhenLabel;

@property (nonatomic,strong)UIView *shuipingView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)initialize{
    
    // 指南针
//    [self zhinanzhen];
    
    // 水平仪
//    [self shuipingyi];
    
    // 属性测试
    [self shuxingceshi];
}


// 指南针
- (void)zhinanzhen{
    
    [self setuplabel];
    
    [self setuplocationManager];
    
}

// 设置旋转图标
- (void)setuplabel{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.center = self.view.center;
    label.backgroundColor = [UIColor redColor];
    label.text = @"指南";
    label.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:label];
    
    _zhinanzhenLabel = label;
    
}

// 设置定位传感器
- (void)setuplocationManager{
    
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    
    // 设置精度
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // 设置过滤器
    _locationManager.headingFilter = kCLHeadingFilterNone;
    
    // 设置更新
    [_locationManager startUpdatingHeading];
    
}

// locationManager回调方法
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    NSLog(@"%@",newHeading);
    
    
    // 重置指南针方向
    _zhinanzhenLabel.transform = CGAffineTransformIdentity;
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(-1 * M_PI * newHeading.magneticHeading / 180.0);
    
    _zhinanzhenLabel.transform = transform;
    
}

// 水平仪
- (void)shuipingyi{
    
    [self setupview];
    
    [self setupmotionManager];
    
}

- (void)setupview{
    
    UIView *h = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 0.5 , 320 , 1)];
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2 - .5, 0 , 1, self.view.frame.size.height)];
    h.backgroundColor = [UIColor redColor];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:h];
    [self.view addSubview:v];
    NSLog(@"%f %f",self.view.center.x ,self.view.center.y);

    _shuipingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
    _shuipingView.backgroundColor = [UIColor blackColor];
    _shuipingView.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.view addSubview:_shuipingView];
    
    
}

- (void)setupmotionManager{
    
    _motionManager = [CMMotionManager new];
    
    // 设置更新频率
    _motionManager.accelerometerUpdateInterval = 0.01;
    
    NSOperationQueue *queue = [NSOperationQueue currentQueue];
    
    // 信息获取
    [_motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        NSLog(@"x = %f , y = %f , z = %f",accelerometerData.acceleration.x,accelerometerData.acceleration.y,accelerometerData.acceleration.z);
        CMAcceleration acceleration = accelerometerData.acceleration;
        
        [_shuipingView.layer removeAllAnimations];
        CGSize size = self.view.frame.size;
        
        _shuipingView.center = CGPointMake((1 + acceleration.x) * (size.width / 2), (1 - acceleration.y) * (size.height / 2));
//        CATransform3D rotationTransform = CATransform3DIdentity;
//        rotationTransform = CATransform3DRotate(rotationTransform, DegreesToRadians(-acceleration.x * 30), 0.0, 0.0, 1.0);
//        _shuipingView.layer.transform = rotationTransform;
        
    }];
    
}


CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};




// 属性测试
- (void)shuxingceshi{
    
    _motionManager = [CMMotionManager new];
    
    if (!_motionManager.accelerometerAvailable) {
        NSLog(@"motionManager c f");
        return;
    }
    
    
    
    
    // 设置更新频率 100Hz
    _motionManager.accelerometerUpdateInterval = 5.0;
    _motionManager.deviceMotionUpdateInterval = 5.0;
    
    NSOperationQueue *queue = [NSOperationQueue currentQueue];
    
    // 加速剂信息 (个人理解 静止时 3轴受到的引力值 移动时会产生加速信息 );
    [_motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        NSLog(@"未去掉重力分量的加速剂信息-------------------------------");
        NSLog(@"x = %f , y = %f , z = %f",accelerometerData.acceleration.x,accelerometerData.acceleration.y,accelerometerData.acceleration.z);
        
    }];
    
    [_motionManager startDeviceMotionUpdatesToQueue:queue withHandler:^(CMDeviceMotion *motion, NSError *error) {
        
        // 三维信息 空间位置和姿势
        CMAttitude *attibude = motion.attitude;
        
        NSLog(@"attibude信息-------------------------");
        NSLog(@"pitch = %f , roll = %f , yaw = %f",attibude.pitch,attibude.roll , attibude.yaw);
//        NSLog(@"%@",attibude);
//        
//        // 倾斜 x 轴水平夹角
//        NSLog(@"%f",attibude.pitch);
//        
//        // 旋转 y 轴谁水平夹角
//        NSLog(@"%f",attibude.roll);
//        
//        // 偏转
//        NSLog(@"%f",attibude.yaw);
//        
//        // 重力信息
        CMAcceleration gravity = motion.gravity;
        NSLog(@"重力分量的加速剂信息-------------------------------");
        NSLog(@"x = %f , y = %f , z = %f",gravity.x,gravity.y,gravity.z);

//
        // 加速信息
        CMAcceleration userAcceleration = motion.userAcceleration;
        NSLog(@"去掉重力分量的加速剂信息-------------------------------");
        NSLog(@"x = %f , y = %f , z = %f",userAcceleration.x,userAcceleration.y,userAcceleration.z);

        
//        // 旋转速率
        CMRotationRate rotationRate = motion.rotationRate;
        NSLog(@"旋转速度信息---------------------------------------");
        NSLog(@"x = %f , y = %f , z = %f",rotationRate.x,rotationRate.y,rotationRate.z);
        
        
        
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}
- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"检测到晃动");
    }
}

@end
