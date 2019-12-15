//
//  APIKeyStorageVC.m
//  TMDb
//
//  Created by Tejas Bharbaya on 15/12/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import "APIKeyStorageVC.h"


@interface APIKeyStorageVC () <UITextFieldDelegate>
- (IBAction)onSaveClick:(id)sender;
@property(nonatomic,retain) AppDelegate *delegate;
@end

@implementation APIKeyStorageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _txtAPIKey.delegate = self;
    _delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    _txtAPIKey.text = _delegate.getAPIKey;
}

- (IBAction)onSaveClick:(id)sender {
    [_delegate setAPIKey:_txtAPIKey.text];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
