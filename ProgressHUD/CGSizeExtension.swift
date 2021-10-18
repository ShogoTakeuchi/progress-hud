//
//  CGSizeExtension.swift
//  ProgressHUD
//
//  Created by Shogo Takeuchi on 2021/10/18.
//

import CoreGraphics

extension CGSize: Hashable {
     public func hash(into hasher: inout Hasher) {
         hasher.combine(width)
         hasher.combine(height)
     }
 }
