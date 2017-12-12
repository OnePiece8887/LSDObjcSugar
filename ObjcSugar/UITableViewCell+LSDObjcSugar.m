//
//  UITableViewCell+LSDObjcSugar.m
//  EasyToBuy
//
//  Created by ls on 2017/9/7.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "UITableViewCell+LSDObjcSugar.h"

@implementation UITableViewCell (LSDObjcSugar)
+(instancetype)lsd_tableViewCellWithTableView:(UITableView *)tableView{
    
    NSString *ReusedID = NSStringFromClass(self);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedID];
    
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReusedID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
@end
