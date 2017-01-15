//
//  Apicalls.h
//  JSONparsingpractice
//
//  Created by Admin on 1/15/17.
//  Copyright © 2017 abhijit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponeParser.h"

@interface Apicalls : NSObject

-(void)fetchIssues : (void(^)(NSObject *response, NSError *error))completionHandler;
-(void)fetchIssueComments : (NSString *)url completion:(void(^)(NSObject *))completionHandler;
@property(nonatomic,retain) ResponeParser *parser;

@end
