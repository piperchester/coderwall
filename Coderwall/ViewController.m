//
//  ViewController.m
//  Coderwall
//
//  Created by Owain Lewis on 19/06/2013.
//  Copyright (c) 2013 Owain Lewis. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) parseJSONResponse:(NSDictionary *)response
{
    NSLog(@"Got it");
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
