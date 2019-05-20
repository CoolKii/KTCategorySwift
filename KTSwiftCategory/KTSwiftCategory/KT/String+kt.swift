//
//  String+kt.swift
//  HBean_Stu
//
//  Created by Kevin Tan on 2019/4/9.
//  Copyright © 2019 Kevin Tan. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
     func isPhoneNumber() -> Bool {
        let phoneNum = self as NSString
        if phoneNum.length == 0 {
            return false
        }
        let mobile = "^1(3[0-9]|4[5-7]|5[0-9]|6[0-9]|8[0-9]|7[0-9]|9[0-9])\\d{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regexMobile.evaluate(with: self) == true {
            return true
        }else{
            return false
        }
    }
    func isEffectiveYZCode() -> Bool {
        let yzCode = self as NSString
        if yzCode.length == 0 {
            return false
        }
        let yzCodeRule = "^[0-9]{4}"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",yzCodeRule)
        if regexMobile.evaluate(with: self) == true {
            return true
        }else{
            return false
        }
    }
    func isEnglishName() -> Bool {
        let enName = self as NSString
        if enName.length == 0 {
            return false
        }
        let enNameRule = "^[a-zA-Z0-9_ -]{2,30}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",enNameRule)
        if regexMobile.evaluate(with: self) == true {
            return true
        }else{
            return false
        }
    }
    
    func isNotNull() -> Bool {
        let string = self as NSString
        if string.isEqual(to: "") {
            return false
        }
        if string.length == 0 {
            return false
        }
        return true
    }
    
    //            计算文字高度
    func getTextRectSize(text:NSString,font:UIFont,size:CGSize) -> CGRect {
        let attributes = [NSAttributedString.Key.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect;
    }
    
    func getWidthWithHeight(font:UIFont, height:CGFloat) -> CGFloat{
        let nsStr:NSString = self as NSString;
        let rec = nsStr.boundingRect(with: CGSize(width:CGFloat(MAXFLOAT), height:height), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil);
        return rec.size.width;
    }
    

}



