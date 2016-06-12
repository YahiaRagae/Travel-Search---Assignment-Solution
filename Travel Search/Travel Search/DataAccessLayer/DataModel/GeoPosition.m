//
//  GeoPosition.m
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import "GeoPosition.h"


NSString *const kGeoPositionLongitude = @"longitude";
NSString *const kGeoPositionLatitude = @"latitude";


@interface GeoPosition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GeoPosition

@synthesize longitude = _longitude;
@synthesize latitude = _latitude;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.longitude = [[self objectOrNilForKey:kGeoPositionLongitude fromDictionary:dict] doubleValue];
            self.latitude = [[self objectOrNilForKey:kGeoPositionLatitude fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.longitude] forKey:kGeoPositionLongitude];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latitude] forKey:kGeoPositionLatitude];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.longitude = [aDecoder decodeDoubleForKey:kGeoPositionLongitude];
    self.latitude = [aDecoder decodeDoubleForKey:kGeoPositionLatitude];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_longitude forKey:kGeoPositionLongitude];
    [aCoder encodeDouble:_latitude forKey:kGeoPositionLatitude];
}

- (id)copyWithZone:(NSZone *)zone
{
    GeoPosition *copy = [[GeoPosition alloc] init];
    
    if (copy) {

        copy.longitude = self.longitude;
        copy.latitude = self.latitude;
    }
    
    return copy;
}


@end
