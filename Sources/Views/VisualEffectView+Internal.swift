//
//  VisualEffectView+Internal.swift
//  Blurberry
//
//  Created by Pavel Puzyrev on 07.09.2020.
//
//  Copyright (c) 2020 Pavel Puzyrev <cannedapp@yahoo.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

internal extension BlurWrapper where Base: UIVisualEffectView {

    var backdropView: UIView? {
        base.subviews.first {
            type(of: $0) == NSClassFromString("_UIVisualEffectBackdropView")
        }
    }

    var overlayView: UIView? {
        base.subviews.first {
            type(of: $0) == NSClassFromString("_UIVisualEffectSubview")
        }
    }

    var gaussianBlurFilter: NSObject? {
        backdropView?.arrayValue(getter: "filters")?.first {
            $0.stringValue(getter: "filterType") == "gaussianBlur"
        }
    }

    var sourceOverEffect: NSObject? {
        overlayView?.arrayValue(getter: "viewEffects")?.first {
            $0.stringValue(getter: "filterType") == "sourceOver"
        }
    }

    func prepareForChanges() {
        base.effect = UIBlurEffect(style: .light)
        gaussianBlurFilter?.setIVarValue(value: 1.0, getter: "requestedScaleHint")
    }

    func applyChanges() {
        backdropView?.callMethod(named: "applyRequestedFilterEffects")
    }
}
