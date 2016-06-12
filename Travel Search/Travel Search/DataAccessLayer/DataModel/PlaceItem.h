//
//  PlaceItem.h
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Names, GeoPosition, AlternativeNames;

@interface PlaceItem : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * iataAirportCode;
@property (nonatomic, assign) BOOL inEurope;
@property (nonatomic, strong) Names *names;
@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) BOOL coreCountry;
@property (nonatomic, assign) double locationId;
@property (nonatomic, assign) double countryId;
@property (nonatomic, assign) NSString * key;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) GeoPosition *geoPosition;
@property (nonatomic, strong) AlternativeNames *alternativeNames;
@property (nonatomic, assign) double distance;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
