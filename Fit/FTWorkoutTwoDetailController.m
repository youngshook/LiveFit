//
//  FTWorkoutTwoDetailViewController.m
//  Livefit
//
//  Created by D on 9/17/14.
//  Copyright (c) 2014 Folse. All rights reserved.
//

#import "FTWorkoutTwoDetailController.h"

@interface FTWorkoutTwoDetailController ()
{
    NSString *content;
    NSString *headerScrollViewImagePrefixName;
    int totalPageNumber;
}

@property (strong, nonatomic) IBOutlet UIScrollView *headerScrollView;
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation FTWorkoutTwoDetailController

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
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",_workoutName);
    
    // NSMutableArray *contentArray = [NSMutableArray new];
    
    // NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"plist"];
    // contentArray = [NSMutableArray arrayWithArray:[[NSArray alloc] initWithContentsOfFile:plistPath]];
    
    if ([_workoutName isEqualToString:@"01"]) {
        
        content = @"content";
        self.title = @"坐姿推胸机";
        
        totalPageNumber = 2;
        headerScrollViewImagePrefixName = @"gr1_";
        
    }else if ([_workoutName isEqualToString:@"02"]) {
        
        content = @"content";
        self.title = @"平板支";
        
        totalPageNumber = 1;
        headerScrollViewImagePrefixName = @"gr2_";
        
    }else if ([_workoutName isEqualToString:@"03"]) {
        
        content = @"content";
        self.title = @"侧平板支撑";
        
        totalPageNumber = 1;
        headerScrollViewImagePrefixName = @"gr3_";
        
    }else if ([_workoutName isEqualToString:@"04"]) {
        
        content = @"content";
        self.title = @"仰卧起坐卷腹";
        
        totalPageNumber = 2;
        headerScrollViewImagePrefixName = @"gr4_";
        
    }else if ([_workoutName isEqualToString:@"05"]) {
        
        content = @"content";
        self.title = @"站姿后抬腿";
        
        totalPageNumber = 2;
        headerScrollViewImagePrefixName = @"gr5_";
        
    }else if ([_workoutName isEqualToString:@"06"]) {
        
        content = @"content";
        self.title = @"罗马椅背屈伸";
        
        totalPageNumber = 2;
        headerScrollViewImagePrefixName = @"gr6_";
        
    }else if ([_workoutName isEqualToString:@"07"]) {
        
        content = @"content";
        self.title = @"有氧";
        
        totalPageNumber = 1;
        headerScrollViewImagePrefixName = @"c1";
        
    }else if ([_workoutName isEqualToString:@"11"]) {
        
        content = @"content";
        self.title = @"箭步蹲";
        
        totalPageNumber = 4;
        headerScrollViewImagePrefixName = @"gr7_";
        
    }else if ([_workoutName isEqualToString:@"12"]) {
        
        content = @"content";
        self.title = @"深蹲跳";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"gr8_";
        
    }else if ([_workoutName isEqualToString:@"13"]) {
        
        content = @"content";
        self.title = @"相扑式深蹲";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"gr9_";
        
    }else if ([_workoutName isEqualToString:@"14"]) {
        
        content = @"content";
        self.title = @"分腿蹲";
        
        totalPageNumber = 2;
        headerScrollViewImagePrefixName = @"gr10_";
        
    }else if ([_workoutName isEqualToString:@"15"]) {
        
        content = @"content";
        self.title = @"有氧";
        
        totalPageNumber = 1;
        headerScrollViewImagePrefixName = @"c2";
        
    }else if ([_workoutName isEqualToString:@"21"]) {
        
        content = @"content";
        self.title = @"站姿杠铃肩上推举";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"gr11_";
        
    }else if ([_workoutName isEqualToString:@"22"]) {
        
        content = @"content";
        self.title = @"站姿杠铃头后肩上推举";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"gr12_";
        
    }else if ([_workoutName isEqualToString:@"23"]) {
        
        content = @"content";
        self.title = @"宽握下拉";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"gr13_";
        
    }else if ([_workoutName isEqualToString:@"24"]) {
        
        content = @"content";
        self.title = @"杠铃硬拉";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"gr14_";
        
    }else {
        content = @"content";
        self.title = @"有氧";
        
        totalPageNumber = 1;
        headerScrollViewImagePrefixName = @"c3";
    }
    
    [_contentTextView setText:content];
    
    [_headerScrollView setDelegate:self];
    [_headerScrollView setPagingEnabled:YES];
    [_headerScrollView setContentSize:CGSizeMake(320*totalPageNumber, 250)];
    
    for ( int i = 1; i < totalPageNumber+1; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@%d", headerScrollViewImagePrefixName, i];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320*i-320, 0, 320, 250)];
        [imageView setImage:[UIImage imageNamed:imageName]];
        
        [_headerScrollView addSubview:imageView];
    }
    
    _pageControl.numberOfPages = totalPageNumber;
    _pageControl.currentPage = 0;
    
}

//pagecontrol的点跟着页数改变
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_pageControl setCurrentPage:offset.x/bounds.size.width];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
