//
//  RegularExpUtil.swift
//  newenergy-ios
//
//  Created by 李荣潭 on 2020/6/5.
//  Copyright © 2020 cgf. All rights reserved.
//

// 常规正则效验
class RegularExpUtil: NSObject {
    /// 手机号格式效验
    /// - Parameters:
    ///     - phone: 手机号
    /// - Returns: Bool
    static func isPhoneNumber(phone: String) -> Bool {
        let mobile = "^1[3456789]\\d{9}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regextestmobile.evaluate(with: phone) {
            return true
        }
        return false
    }
    
    /// 邮箱格式效验
    /// - Parameters:
    ///     - email: 邮箱
    /// - Returns: Bool
    static func isEmail(email: String) -> Bool {
        let regText = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$"
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        if regPredicate.evaluate(with: email) {
            return true
        }
        return false
    }
    
    /// 常规密码效验 字符串和数字
    /// - Parameters:
    ///     - password: 密码
    /// - Returns: Bool
    static func isRegularPassword(password: String) -> Bool {
        
        let regText = "^(?![0-9]+$)[a-zA-Z0-9]{6,32}"
        
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        
        if regPredicate.evaluate(with: password) {
            return true
        }
        return false
    }
    ///判断昵称正则
    static func isNickname(nickName: String) -> Bool {
//        、 _ - . ~ * !    _、-\\.\\~\\*\\!
        let regText = "^[a-zA-Z0-9\\u4E00-\\u9FEA_、\\-.~\\*!]{4,30}"
        
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        
        if regPredicate.evaluate(with: nickName) {
            return true
        }
        return false
    }
    
    ///发票税号正则
    static func isTaxId(value: String) -> Bool{
        let regText = "^[a-zA-Z0-9]{15,20}"
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        if regPredicate.evaluate(with: value) {
            return true
        }
        return false
    }
    
    ///车牌正则
    static func isPlateNumber(value: String) -> Bool {
        let regText = "^[a-zA-Z0-9]{5,6}"
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        if regPredicate.evaluate(with: value) {
            return true
        }
        return false
    }
    
    /// 中英文数字正则
    static func isCEN(value: String, chars:[String] = []) -> Bool {
        let charsText = chars.joined(separator: "")
        let regText = "^[A-z0-9\\u4e00-\\u9fa5\(charsText)]*$"
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        if regPredicate.evaluate(with: value) {
            return true
        }
        return false
    }
    /// 中英文正则
    static func isCE(value: String, chars:[String] = []) -> Bool {
        let charsText = chars.joined(separator: "")
        let regText = "^[A-z\\u4e00-\\u9fa5\(charsText)]*$"
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        if regPredicate.evaluate(with: value) {
            return true
        }
        return false
    }
    
    /// 中文正则
    static func isChinese(value: String) -> Bool {
        let regText = "^[\\u4e00-\\u9fa5]*$"
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        if regPredicate.evaluate(with: value) {
            return true
        }
        return false
    }
    
    /// 身份证正则
    static func isIdentityCard(value: String) -> Bool {
        let regText18 = "^([1-6])\\d{5}(18|19|20)\\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$"
        let regText15 = "^([1-6])\\d{5}\\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\\d{3}$"
        if value.count == 18 {
            let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText18)
            if regPredicate.evaluate(with: value) {
                return true
            }
        } else if value.count == 15 {
            let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText15)
            if regPredicate.evaluate(with: value) {
                return true
            }
        }
        return false
    }
    
    /// 字母数字正则
    static func isNumberOrLetter(value: String) -> Bool {
        let regText = "^[A-z0-9]*$"
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        if regPredicate.evaluate(with: value) {
            return true
        }
        return false
    }
    
    /// 数字正则
    static func isNumber(value: String) -> Bool {
        let regText = "^[0-9]*$"
        let regPredicate = NSPredicate(format: "SELF MATCHES %@",regText)
        if regPredicate.evaluate(with: value) {
            return true
        }
        return false
    }
}
