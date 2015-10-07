//
//  HttpRequest.m
//  tuto
//
//  Created by Jean-Antoine Dupont on 05/10/2015.
//  Copyright © 2015 Jean-Antoine Dupont. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

- (id) init
{
    if (self = [super init]) {
        manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    
    return self;
}

- (void) doGetRequest:(void (^)(NSDictionary * responseObject))requestHandler url:(NSString *)url token:(NSString *)token
{
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        requestHandler((NSDictionary *)responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        requestHandler((NSDictionary *)operation.responseObject);
    }];
}

- (void) doPostRequest:(void (^)(NSDictionary * responseObject))requestHandler url:(NSString *)url params:(NSString *)params
{
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        requestHandler((NSDictionary *)responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        requestHandler((NSDictionary *)operation.responseObject);
    }];
}

@end
