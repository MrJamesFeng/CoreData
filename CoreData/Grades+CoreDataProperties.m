//
//  Grades+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Grades+CoreDataProperties.h"

@implementation Grades (CoreDataProperties)

+ (NSFetchRequest<Grades *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Grades"];
}

@dynamic no;
@dynamic gradeToheadmaster;
@dynamic gradeToSchool;

-(void)awakeFromInsert{
    [super awakeFromInsert];
    
}
-(void)awakeFromFetch{
    [super awakeFromFetch];
    NSLog(@"%s no-->%d",__func__,self.no);
}
@end
