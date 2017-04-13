//
//  School+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "School+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface School (CoreDataProperties)

+ (NSFetchRequest<School *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Grades *> *shcoolToGrad;

@end

@interface School (CoreDataGeneratedAccessors)

- (void)addShcoolToGradObject:(Grades *)value;
- (void)removeShcoolToGradObject:(Grades *)value;
- (void)addShcoolToGrad:(NSSet<Grades *> *)values;
- (void)removeShcoolToGrad:(NSSet<Grades *> *)values;

@end

NS_ASSUME_NONNULL_END
