//
//  GeoPosition.h
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GeoPosition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
