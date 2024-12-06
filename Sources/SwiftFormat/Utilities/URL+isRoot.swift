//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import Foundation

#if os(Windows)
import WinSDK
#endif

extension URL {
  @_spi(Testing) public var isRoot: Bool {
      guard isFileURL else { return false }
      #if os(macOS)
      return self.path == NSOpenStepRootDirectory()
    #elseif os(Windows)
      return self.path.withCString(encodedAs: UTF16.self, PathCchIsRoot)
    #else
    return self.path == "/"
    #endif
  }
}
