//
//  TextContainerTestViewController.m
//  TextKitTest
//
//  Created by zhangdi on 14-5-12.
//  Copyright (c) 2014年 xida. All rights reserved.
//

#import "TextContainerTestViewController.h"

@interface TextContainerTestViewController ()
@property (nonatomic,strong)UITextView *textView;
@end

@implementation TextContainerTestViewController

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
    [self initialize];
    
    // Dispose of any resources that can be recreated.
}

- (void)initialize{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    NSString *neirong = @"Objective-C，通常写作ObjC和较少用的Objective C或Obj-C，是扩充C的面向对象编程语言。它主要使用于Mac OS X和GNUstep这两个使用OpenStep标准的系统，而在NeXTSTEP和OpenStep中它更是基本语言。Objective-C可以在gcc运作的系统写和编译，因为gcc含Objective-C的编译器。1980年代初布莱德·确斯(Brad Cox)在其公司Stepstone发明Objective-C。他对软件设计和编程里的真实可用度问题十分关心。Objective-C最主要的描述是他1986年出版的Object Oriented Programming: An Evolutionary Approach. Addison Wesley. ISBN 0-201-54834-8.[1]Objective-C用途：编写iOS操作系统(如：iPhone、iPod touch、iPad 等苹果移动终端设备 )应用程序的利器。　Objective-C的流行当归功于iPhone的成功，因为Objective-C一直被用于编写iPhone应用程序。";
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, 280, 400)];
    

    _textView.text = neirong;
    [self.view addSubview:_textView];
    
    [_textView.textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(9, 15)];
    [_textView.textStorage addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(20, 7)];
    
    
    //    [_textView.textStorage invalidateAttributesInRange:NSMakeRange(0, 100)];
    //    [_textView.textStorage ensureAttributesAreFixedInRange:NSMakeRange(0, 100)];
    
    _textView.backgroundColor = [UIColor whiteColor];
    
    [self propertyTest];
    
}

- (void)propertyTest{

    NSTextContainer *textContainer = _textView.textContainer;
    NSLog(@"%@",textContainer);

//    /**************************** Layout ****************************/
//    
//    // Accessor for the NSLayoutManager object owning the receiver.
//    // Avoid assigning a layout manager directly through this property.  Adding a text container to a layout manager through -[NSLayoutManager addTextContainer:] will use the property for assigning the new layout manager.
//    @property(assign, NS_NONATOMIC_IOSONLY) NSLayoutManager *layoutManager;
//    
//    
//    /************************* Container shape properties *************************/
//    
//    // Default value: CGSizeZero  Defines the maximum size for the layout area returned from -lineFragmentRectForProposedRect:writingDirection:remainingRect:.  0.0 and less means no limitation.
//    @property(NS_NONATOMIC_IOSONLY) CGSize size;
//    
//    // Default value : nil  An array of UIBezierPath representing the exclusion paths inside the receiver's bounding rect.
//    @property(copy, NS_NONATOMIC_IOSONLY) NSArray *exclusionPaths;
//    
//    // Default value: NSLineBreakByWordWrapping  The line break mode defines the behavior of the last line inside the text container.
//    @property(NS_NONATOMIC_IOSONLY) NSLineBreakMode lineBreakMode;

    NSLog(@"size %f , %f",textContainer.size.height , textContainer.size.width);
    NSLog(@"exclusionPaths %@",textContainer.exclusionPaths);
    NSLog(@"lineBreakMode %ld",textContainer.lineBreakMode);
    
//    // Default value: 5.0  The layout padding at the beginning and end of the line fragment rects insetting the layout width available for the contents.  This value is utilized by NSLayoutManager for determining the layout width.
//    @property(NS_NONATOMIC_IOSONLY) CGFloat lineFragmentPadding;
//    
//    // Default value: 0 (no limit)  The maximum number of lines that can be stored in the receiver.  This value is utilized by NSLayoutManager for determining the maximum number of lines associated with the text container.
//    @property(NS_NONATOMIC_IOSONLY) NSUInteger maximumNumberOfLines;
    textContainer.lineFragmentPadding = 50.0;
    NSLog(@"lineFragmentPadding %f",textContainer.lineFragmentPadding);
    textContainer.maximumNumberOfLines = 4;
    NSLog(@"maximumNumberOfLines %ld",textContainer.maximumNumberOfLines);
    
    
}



@end
