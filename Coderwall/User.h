//
//  User.h
//  Coderwall
//
//  Created by Owain Lewis on 19/06/2013.
//  Copyright (c) 2013 Owain Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) NSString *username;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *location;
@property (nonatomic) NSNumber *endorsements;
@property (nonatomic) NSString *team;


- (id)initWithParams:(NSString *)aUsername
                name:(NSString *)name
            location:(NSString *)location
        endorsements:(NSNumber *)endorsements
                team:(NSString *)team;

@end
