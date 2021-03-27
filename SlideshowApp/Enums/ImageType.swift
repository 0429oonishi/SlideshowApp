//
//  ImageType.swift
//  SlideshowApp
//
//  Created by 大西玲音 on 2021/03/27.
//

enum ImageType {
    case tanjirou
    case tomioka
    case zenitu
    case muzan
    case rengoku
    case teoni
    var title: String {
        switch self {
        case .tanjirou: return "tanjirou"
        case .tomioka: return "tomioka"
        case .zenitu: return "zenitu"
        case .muzan: return "muzan"
        case .rengoku: return "rengoku"
        case .teoni: return "teoni"
        }
    }
    func move() -> Self {
        switch self {
        case .tanjirou: return .tomioka
        case .tomioka: return .zenitu
        case .zenitu: return .muzan
        case .muzan: return .rengoku
        case .rengoku: return .teoni
        case .teoni: return .tanjirou
        }
    }
    func back() -> Self {
        switch self {
        case .tanjirou: return .teoni
        case .tomioka: return .tanjirou
        case .zenitu: return .tomioka
        case .muzan: return .zenitu
        case .rengoku: return .muzan
        case .teoni: return .rengoku
        }
    }
}
