//
//  FTCaloriesController.m
//  Fit
//
//  Created by folse on 7/28/14.
//  Copyright (c) 2014 Folse. All rights reserved.
//

#import "FTCaloriesController.h"
#import "FTCalculationResult.h"
#import "FTCaloriesExplanationController.h"
#import "RMPickerViewController.h"


@interface FTCaloriesController ()<UIPickerViewDelegate,UIPickerViewDataSource,UIPickerViewDataSource,UITextFieldDelegate,RMPickerViewControllerDelegate>
{
    int gender;
    float active;
    int pickerTag;
    int goal;
    int counter;
    int caloriesbmr;
    int caloriesbmrj;
}

@property(nonatomic,strong) RMPickerViewController *pickerVC;

@end


@implementation FTCaloriesController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[RMPickerViewController setLocalizedTitleForCancelButton:@"取消"];
	[RMPickerViewController setLocalizedTitleForSelectButton:@"选择"];
	
    self.genderPickerData = [NSArray arrayWithObjects:@"男", @"女", nil];
    
    self.activenessPickerData = [NSArray arrayWithObjects:@"基本不运动", @"每周运动1-2次", @"每周运动3-4次", @"每周运动4-5次", @"每周运动6-7次", nil];
    
    self.goalPickerData = [NSArray arrayWithObjects:@"保持体重", @"一星期减0.5公斤", @"一星期减1公斤", @"一星期增加0.5公斤", @"一星期增加1公斤", nil];
    
    [_ageTextField setDelegate:self];
    [_weightTextField setDelegate:self];
    [_heightTextField setDelegate:self];
    
}


- (IBAction)ageDoneAction:(id)sender
{
    [_ageTextField resignFirstResponder];
}
- (IBAction)weightDoneAction:(id)sender
{
    [_weightTextField resignFirstResponder];
}
- (IBAction)heightDoneAction:(id)sender
{
    [_heightTextField resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1:
            
            pickerTag = 1;
			[self.view endEditing:YES];
			self.pickerVC = [RMPickerViewController pickerController];
			self.pickerVC.delegate = self;
			[self.pickerVC show];
            
            break;
            
        case 4:
            
            pickerTag = 4;
			[self.view endEditing:YES];
			self.pickerVC = [RMPickerViewController pickerController];
			self.pickerVC.delegate = self;
			[self.pickerVC show];
            
            break;
            
        case 5:
            
            pickerTag = 5;
			[self.view endEditing:YES];
			self.pickerVC = [RMPickerViewController pickerController];
			self.pickerVC.delegate = self;
			[self.pickerVC show];
            
            break;
            
        default:
            break;
    }
}

-(void)genderBtnPressed
{
    NSInteger row = [self.pickerVC.picker selectedRowInComponent:0];
    NSLog(@"%@",[self.genderPickerData objectAtIndex:row]);
    [self.genderLabel setText:[self.genderPickerData objectAtIndex:row]];
    if ([[self.genderPickerData objectAtIndex:row] isEqualToString:@"男"]){
        gender = 0;
    }
    else{
        gender = 1;
    }
}

-(void)activeBtnPressed
{
    NSInteger row = [self.pickerVC.picker selectedRowInComponent:0];
    NSLog(@"%@",[self.activenessPickerData objectAtIndex:row]);
    
    [self.activeLabel setText:[self.activenessPickerData objectAtIndex:row]];
    
    if ([[self.activenessPickerData objectAtIndex:row] isEqualToString:@"基本不运动"]){
        active = 1.2;
    }
    else if ([[self.activenessPickerData objectAtIndex:row] isEqualToString:@"每周运动1-2次"]){
        active = 1.375;
    }
    else if ([[self.activenessPickerData objectAtIndex:row] isEqualToString:@"每周运动3-4次"]){
        active = 1.53;
    }
    else if ([[self.activenessPickerData objectAtIndex:row] isEqualToString:@"每周运动4-5次"]){
        active = 1.725;
    }
    else{
        active = 1.9;
    }
    
    [self.view endEditing:YES];
}

-(void)goalBtnPressed
{
    NSInteger row = [self.pickerVC.picker selectedRowInComponent:0];
    NSLog(@"%@",[self.goalPickerData objectAtIndex:row]);
    
    [self.goalLabel setText:[self.goalPickerData objectAtIndex:row]];
    
    if ([[self.goalPickerData objectAtIndex:row] isEqualToString:@"保持体重"]){
        counter = 0;
    }
    else if ([[self.goalPickerData objectAtIndex:row] isEqualToString:@"一星期减0.5公斤"]){
        counter = 1;
    }
    else if ([[self.goalPickerData objectAtIndex:row] isEqualToString:@"一星期减1公斤"]){
        counter = 2;
    }
    else if ([[self.goalPickerData objectAtIndex:row] isEqualToString:@"一星期增加0.5公斤"]){
        counter = 3;
    }
    else{
        counter = 4;
    }
}

- (IBAction)menuBtnAction:(id)sender {
	[self.view endEditing:YES];
	[self performSelector:@selector(presentLeftMenuViewController:) withObject:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CalculationResultController"]) {
        FTCalculationResult *calculationResultController = segue.destinationViewController;
        
        calculationResultController.caloriesNeeded = self.caloriesNeeded;
        
        calculationResultController.explanationContent = self.explanationContent;
    }
    
}

- (IBAction)calculatedBtnPressed:(id)sender {
    [self.view endEditing:YES];
    if (self.ageTextField.text.length == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请填写年龄" message:@"" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alertView show];
        
        return ;
    }
    if (self.genderLabel.text.length == 3) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请填写性别" message:@"" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alertView show];
        
        return ;
    }
    
    if (self.weightTextField.text.length == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请填写体重" message:@"" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alertView show];
        
        return ;
    }
    
    if (self.heightTextField.text.length == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请填写身高" message:@"" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alertView show];
        
        return ;
    }
    
    if (self.activeLabel.text.length == 2) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请填写华丽" message:@"" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alertView show];
        
        return ;
    }
    if (self.goalLabel.text.length == 2) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请填写目标" message:@"" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alertView show];
        
        return ;
    }
    
    int b = [self.weightTextField.text intValue] * 10;
    float m = ([self.heightTextField.text intValue] * 6.25);
    int r;
    
    if (gender == 0) {
        r = (5 * [self.ageTextField.text intValue]) + 5;
    }else{
        r = (5 * [self.ageTextField.text intValue]) - 161;
    }
    
    
    int bmr = ((b + m - r)* active) ;
    
    if (counter == 0){
        caloriesbmr = bmr;
        caloriesbmrj = caloriesbmr * 4;
        self.goalTypeName = @"保持体重";
        self.explanationContent = @"人的能量和卡路里需求量基于几个因素，包括训练频率、训练类型、训练强度、身体构成和体积等。";
    }
    else if (counter == 1){
        caloriesbmr = bmr - 500;
        caloriesbmrj = caloriesbmr * 4;
        self.goalTypeName = @"一星期减0.5公斤";
        self.explanationContent = @"减轻体重和减少身体脂肪是一个循序渐进的过程，要达到真正和恒久的效果，努力的目标应当是通过训练和控制饮食，每星期减少1到2磅体重。\r\r减轻体重的一般原则是：每天减少500卡路里摄入量，一星期内减轻1磅。减少卡路里可以通过饮食控制或增加锻炼，或二者相结合，最好的方法是把控制营养和锻炼结合起来。同样重要的是，要考虑到活动的强度和摄入适量的营养。\r\r减少身体脂肪的关键是保持运动的强度，卡路里的摄入量需能为训练提供足够的能量，不使新陈代谢减缓。\r\r人在休息的时候身体消耗60%左右的卡路里以维持自然的过程。基础代谢率(BMR)是人在休息时燃烧的卡路里量，一个人的瘦肌肉量量越多基础代谢率越高！因此使自己锻炼成为有更多肌肉的体格将能增加你燃烧卡路里和脂肪的能力。";
    }
    else if (counter == 2){
        caloriesbmr = bmr - 1000;
        caloriesbmrj = caloriesbmr * 4;
        
        self.goalTypeName = @"一星期减1公斤";
        self.explanationContent = @"减轻体重和减少身体脂肪是一个循序渐进的过程，要达到真正和恒久的效果，努力的目标应当是通过训练和控制饮食，每星期减少1到2磅体重。\r\r减轻体重的一般原则是：每天减少500卡路里摄入量，一星期内减轻1磅。减少卡路里可以通过饮食控制或增加锻炼，或二者相结合，最好的方法是把控制营养和锻炼结合起来。同样重要的是，要考虑到活动的强度和摄入适量的营养。\r\r减少身体脂肪的关键是保持运动的强度，卡路里的摄入量需能为训练提供足够的能量，不使新陈代谢减缓。\r\r人在休息的时候身体消耗60%左右的卡路里以维持自然的过程。基础代谢率(BMR)是人在休息时燃烧的卡路里量，一个人的瘦肌肉量量越多基础代谢率越高！因此使自己锻炼成为有更多肌肉的体格将能增加你燃烧卡路里和脂肪的能力。";
    }
    else if (counter == 3){
        caloriesbmr = bmr + 500;
        caloriesbmrj = caloriesbmr * 4;
        self.goalTypeName = @"一星期增加0.5公斤";
        self.explanationContent = @"一个普遍的经验法则是，想增加体重的运动员每天增加200－500卡路里总热量摄入，根据训练的强度最多可增加到1000卡路里。视你的活动水平来决定摄入适当的热量和营养比率是非常重要的。";
    }
    else {
        caloriesbmr = bmr + 1000;
        caloriesbmrj = caloriesbmr * 4;
        self.goalTypeName = @"一星期增加1公斤";
        self.explanationContent = @"一个普遍的经验法则是，想增加体重的运动员每天增加200－500卡路里总热量摄入，根据训练的强度最多可增加到1000卡路里。视你的活动水平来决定摄入适当的热量和营养比率是非常重要的。";
    }
    
    self.caloriesNeeded = [NSString stringWithFormat:@"%@你每天需要 %i 卡路里 / %i 千焦",self.goalTypeName,caloriesbmr, caloriesbmrj];
    
    self.explanationContent = [NSString stringWithFormat:@"%@",self.explanationContent];
    
    [self.view endEditing:YES];
    
    [self performSegueWithIdentifier:@"CalculationResultController" sender:self];
}



#pragma mark - limit ageTextField input format

- (void)textFieldDidChange:(UITextField *)textField
{
	if (textField == self.ageTextField) {
		if (textField.text.length > 2) {
			textField.text = [textField.text substringToIndex:2];
		}else if (textField.text.length == 2){
			[textField resignFirstResponder];
		}
	}else{
		if (textField.text.length > 3) {
			textField.text = [textField.text substringToIndex:3];
		}else if (textField.text.length == 3){
			[textField resignFirstResponder];
		}
	}
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	if (string.length == 0) return YES;
	
	NSInteger existedLength = textField.text.length;
	NSInteger selectedLength = range.length;
	NSInteger replaceLength = string.length;
	if (textField == self.ageTextField) {
		if (existedLength - selectedLength + replaceLength > 2) {
			return NO;
		}
	}else{
		if (existedLength - selectedLength + replaceLength > 3) {
			return NO;
		}
	}
	
	return YES;
}

#pragma mark - RMPickerViewController Delegates
- (void)pickerViewController:(RMPickerViewController *)vc didSelectRows:(NSArray  *)selectedRows {
	if (pickerTag == 1) {
		[self genderBtnPressed];
	}else if (pickerTag == 4){
		[self activeBtnPressed];
	}else {
		[self goalBtnPressed];
	}
}

- (void)pickerViewControllerDidCancel:(RMPickerViewController *)vc {
	
}

#pragma mark -
#pragma mark Picker Date Source Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	switch (pickerTag) {
			
		case 1:
			
			return [self.genderPickerData count];
			
			break;
			
		case 4:
			
			return [self.activenessPickerData count];
			
			break;
		case 5:
			
			return [self.goalPickerData count];
			
			break;
	}
	
	return 0;
}

#pragma mark Picker Delegate Methods

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	switch (pickerTag) {
			
		case 1:
			
			return [self.genderPickerData objectAtIndex:row];
			
			break;
			
		case 4:
			
			return [self.activenessPickerData objectAtIndex:row];
			
			break;
			
		case 5:
			
			return [self.goalPickerData objectAtIndex:row];
			
			break;
			
			
		default:
			break;
	}
	
	return 0;
	
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}


@end
