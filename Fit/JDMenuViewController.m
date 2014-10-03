//
//  JDMenuViewController.m
//  JDSideMenu
//
//  Created by Markus Emrich on 11.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import "JDMenuViewController.h"
#import "RESideMenu.h"

@interface JDMenuViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation JDMenuViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
}

- (void)viewDidLayoutSubviews;
{
    [super viewDidLayoutSubviews];
    self.scrollView.contentSize = CGRectInset(self.scrollView.bounds, 0, -1).size;
}

- (IBAction)HomeBtnAction:(id)sender
{
	[self.sideMenuViewController setContentViewController:[STORY_BOARD instantiateViewControllerWithIdentifier:@"mainNav"] animated:YES];
	[self.sideMenuViewController hideMenuViewController];
}

- (IBAction)favouriteBtnAction:(id)sender
{
	[self.sideMenuViewController setContentViewController:[STORY_BOARD instantiateViewControllerWithIdentifier:@"articleNav"] animated:YES];
	[self.sideMenuViewController hideMenuViewController];
}

- (IBAction)moreBtnAction:(id)sender
{
	[self.sideMenuViewController setContentViewController:[STORY_BOARD instantiateViewControllerWithIdentifier:@"calNav"] animated:YES];
	[self.sideMenuViewController hideMenuViewController];
}


@end
