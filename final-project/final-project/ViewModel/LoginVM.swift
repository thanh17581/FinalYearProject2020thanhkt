////
////  LoginVM.swift
////  final-project
////
////  Created by Apple on 11/23/20.
////  Copyright © 2020 Vinsofts. All rights reserved.
////
//
//import Foundation
//import RxCocoa
//
//final class LoginVM: BaseVM {
//    var user = BehaviorRelay<AccountModel?>(value: nil)
//
//    func checkUserName(_ username: String?) -> (Bool, String){
//        guard let user = username, !user.trimed.isEmpty else {
//            return (false, "Tên đăng nhập không được để trống.")
//        }
//        if user.count < 6 {
//            return (false, "Tên đăng nhập phải có ít nhất 6 ký tự.")
//        }
//        if user.hasSpcialCharacter() {
//            return (false, "Tên đăng nhập không được có ký tự đặc biệt.")
//        }
//        return (true,"")
//    }
//
//    func checkPass(_ password: String?) -> (Bool, String) {
//        guard let pass = password, !pass.trimed.isEmpty else {
//            return (false, "Mật khẩu không được để trống.")
//        }
//        return (true, "")
//    }
//
//    func login(inVC vc: BaseVC, username: String, password: String){
//        var input: [String: String] = [:]
//        input["username"] = username
//        input["password"] = password
//        
//        
//        
//    }
//}
