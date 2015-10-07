//
//  APIRequest.h
//  tuto
//
//  Created by Jean-Antoine Dupont on 05/10/2015.
//  Copyright © 2015 Jean-Antoine Dupont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"

@interface APIRequest : NSObject {
    NSString *baseURL;
    HttpRequest *request;
}

- (void) registerRequest:(NSString *) email password:(NSString *)password;

- (void) loginRequest:(void (^)(NSDictionary *response, NSInteger status))toto
                email:(NSString *)email password:(NSString *)password appToken:(NSString *)app_token data:(NSDictionary *)data;

// - (void) loginRequest:(NSString *)email password:(NSString *)password appToken:(NSString *)app_token data:(NSDictionary *)data;
- (void) logoutRequest:(NSString *) token;

- (void) usersRequest:(NSString *) token;

@end
