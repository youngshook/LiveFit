//
//  FTHomeController.m
//  Fit
//
//  Created by folse on 7/23/14.
//  Copyright (c) 2014 Folse. All rights reserved.
//

#import "FTHomeController.h"


@interface FTHomeController ()

@end

@implementation FTHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)menuBtnAction:(id)sender {
	[self.view endEditing:YES];
	[self performSelector:@selector(presentLeftMenuViewController:) withObject:sender];
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
