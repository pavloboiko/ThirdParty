/*
 The MIT License (MIT)

 Copyright (c) 2015-present Badoo Trading Limited.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/

import UIKit

final class PhotosInputPlaceholderCell: UICollectionViewCell {

    private struct Constants {
        static let backgroundColor = UIColor(red: 231.0/255.0, green: 236.0/255.0, blue: 242.0/255.0, alpha: 1)
        static let imageName = "lock"
        static let accessibilityIdentifier = "chatto.inputbar.photos.cell.placeholder"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private var imageView: UIImageView!
    private func commonInit() {
        self.imageView = UIImageView()
        self.imageView.contentMode = .center
        self.imageView.image = UIImage(named: Constants.imageName, in: Bundle.current, compatibleWith: nil)
        self.contentView.addSubview(self.imageView)
        self.contentView.backgroundColor = Constants.backgroundColor
        self.accessibilityIdentifier = Constants.accessibilityIdentifier
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.sizeToFit()
        self.imageView.center = self.contentView.bounds.bma_center
    }
}
