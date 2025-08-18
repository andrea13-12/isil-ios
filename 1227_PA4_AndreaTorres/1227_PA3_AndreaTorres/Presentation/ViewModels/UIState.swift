//
//  UIState.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 11/06/25.
//

enum UIState<T> {
    case idle
    case loading
    case success(T)
    case failure(String)
}
