//
//  Headmaster+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Headmaster+CoreDataProperties.h"

@implementation Headmaster (CoreDataProperties)

+ (NSFetchRequest<Headmaster *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Headmaster"];
}

@dynamic name;
@dynamic headmasterToclass;
@dynamic headmasterToGrade;

-(void)awakeFromFetch{
    [super awakeFromFetch];
    
}
-(void)awakeFromInsert{
    [super awakeFromInsert];
    NSLog(@"%s %@",__func__,self.name);
}
-(void)didTurnIntoFault{
    
}
@end
