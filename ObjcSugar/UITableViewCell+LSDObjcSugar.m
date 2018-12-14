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
    
    NSString *ReusedID = [NSString stringWithFormat:@"%@",NSStringFromClass(self)];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
@end
