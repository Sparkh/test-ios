//
//  HttpRequest.h
//  tuto
//
//  Created by Jean-Antoine Dupont on 05/10/2015.
//  Copyright © 2015 Jean-Antoine Dupont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HttpRequest : NSObject {
    AFHTTPRequestOperationManager *manager;
}

- (void) doGetRequest:(void (^)(NSDictionary * responseObject))requestnHandler url:(NSString *)url token:(NSString *)token;
- (void) doPostRequest:(void (^)(NSDictionary * responseObject))requestHandler url:(NSString *)url params:(NSDictionary *)params;

@end
