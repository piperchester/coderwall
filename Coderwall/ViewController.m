//
//  ViewController.m
//  Coderwall
//
//  Created by Owain Lewis on 19/06/2013.
//  Copyright (c) 2013 Owain Lewis. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController


/**
 * Instantiate a new User model and return it
 *
 */
-(User *) buildUserModel:(NSString *)username
                  name:(NSString *)name
              location:(NSString *)location
          endorsements:(NSNumber *)endorsements
                  team:(NSString *)team

{
    
    User *user = [[User alloc] init];
    user.username = username;
    user.name = name;
    user.location = location;
    user.endorsements = endorsements;
    user.team = team;
    NSLog(@"New user created with username %@", user.username);
    return user;
}

/**
 * Takes an NS Dictionary response and builds a user and badge model
 *
 * @param response NSDictionary JSON repsonse from Coderwall API
 */
-(void) parseJSONResponse:(NSDictionary *)response
{
    NSString *username = [response objectForKey:@"username"];
    NSString *name = [response objectForKey:@"name"];
    NSString *location = [response objectForKey:@"location"];
    NSNumber *endorsements = [response objectForKey:@"endorsements"];
    NSString *team = [response objectForKey:@"team"];
  
    [self buildUserModel:username name:name location:location endorsements:endorsements team:team];
}

-(void) makeRequest
{
    NSString *path = @"https://coderwall.com/owainlewis.json";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
    {
        NSDictionary *jsonDict = (NSDictionary *) JSON;
        [self parseJSONResponse:jsonDict];
    } failure:nil];
    [operation start];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"CoderWall";
    [self makeRequest];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
