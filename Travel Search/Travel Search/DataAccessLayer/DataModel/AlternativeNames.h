//
//  AlternativeNames.h
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AlternativeNames : NSObject <NSCoding, NSCopying>


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
