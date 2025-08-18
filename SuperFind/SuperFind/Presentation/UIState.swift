//
//  UIState.swift
//  SuperFind
//
//  Created by Andrea Torres on 15/07/25.
//

enum UIState<T> {
    case initialState
    case loadingState
    case successState(T)
    case failureState(String)
}
