//
//  FTArticleDetailController.m
//  Livefit
//
//  Created by folse on 8/8/14.
//  Copyright (c) 2014 Folse. All rights reserved.
//

#import "FTArticleDetailController.h"

@interface FTArticleDetailController ()
@property (strong, nonatomic) IBOutlet UIImageView *headerImageView;

@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation FTArticleDetailController

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
	
	self.textView.text = _article.content;
	
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:_article.coverPhotoUrl]];
	
}

- (void)viewWillLayoutSubviews{
	self.textView.font = [UIFont systemFontOfSize:15];
	CGFloat fixedWidth = self.textView.frame.size.width;
	CGSize newSize = [self.textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
	CGRect newFrame = self.textView.frame;
	newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
	self.textView.frame = newFrame;
	self.tableView.contentSize = CGSizeMake(self.view.frame.size.width, _headerImageView.frame.size.height + self.textView.frame.size.height + 20);
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
