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
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 230, 290, 30)];
//    label.text = @"labelziti123456789012345678901";
//    label.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:label];
//    
//    
//    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 270, 290, 30)];
//    textField.text = @"textField123123123";
//    textField.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:textField];
//    
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 310, 290, 200)];
    textView.text = @"textVifafa3456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890";
    textView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:textView];
    
    [self xiaoguoceshi:textView];
    
    
}

// NSFontAttributeName                          设置字体
// NSParagraphStyleAttributeName                设置段落
    /*
     NSParagraphStyle属性
     alignment                                      对齐方式
     firstLineHeadIndent                            首行缩进
     headIndent                                     缩进
     tailIndent                                     尾部缩进
     lineBreakMode                                  断行方式
     maximumLineHeight                              最大行高
     minimumLineHeight                              最低行高
     lineSpacing                                    行距
     paragraphSpacing                               段距
     paragraphSpacingBefore                         段首空间
     baseWritingDirection                           句子方向
     lineHeightMultiple                             可变行高,乘因数。
     hyphenationFactor                              连字符属性
     */
// NSForegroundColorAttributeName               字体颜色
// NSBackgroundColorAttributeName               字体背景颜色
// NSLigatureAttributeName                      连字属性
    /*
     对应value nsnumber
     0                                              不连笔
     1                                              默认连笔
     2                                              ios不支持2及2以上
     */
// NSKernAttributeName                          字间距
// NSStrikethroughStyleAttributeName            删除线
    /*
     NSUnderlineStyleNone                                = 0x00,
     NSUnderlineStyleSingle                              = 0x01,
     NSUnderlineStyleThick NS_ENUM_AVAILABLE_IOS(7_0)    = 0x02,
     NSUnderlineStyleDouble NS_ENUM_AVAILABLE_IOS(7_0)   = 0x09,
     
     NSUnderlinePatternSolid NS_ENUM_AVAILABLE_IOS(7_0)      = 0x0000,
     NSUnderlinePatternDot NS_ENUM_AVAILABLE_IOS(7_0)        = 0x0100,
     NSUnderlinePatternDash NS_ENUM_AVAILABLE_IOS(7_0)       = 0x0200,
     NSUnderlinePatternDashDot NS_ENUM_AVAILABLE_IOS(7_0)    = 0x0300,
     NSUnderlinePatternDashDotDot NS_ENUM_AVAILABLE_IOS(7_0) = 0x0400,
     
     NSUnderlineByWord NS_ENUM_AVAILABLE_IOS(7_0) = 0x8000
     */
// NSUnderlineStyleAttributeName                下划线
// NSStrokeColorAttributeName                   字体颜色 ＊
// NSStrokeWidthAttributeName                   笔画粗细 ＊与上边属性一起设置才生效
// NSShadowAttributeName
    /*
     NSShadow
     shadowOffset                                   阴影偏移默认      (0,-3)
     shadowBlurRadius                               阴影半径
     shadowColor                                    阴影颜色
     */

// NSTextEffectAttributeName
// NSAttachmentAttributeName
// NSLinkAttributeName
// NSBaselineOffsetAttributeName                删除线颜色
// NSUnderlineColorAttributeName                下划线颜色
// NSStrikethroughColorAttributeName
// NSObliquenessAttributeName
// NSExpansionAttributeName
// NSWritingDirectionAttributeName
// NSVerticalGlyphFormAttributeName
// 效果测试
- (void)xiaoguoceshi:(UITextView *)textView{
    NSLog(@"%@",textView.attributedText);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:textView.attributedText];

    // 设置字体
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"times" size:30.0] range:NSMakeRange(0, 2)];
    
    // 段落
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.firstLineHeadIndent = 20;    // 首行锁进
    paragraphStyle.lineHeightMultiple = 1.5;    // 1.5行间距
    
    // 字体颜色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(2, 2)];
    
    // 字体背景颜色
    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(4, 2)];

    // 连字设置 效果未实现
    [attributedString addAttribute:NSLigatureAttributeName value:[NSNumber numberWithInt:0] range:NSMakeRange(6, 2)];
    [attributedString addAttribute:NSLigatureAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(8, 2)];
    
    // 字间距
    [attributedString addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:3.3] range:NSMakeRange(10,2)];
    
    // 删除线
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(12, 2)];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleThick] range:NSMakeRange(14, 2)];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleDouble] range:NSMakeRange(16, 2)];
    // 效果未实现
//    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlinePatternSolid] range:NSMakeRange(18, 2)];
//    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlinePatternDot] range:NSMakeRange(20, 2)];
//    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlinePatternDash] range:NSMakeRange(22, 2)];
//    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlinePatternDashDot] range:NSMakeRange(24, 2)];
    
    // 下划线
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(18, 2)];
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleDouble] range:NSMakeRange(20, 2)];
    
    // 字体颜色
    [attributedString addAttribute:NSStrokeColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(22, 2)];
    
    // 笔画粗细
    [attributedString addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:3.3] range:NSMakeRange(22, 2)];
    
    // 设置阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor purpleColor];
    shadow.shadowOffset = CGSizeMake(1, -8);
    shadow.shadowBlurRadius = 2.0;
    
    [attributedString addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(24, 2)];
    NSShadow *shadow1 = [[NSShadow alloc]init];
    shadow1.shadowColor = [UIColor purpleColor];
    shadow1.shadowOffset = CGSizeMake(1, 8);
    shadow1.shadowBlurRadius = 2.0;
    [attributedString addAttribute:NSShadowAttributeName value:shadow1 range:NSMakeRange(26, 2)];
    
    
    // 删除线颜色
    [attributedString addAttribute:NSStrikethroughColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(12, 2)];
    
    // 下划线颜色
    [attributedString addAttribute:NSUnderlineColorAttributeName value:[UIColor redColor] range:NSMakeRange(18, 4)];
    
    
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, 2)];
    
    
    
    
    
//    // 高亮
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(2, 2)];
//    
//    // 下划线
//    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:1] range:NSMakeRange(4, 2)];
    
    
    
    textView.attributedText = attributedString;
    
}







@end
