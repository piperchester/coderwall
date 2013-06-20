//
//  User.m
//  Coderwall
//
//  Created by Owain Lewis on 19/06/2013.
//  Copyright (c) 2013 Owain Lewis. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize username;
@synthesize name;
@synthesize location;
@synthesize endorsements;
@synthesize team;

/**
 * Instantiate a new User model and return it
 *
 */
- (id)initWithParams:(NSString *)aUsername
                name:(NSString *)aName
            location:(NSString *)aLocation
        endorsements:(NSNumber *)aEndorsements
                team:(NSString *)aTeam
{
    NSLog(@"New user created with username %@", aUsername);
    username     = aUsername;
    name         = aName;
    location     = aLocation;
    endorsements = aEndorsements;
    team         = aTeam;
    return [super init];
}

@end
