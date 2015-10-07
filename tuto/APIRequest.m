//
//  APIRequest.m
//  tuto
//
//  Created by Jean-Antoine Dupont on 05/10/2015.
//  Copyright © 2015 Jean-Antoine Dupont. All rights reserved.
//

#import "APIRequest.h"

@implementation APIRequest

- (id) init {
    if (self = [super init]) {
        baseURL = @"http://eip-api.kokakiwi.net:80/v1/";
        request = [[HttpRequest alloc] init];
    }
    
    return self;
}

- (void) registerRequest:(NSString *)email password:(NSString *)password {
    NSDictionary *params = @{
                             @"email": email,
                             @"password": password
                             };
    
    NSString *url = [baseURL stringByAppendingPathComponent:@"users/auth/register"];
    
    [request doPostRequest:^void(NSDictionary *responseObject) {
        
    } url:url params:params];
}

- (void) loginRequest:(void (^)(NSDictionary *response, NSInteger status))toto
                email:(NSString *)email password:(NSString *)password appToken:(NSString *)app_token data:(NSDictionary *)data {
    
    NSDictionary *params = @{
                             @"email": email,
                             @"password": password,
                             @"app_token": app_token,
                             @"data": data
                             };
    
    NSString *url = [baseURL stringByAppendingPathComponent:@"users/auth/login/simple/"];
    
    [request doPostRequest:^void(NSDictionary *responseObject) {
        
        toto(responseObject, [responseObject[@"status"] integerValue]);
        
    } url:url params:params];
}

- (void) logoutRequest:(NSString *)token {
    NSString *url = [baseURL stringByAppendingPathComponent:@"users/auth/logout/"];
    
    [request doGetRequest:^(NSDictionary *responseObject) {
        NSLog(@"logout: %@", responseObject);
        
    } url:url token:token];
    

}

- (void) usersRequest:(NSString *)token {
    NSString *url = [baseURL stringByAppendingString:@"users/"];
    
    [request doGetRequest:^(NSDictionary *responseObject) {
        NSLog(@"users: %@", responseObject);
    } url:url token:token];
    
}

@end
