//
//  spotsApi.m
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/23/15.
//
//

#import "spotsApi.h"

@interface spotsApi()
    @property NSMutableArray *Orphans;
@end

@implementation spotsApi

-(id)init{
    self = [self initWithJson:@"config"];
    return self;
}

-(id)initWithJson:(NSString *)FileName{
    self = [super init];
    if(self){
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:FileName ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:jsonPath];
        NSError *error = nil;
        id json = [NSJSONSerialization JSONObjectWithData:data
                                                  options:kNilOptions
                                                    error:&error];
        _baseurl = [json objectForKey:@"baseurl"];
       _apikey = [json objectForKey:@"APIKey"];
    }
    return self;
}

-(NSMutableArray*)getOrphans{
    _Orphans = [[NSMutableArray alloc]init];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"%@/spots.json%@",_baseurl,@"?status=false"] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        _Orphans = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    return _Orphans;
}

@end
