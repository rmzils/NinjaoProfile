//
//  MenuInicial.m
//  NinjaoProfile
//
//  Created by Rafael Macito Zils on 3/15/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

#import "MenuInicial.h"

@interface MenuInicial ()

@property (nonatomic) NSString *userName;

@property (nonatomic, weak) IBOutlet UITextField *userNameInput;

@end

@implementation MenuInicial

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIView *view = [self.view initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 50.0f)];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = view.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor orangeColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
        [view.layer insertSublayer:gradient atIndex:0];
    }
    
    return self;
}

- (IBAction)showAlert:(NSString *)title
              message:(NSString *)message
           buttonText:(NSString *)buttonText {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                      message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:buttonText
                                                       style:UIAlertActionStyleCancel
                                                     handler:nil];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
    

- (IBAction)confirmUserName:(id)sender {
    NSString *abnRegex = @"[A-Za-z ]+"; // check for one or more occurrence of string you can also use * instead + for ignoring null value
    NSPredicate *abnTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", abnRegex];
    BOOL isValid = [abnTest evaluateWithObject:self.userNameInput.text];
    
    if(isValid)
        self.userName = self.userNameInput.text;
    else{
        if([self.userNameInput.text isEqualToString:@""])
            [self showAlert:@"Erro"
                    message:@"Digite um nome"
                 buttonText:@"OK"];
        else
            [self showAlert:@"Erro"
                     message:@"Digite um nome"
                  buttonText:@"OK"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
