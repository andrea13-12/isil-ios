//
//  UIState.swift
//  EasyShoes
//
//  Created by Andrea Torres on 2/06/25.
//

enum UIState <T> {
    case idle
    case loading
    case success(T)
    case failure(String)
}
