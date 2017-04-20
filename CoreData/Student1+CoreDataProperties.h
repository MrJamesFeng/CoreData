//
//  Student1+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/20.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Student1+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student1 (CoreDataProperties)

+ (NSFetchRequest<Student1 *> *)fetchRequest;

@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *classes;
@property (nullable, nonatomic, retain) NSObject *icon;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *addAttribute;
@property (nullable, nonatomic, retain) ClassRoom *studentToClass;

@end

NS_ASSUME_NONNULL_END
