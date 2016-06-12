//
//  PlaceItem.m
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import "PlaceItem.h"
#import "Names.h"
#import "GeoPosition.h"
#import "AlternativeNames.h"


NSString *const kPlaceItemIataAirportCode = @"iata_airport_code";
NSString *const kPlaceItemInEurope = @"inEurope";
NSString *const kPlaceItemNames = @"names";
NSString *const kPlaceItemCountryCode = @"countryCode";
NSString *const kPlaceItemId = @"_id";
NSString *const kPlaceItemCoreCountry = @"coreCountry";
NSString *const kPlaceItemLocationId = @"locationId";
NSString *const kPlaceItemCountryId = @"countryId";
NSString *const kPlaceItemKey = @"key";
NSString *const kPlaceItemFullName = @"fullName";
NSString *const kPlaceItemType = @"type";
NSString *const kPlaceItemGeoPosition = @"geo_position";
NSString *const kPlaceItemAlternativeNames = @"alternativeNames";
NSString *const kPlaceItemDistance = @"distance";
NSString *const kPlaceItemCountry = @"country";
NSString *const kPlaceItemName = @"name";


@interface PlaceItem ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PlaceItem

 


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
            self.iataAirportCode = [self objectOrNilForKey:kPlaceItemIataAirportCode fromDictionary:dict];
            self.inEurope = [[self objectOrNilForKey:kPlaceItemInEurope fromDictionary:dict] boolValue];
            self.names = [Names modelObjectWithDictionary:[dict objectForKey:kPlaceItemNames]];
            self.countryCode = [self objectOrNilForKey:kPlaceItemCountryCode fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kPlaceItemId fromDictionary:dict] doubleValue];
            self.coreCountry = [[self objectOrNilForKey:kPlaceItemCoreCountry fromDictionary:dict] boolValue];
            self.locationId = [[self objectOrNilForKey:kPlaceItemLocationId fromDictionary:dict] doubleValue];
            self.countryId = [[self objectOrNilForKey:kPlaceItemCountryId fromDictionary:dict] doubleValue];
            self.key = [self objectOrNilForKey:kPlaceItemKey fromDictionary:dict];
            self.fullName = [self objectOrNilForKey:kPlaceItemFullName fromDictionary:dict];
            self.type = [self objectOrNilForKey:kPlaceItemType fromDictionary:dict];
            self.geoPosition = [GeoPosition modelObjectWithDictionary:[dict objectForKey:kPlaceItemGeoPosition]];
            self.alternativeNames = [AlternativeNames modelObjectWithDictionary:[dict objectForKey:kPlaceItemAlternativeNames]];
            self.distance = [[self objectOrNilForKey:kPlaceItemDistance fromDictionary:dict] doubleValue];
            self.country = [self objectOrNilForKey:kPlaceItemCountry fromDictionary:dict];
            self.name = [self objectOrNilForKey:kPlaceItemName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.iataAirportCode forKey:kPlaceItemIataAirportCode];
    [mutableDict setValue:[NSNumber numberWithBool:self.inEurope] forKey:kPlaceItemInEurope];
    [mutableDict setValue:[self.names dictionaryRepresentation] forKey:kPlaceItemNames];
    [mutableDict setValue:self.countryCode forKey:kPlaceItemCountryCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kPlaceItemId];
    [mutableDict setValue:[NSNumber numberWithBool:self.coreCountry] forKey:kPlaceItemCoreCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.locationId] forKey:kPlaceItemLocationId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.countryId] forKey:kPlaceItemCountryId];
    [mutableDict setValue:self.key forKey:kPlaceItemKey];
    [mutableDict setValue:self.fullName forKey:kPlaceItemFullName];
    [mutableDict setValue:self.type forKey:kPlaceItemType];
    [mutableDict setValue:[self.geoPosition dictionaryRepresentation] forKey:kPlaceItemGeoPosition];
    [mutableDict setValue:[self.alternativeNames dictionaryRepresentation] forKey:kPlaceItemAlternativeNames];
    [mutableDict setValue:[NSString stringWithFormat:@"%f",self.distance] forKey:kPlaceItemDistance];
    [mutableDict setValue:self.country forKey:kPlaceItemCountry];
    [mutableDict setValue:self.name forKey:kPlaceItemName];

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

    self.iataAirportCode = [aDecoder decodeObjectForKey:kPlaceItemIataAirportCode];
    self.inEurope = [aDecoder decodeBoolForKey:kPlaceItemInEurope];
    self.names = [aDecoder decodeObjectForKey:kPlaceItemNames];
    self.countryCode = [aDecoder decodeObjectForKey:kPlaceItemCountryCode];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kPlaceItemId];
    self.coreCountry = [aDecoder decodeBoolForKey:kPlaceItemCoreCountry];
    self.locationId = [aDecoder decodeDoubleForKey:kPlaceItemLocationId];
    self.countryId = [aDecoder decodeDoubleForKey:kPlaceItemCountryId];
    self.key = [aDecoder decodeObjectForKey:kPlaceItemKey];
    self.fullName = [aDecoder decodeObjectForKey:kPlaceItemFullName];
    self.type = [aDecoder decodeObjectForKey:kPlaceItemType];
    self.geoPosition = [aDecoder decodeObjectForKey:kPlaceItemGeoPosition];
    self.alternativeNames = [aDecoder decodeObjectForKey:kPlaceItemAlternativeNames];
    self.distance =  [aDecoder decodeDoubleForKey:kPlaceItemDistance] ;
    self.country = [aDecoder decodeObjectForKey:kPlaceItemCountry];
    self.name = [aDecoder decodeObjectForKey:kPlaceItemName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_iataAirportCode forKey:kPlaceItemIataAirportCode];
    [aCoder encodeBool:_inEurope forKey:kPlaceItemInEurope];
    [aCoder encodeObject:_names forKey:kPlaceItemNames];
    [aCoder encodeObject:_countryCode forKey:kPlaceItemCountryCode];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kPlaceItemId];
    [aCoder encodeBool:_coreCountry forKey:kPlaceItemCoreCountry];
    [aCoder encodeDouble:_locationId forKey:kPlaceItemLocationId];
    [aCoder encodeDouble:_countryId forKey:kPlaceItemCountryId];
    [aCoder encodeObject:_key forKey:kPlaceItemKey];
    [aCoder encodeObject:_fullName forKey:kPlaceItemFullName];
    [aCoder encodeObject:_type forKey:kPlaceItemType];
    [aCoder encodeObject:_geoPosition forKey:kPlaceItemGeoPosition];
    [aCoder encodeObject:_alternativeNames forKey:kPlaceItemAlternativeNames];
    [aCoder encodeDouble:_distance forKey:kPlaceItemDistance];
    [aCoder encodeObject:_country forKey:kPlaceItemCountry];
    [aCoder encodeObject:_name forKey:kPlaceItemName];
}

- (id)copyWithZone:(NSZone *)zone
{
    PlaceItem *copy = [[PlaceItem alloc] init];
    
    if (copy) {

        copy.iataAirportCode = [self.iataAirportCode copyWithZone:zone];
        copy.inEurope = self.inEurope;
        copy.names = [self.names copyWithZone:zone];
        copy.countryCode = [self.countryCode copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.coreCountry = self.coreCountry;
        copy.locationId = self.locationId;
        copy.countryId = self.countryId;
        copy.key = self.key;
        copy.fullName = [self.fullName copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.geoPosition = [self.geoPosition copyWithZone:zone];
        copy.alternativeNames = [self.alternativeNames copyWithZone:zone];
        copy.distance = self.distance ;
        copy.country = [self.country copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
