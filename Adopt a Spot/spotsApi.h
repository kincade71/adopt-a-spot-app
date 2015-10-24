//
//  spotsApi.h
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/23/15.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface spotsApi : NSObject

@property(weak, nonatomic) NSString * baseurl;
@property(weak, nonatomic) NSString * apikey;

-(id)initWithJson:(NSString *)FileName;
-(NSMutableArray*)getOrphans;


@end
