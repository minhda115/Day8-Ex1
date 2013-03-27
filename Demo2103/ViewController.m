//
//  ViewController.m
//  Demo2103
//
//  Created by Anh Minh on 3/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
int choice = 0;
UIAlertView *alertN;
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)switchAge:(id)sender {
    choice = mySwitch.on;
    if (choice == 1){
        NSString *message = @"Ban da du 18 tuoi chua";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Confirm" message:message delegate:self cancelButtonTitle:@"No"otherButtonTitles:@"Yes", nil];
        [alertView show];
        
    }
}
- (void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"No"]){
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"BYEBYE"
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    else if ([buttonTitle isEqualToString:@"Yes"]){
        alertN = [[UIAlertView alloc] initWithTitle:@"Input Age" message:@"Input your Age"
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancel"
                                                   otherButtonTitles:@"OK", nil];
    
        [alertN setAlertViewStyle:UIAlertViewStylePlainTextInput];
        UITextField *textField = [alertN textFieldAtIndex:0];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [textField addTarget:self action:@selector(textViewDidEndEditing) forControlEvents:UIControlEventEditingDidEnd];
        [alertN show];
        
    }
}

-(void)textViewDidEndEditing{
    NSString *inputText = [[alertN textFieldAtIndex:0] text];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger year = [components year];
    if((year - [inputText intValue]) >= 18 && (inputText != nil)){
        UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
        myImage.image = [UIImage imageNamed:@"Picture.JPG"];
        [self.view addSubview:myImage];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"BYEBYE" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}
@end
