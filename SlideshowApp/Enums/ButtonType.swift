//
//  ButtonType.swift
//  SlideshowApp
//
//  Created by 大西玲音 on 2021/03/27.
//

enum ButtonType {
    case play
    case stop
    var title: String {
        switch self {
        case .play: return "再生"
        case .stop: return "停止"
        }
    }
}
