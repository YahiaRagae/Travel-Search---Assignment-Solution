//
//  Names.m
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import "Names.h"


NSString *const kNamesCa = @"ca";
NSString *const kNamesFr = @"fr";
NSString *const kNamesZh = @"zh";
NSString *const kNamesIs = @"is";
NSString *const kNamesPt = @"pt";
NSString *const kNamesRu = @"ru";
NSString *const kNamesIt = @"it";
NSString *const kNamesFi = @"fi";
NSString *const kNamesEs = @"es";
NSString *const kNamesCs = @"cs";


@interface Names ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Names
 

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
            self.ca = [self objectOrNilForKey:kNamesCa fromDictionary:dict];
            self.fr = [self objectOrNilForKey:kNamesFr fromDictionary:dict];
            self.zh = [self objectOrNilForKey:kNamesZh fromDictionary:dict];
            self.is = [self objectOrNilForKey:kNamesIs fromDictionary:dict];
            self.pt = [self objectOrNilForKey:kNamesPt fromDictionary:dict];
            self.ru = [self objectOrNilForKey:kNamesRu fromDictionary:dict];
            self.it = [self objectOrNilForKey:kNamesIt fromDictionary:dict];
            self.fi = [self objectOrNilForKey:kNamesFi fromDictionary:dict];
            self.es = [self objectOrNilForKey:kNamesEs fromDictionary:dict];
            self.cs = [self objectOrNilForKey:kNamesCs fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ca forKey:kNamesCa];
    [mutableDict setValue:self.fr forKey:kNamesFr];
    [mutableDict setValue:self.zh forKey:kNamesZh];
    [mutableDict setValue:self.is forKey:kNamesIs];
    [mutableDict setValue:self.pt forKey:kNamesPt];
    [mutableDict setValue:self.ru forKey:kNamesRu];
    [mutableDict setValue:self.it forKey:kNamesIt];
    [mutableDict setValue:self.fi forKey:kNamesFi];
    [mutableDict setValue:self.es forKey:kNamesEs];
    [mutableDict setValue:self.cs forKey:kNamesCs];

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

    self.ca = [aDecoder decodeObjectForKey:kNamesCa];
    self.fr = [aDecoder decodeObjectForKey:kNamesFr];
    self.zh = [aDecoder decodeObjectForKey:kNamesZh];
    self.is = [aDecoder decodeObjectForKey:kNamesIs];
    self.pt = [aDecoder decodeObjectForKey:kNamesPt];
    self.ru = [aDecoder decodeObjectForKey:kNamesRu];
    self.it = [aDecoder decodeObjectForKey:kNamesIt];
    self.fi = [aDecoder decodeObjectForKey:kNamesFi];
    self.es = [aDecoder decodeObjectForKey:kNamesEs];
    self.cs = [aDecoder decodeObjectForKey:kNamesCs];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ca forKey:kNamesCa];
    [aCoder encodeObject:_fr forKey:kNamesFr];
    [aCoder encodeObject:_zh forKey:kNamesZh];
    [aCoder encodeObject:_is forKey:kNamesIs];
    [aCoder encodeObject:_pt forKey:kNamesPt];
    [aCoder encodeObject:_ru forKey:kNamesRu];
    [aCoder encodeObject:_it forKey:kNamesIt];
    [aCoder encodeObject:_fi forKey:kNamesFi];
    [aCoder encodeObject:_es forKey:kNamesEs];
    [aCoder encodeObject:_cs forKey:kNamesCs];
}

- (id)copyWithZone:(NSZone *)zone
{
    Names *copy = [[Names alloc] init];
    
    if (copy) {

        copy.ca = [self.ca copyWithZone:zone];
        copy.fr = [self.fr copyWithZone:zone];
        copy.zh = [self.zh copyWithZone:zone];
        copy.is = [self.is copyWithZone:zone];
        copy.pt = [self.pt copyWithZone:zone];
        copy.ru = [self.ru copyWithZone:zone];
        copy.it = [self.it copyWithZone:zone];
        copy.fi = [self.fi copyWithZone:zone];
        copy.es = [self.es copyWithZone:zone];
        copy.cs = [self.cs copyWithZone:zone];
    }
    
    return copy;
}


@end
