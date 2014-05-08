//
//  ViewController.m
//  TextKitTest
//
//  Created by zhangdi on 14-5-6.
//  Copyright (c) 2014年 xida. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self fenyexianshi];
    
    [self zitixiaoguo];

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 分页显示
- (void)fenyexianshi{

    NSString *neirong = @"Objective-C，通常写作ObjC和较少用的Objective C或Obj-C，是扩充C的面向对象编程语言。它主要使用于Mac OS X和GNUstep这两个使用OpenStep标准的系统，而在NeXTSTEP和OpenStep中它更是基本语言。Objective-C可以在gcc运作的系统写和编译，因为gcc含Objective-C的编译器。1980年代初布莱德·确斯(Brad Cox)在其公司Stepstone发明Objective-C。他对软件设计和编程里的真实可用度问题十分关心。Objective-C最主要的描述是他1986年出版的Object Oriented Programming: An Evolutionary Approach. Addison Wesley. ISBN 0-201-54834-8.[1]Objective-C用途：编写iOS操作系统(如：iPhone、iPod touch、iPad 等苹果移动终端设备 )应用程序的利器。　Objective-C的流行当归功于iPhone的成功，因为Objective-C一直被用于编写iPhone应用程序。";
    
    NSTextStorage *textStorage = [[NSTextStorage alloc]init];

//    textStorage.string = neirong;
    [textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:neirong];
    
    NSLayoutManager *lm1 = [[NSLayoutManager alloc]init];

    [textStorage addLayoutManager:lm1];

    
    
    NSTextContainer *tc1 = [[NSTextContainer alloc]init];
    [lm1 addTextContainer:tc1];
    
    
    NSTextContainer *tc2 = [[NSTextContainer alloc]init];
    
    CGRect frame1 = CGRectMake(10, 20, 150, 200);
    CGRect frame2 = CGRectMake(170, 20, 140, 200);
    
    UITextView *textView1 = [[UITextView alloc]initWithFrame:frame1 textContainer:tc1];
    textView1.backgroundColor = [UIColor redColor];
    
    textView1.contentSize = CGSizeMake(150, 220);
    
    textView1.scrollEnabled = NO;
    
    [lm1 addTextContainer:tc2];
    UITextView *textView2 = [[UITextView alloc]initWithFrame:frame2 textContainer:tc2];
    textView2.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:textView1];
    [self.view addSubview:textView2];
    
    
}


// 字体效果

- (void)zitixiaoguo{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 230, 290, 30)];
    label.text = @"labelziti123123123";
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 270, 290, 30)];
    textField.text = @"textField123123123";
    textField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:textField];
    
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 310, 290, 30)];
    textView.text = @"textView123123123";
    textView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:textView];
    
    
    
    
    
    
}



// NSAttributedStringTest
- (void)attributedStringTest{
//    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 50)];
    label.text = @"haha123123123123123123123123123123123";
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 120, 100, 50)];
    textField.text = @"haha2";
    textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:textField];
   
//    UIFont *font = [[UIFont alloc]init];

    CGRect fontFrame = CGRectMake(20, 200, 100, 50);
//    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    /// Set line break mode
//    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
//    /// Set text alignment
//    paragraphStyle.alignment = NSTextAlignmentRight;
//    NSDictionary *dict = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:10.0],
//
//                           NSParagraphStyleAttributeName: paragraphStyle,
//                           NSForegroundColorAttributeName : [UIColor redColor],
//                           NSStrokeWidthAttributeName : @3,
//                           NSStrokeColorAttributeName : [UIColor greenColor]
//                           };
//    [@"oyeyeyeyey" drawInRect:fontFrame withAttributes:dict];
//    
    
    
//    UIFont *font = [UIFont fontWithName:@"Courier" size:11.5];
//    
//    /// Make a copy of the default paragraph style
//    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    /// Set line break mode
//    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
//    /// Set text alignment
//    paragraphStyle.alignment = NSTextAlignmentRight;
//    
//    NSDictionary *attributes = @{ NSFontAttributeName: font,
//                                  NSParagraphStyleAttributeName: paragraphStyle };
//    NSString *string = @"asdfsdfasdf";
//    [string drawInRect:fontFrame withAttributes:attributes];
//    
    

    
    NSMutableAttributedString *mutableAS = [[NSMutableAttributedString alloc]initWithAttributedString:label.attributedText];
//    [mutableAS addAttribute:@"aa" value:@"aa" range:NSMakeRange(1, 2)];
    [mutableAS addAttribute:NSForegroundColorAttributeName value:(id)[UIColor yellowColor]range:NSMakeRange(0, 2)];
    [mutableAS addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(2, 4)];
    [mutableAS addAttribute:NSBackgroundColorDocumentAttribute value:[UIColor redColor] range:NSMakeRange(0, 5)];

    label.attributedText = mutableAS;
    NSLog(@"%ld",label.attributedText.length);
//
//    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:label.font forKey:NSFontAttributeName];
//
//    NSDictionary *attrsDictionary2 = [NSDictionary dictionaryWithObject:textField.font forKey:NSFontAttributeName];
//    

}




// 字体操作
- (void)ziticaozuo{


    
    
}

// 创建测试
- (void)createTest{
    
    // NSTextStorage ->> NSLayoutManager ->> NSTextContainer
    
    NSTextStorage *textStorage = [NSTextStorage new];
    
    NSLayoutManager *layoutManager = [NSLayoutManager new];
    
    NSTextContainer *textContainer = [NSTextContainer new];
    
    
    
    
    UITextView *textView = [UITextView new];
    
    [textStorage addLayoutManager:layoutManager];
    
    [layoutManager addTextContainer:textContainer];
    
    
    
    
    
    
    
    
    
    
    
    
    
}



@end
