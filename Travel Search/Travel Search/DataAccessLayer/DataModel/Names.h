//
//  Names.h
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Names : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ca;
@property (nonatomic, strong) NSString *fr;
@property (nonatomic, strong) NSString *zh;
@property (nonatomic, strong) NSString *is;
@property (nonatomic, strong) NSString *pt;
@property (nonatomic, strong) NSString *ru;
@property (nonatomic, strong) NSString *it;
@property (nonatomic, strong) NSString *fi;
@property (nonatomic, strong) NSString *es;
@property (nonatomic, strong) NSString *cs;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
