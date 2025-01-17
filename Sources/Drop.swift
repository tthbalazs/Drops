//
//  Drops
//
//  Copyright (c) 2021-Present Omar Albeik - https://github.com/omaralbeik
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

/// An object representing a drop.
public struct Drop {
    /// Create a new drop.
    /// - Parameters:
    ///   - title: Title.
    ///   - subtitle: Optional subtitle. Defaults to `nil`.
    ///   - icon: Optional icon.
    ///   - action: Optional action.
    ///   - position: Position. Defaults to `Drop.Position.top`.
    ///   - duration: Duration. Defaults to `Drop.Duration.recommended`.
    public init(
        title: String,
        subtitle: String? = nil,
        icon: UIImage? = nil,
        action: Action? = nil,
        position: Position = .top,
        duration: Duration = .recommended
    ) {
        self.title = title.trimmingCharacters(in: .whitespacesAndNewlines)
        if let subtitle = subtitle?.trimmingCharacters(in: .whitespacesAndNewlines), !subtitle.isEmpty {
            self.subtitle = subtitle
        }
        self.icon = icon
        self.action = action
        self.position = position
        self.duration = duration
    }

    /// Title.
    public var title: String

    /// Subtitle.
    public var subtitle: String?

    /// Icon.
    public var icon: UIImage?

    /// Action.
    public var action: Action?

    /// Position.
    public var position: Position

    /// Duration.
    public var duration: Duration
}

extension Drop {
    /// An enum representing drop presentation position.
    public enum Position: Equatable {
        /// Drop is presented from top.
        case top
        /// Drop is presented from bottom.
        case bottom
    }
}

extension Drop {
    /// An enum representing a drop duration on screen.
    public enum Duration: Equatable {
        /// Hides the drop after 2.0 seconds.
        case recommended
        /// Hides the drop after the specified number of seconds.
        case seconds(TimeInterval)

        internal var value: TimeInterval {
            switch self {
            case .recommended:
                return 2.0
            case .seconds(let custom):
                return custom
            }
        }
    }
}

extension Drop {
    /// An object representing a drop action.
    public struct Action {
        /// Create a new action.
        /// - Parameters:
        ///   - icon: Optional icon image.
        ///   - handler: Handler to be called when the drop is tapped.
        public init(icon: UIImage? = nil, handler: @escaping () -> Void) {
            self.icon = icon
            self.handler = handler
        }

        /// Icon.
        public var icon: UIImage?

        /// Handler.
        public var handler: () -> Void
    }
}
