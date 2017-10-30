//
//  UITableViewCell+LSDObjcSugar.m
//  EasyToBuy
//
//  Created by 神州锐达 on 2017/9/7.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "UITableViewCell+LSDObjcSugar.h"

@implementation UITableViewCell (LSDObjcSugar)
+(instancetype)lsd_tableViewCellWithTableView:(UITableView *)tableView{
    
    NSString *ReusedID = NSStringFromClass(self);
    
    UINib *nib = [UINib nibWithNibName:[NSString stringWithFormat:@"%@Xib",ReusedID] bundle:[NSBundle mainBundle]];
    
    [tableView registerNib:nib forCellReuseIdentifier:ReusedID];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedID];
    
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReusedID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
@end
