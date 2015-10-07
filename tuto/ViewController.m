//
//  ViewController.m
//  tuto
//
//  Created by Jean-Antoine Dupont on 05/10/2015.
//  Copyright © 2015 Jean-Antoine Dupont. All rights reserved.
//

#import "ViewController.h"
#import "APIRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.api = [[APIRequest alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connectBtn:(id)sender {
    
    [self.api loginRequest:^(NSDictionary *response, NSInteger status) {
        NSLog(@"%@", response);
    } email:self.emailField.text password:self.passwordField.text appToken:@"test" data:@{}];
}
@end
