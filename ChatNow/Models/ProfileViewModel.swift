//
//  ProfileViewModel.swift
//  ChatNow
//
//  Created by  Emmanuel on 12/12/21.
//

import Foundation

enum ProfileViewModelType {
    case info, logout
}

struct ProfileViewModel {
    let viewModelType: ProfileViewModelType
    let title: String
    let handler: (() -> Void)?
}
