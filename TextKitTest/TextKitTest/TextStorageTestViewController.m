//
//  TextStorageTestViewController.m
//  TextKitTest
//
//  Created by zhangdi on 14-5-9.
//  Copyright (c) 2014年 xida. All rights reserved.
//

#import "TextStorageTestViewController.h"

@interface TextStorageTestViewController ()<NSTextStorageDelegate>

@property (nonatomic,strong)UITextView *textView;

@end

@implementation TextStorageTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];
    

    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)initialize{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    NSString *neirong = @"Objective-C，通常写作ObjC和较少用的Objective C或Obj-C，是扩充C的面向对象编程语言。它主要使用于Mac OS X和GNUstep这两个使用OpenStep标准的系统，而在NeXTSTEP和OpenStep中它更是基本语言。Objective-C可以在gcc运作的系统写和编译，因为gcc含Objective-C的编译器。1980年代初布莱德·确斯(Brad Cox)在其公司Stepstone发明Objective-C。他对软件设计和编程里的真实可用度问题十分关心。Objective-C最主要的描述是他1986年出版的Object Oriented Programming: An Evolutionary Approach. Addison Wesley. ISBN 0-201-54834-8.[1]Objective-C用途：编写iOS操作系统(如：iPhone、iPod touch、iPad 等苹果移动终端设备 )应用程序的利器。　Objective-C的流行当归功于iPhone的成功，因为Objective-C一直被用于编写iPhone应用程序。";
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, 280, 400)];
    [self propertyTest:self.textView.textStorage];
    
    
    _textView.text = neirong;
    [self.view addSubview:_textView];
    _textView.textStorage.delegate = self;



    [_textView.textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(9, 15)];
    [_textView.textStorage addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(20, 7)];
    
    
//    [_textView.textStorage invalidateAttributesInRange:NSMakeRange(0, 100)];
//    [_textView.textStorage ensureAttributesAreFixedInRange:NSMakeRange(0, 100)];
    
    
    _textView.backgroundColor = [UIColor whiteColor];
    
    
    
}

// 属性测试
- (void)propertyTest:(NSTextStorage *)textStorage{
    
    
    NSLog(@"layoutManagers.count %ld ",textStorage.layoutManagers.count);
    
    NSLog(@"fixesAttributesLazily %@",textStorage.fixesAttributesLazily ? @"YES":@"NO");
    
    NSLog(@"editedMask  %ld",textStorage.editedMask);
    
    NSLog(@"editedRange location %ld  ,length  %ld",textStorage.editedRange.location , textStorage.editedRange.length); // editedRange.length 表示最后添加属性的长度
    
    NSLog(@"changeInLength %ld",textStorage.changeInLength);
    
}


// addAttribute方法 操作界面修改数据 触发
// Sent inside -processEditing right before fixing attributes.  Delegates can change the characters or attributes.
- (void)textStorage:(NSTextStorage *)textStorage willProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta {
//    NSLog(@"%@",textStorage);
    
    NSLog(@"%s",__func__);
    [self propertyTest:textStorage];
    


    
}

// Sent inside -processEditing right before notifying layout managers.  Delegates can change the attributes.
- (void)textStorage:(NSTextStorage *)textStorage didProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta {
//    NSLog(@"%s",__func__);
//    [self propertyTest:textStorage];

    
    
}

@end
