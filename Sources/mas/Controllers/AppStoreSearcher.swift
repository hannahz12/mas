//
//  AppStoreSearcher.swift
//  mas
//
//  Created by Ben Chatelain on 12/29/18.
//  Copyright © 2018 mas-cli. All rights reserved.
//

import Foundation
import PromiseKit

/// Protocol for searching the MAS catalog.
protocol AppStoreSearcher {
    /// Looks up app details.
    ///
    /// - Parameter appID: App ID.
    /// - Returns: A `Promise` for the `SearchResult` for the given `appID` if `appID` is valid.
    ///   A `Promise` for `MASError.unknownAppID(appID)` if `appID` is invalid.
    ///   A `Promise` for some other `Error` if any problems occur.
    func lookup(appID: AppID) -> Promise<SearchResult>

    /// Searches for apps.
    ///
    /// - Parameter searchTerm: Term for which to search.
    /// - Returns: A `Promise` for an `Array` of `SearchResult`s matching `searchTerm`.
    func search(for searchTerm: String) -> Promise<[SearchResult]>
}
