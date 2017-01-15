//
//  Apicalls.m
//  JSONparsingpractice
//
//  Created by Admin on 1/15/17.
//  Copyright © 2017 abhijit. All rights reserved.
//

#import "Apicalls.h"
#import <AFNetworking.h>

@implementation Apicalls

/**
 * returns responseobject in block
 */

-(void)fetchIssues : (void(^)(NSObject *response,NSError *error))completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.github.com/repos/crashlytics/secureudid/issues" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        _parser = [[ResponeParser alloc] init];
        
        NSArray *obj = [_parser parseIssueObject:responseObject];
        
        completionHandler(obj,nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completionHandler(nil,error);
    }];
}




-(void)fetchIssueComments : (NSString *) url  completion :(void(^)(NSObject *))completionHandler {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSONcomment: %@", responseObject);
        _parser = [[ResponeParser alloc]init];
        
        completionHandler([_parser parseCommentObject:responseObject]);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


@end
