//
//  Headmaster+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Headmaster+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Headmaster (CoreDataProperties)

+ (NSFetchRequest<Headmaster *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) ClassRoom *headmasterToclass;
@property (nullable, nonatomic, retain) Grades *headmasterToGrade;

@end

NS_ASSUME_NONNULL_END
