//
//  ViewController.swift
//  Blurberry-Demo-iOS
//
//  Created by Pavel Puzyrev on 09.09.2020.
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
import Blurberry

final class ViewController: UIViewController {

    @IBOutlet private weak var blurSlider: UISlider?
    @IBOutlet private weak var visualEffectView: UIVisualEffectView?
    @IBOutlet private weak var separatorView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let blurSlider = blurSlider {
            visualEffectView?.blur.radius = blurSlider.value.blurReady
            visualEffectView?.blur.tintColor = .clear
        }
    }
}

private extension ViewController {

    @IBAction func sliderValueChanged(_ blurSlider: UISlider) {
        visualEffectView?.blur.radius = blurSlider.value.blurReady
    }
    
    @IBAction func colorButtonClicked(_ button: Button) {
        UIView.animate(withDuration: 0.25) { [unowned self] in
            self.blurSlider?.tintColor = button.color
            self.separatorView?.backgroundColor = button.color
            self.visualEffectView?.blur.tintColor = button.providedColor
        }
    }
}

private extension Float {

    var blurReady: CGFloat {
        CGFloat(self * 100.0 / 5.0)
    }
}
