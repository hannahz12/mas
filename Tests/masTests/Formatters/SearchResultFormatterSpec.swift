//
//  SearchResultFormatterSpec.swift
//  masTests
//
//  Created by Ben Chatelain on 1/14/19.
//  Copyright © 2019 mas-cli. All rights reserved.
//

import Nimble
import Quick

@testable import mas

public class SearchResultFormatterSpec: QuickSpec {
    override public func spec() {
        // static func reference
        let format = SearchResultFormatter.format(results:includePrice:)
        var results: [SearchResult] = []

        beforeSuite {
            MAS.initialize()
        }
        describe("search results formatter") {
            beforeEach {
                results = []
            }
            it("formats nothing as empty string") {
                expect(format(results, false)).to(beEmpty())
            }
            it("can format a single result") {
                let result = SearchResult(
                    formattedPrice: "$9.87",
                    trackId: 12345,
                    trackName: "Awesome App",
                    version: "19.2.1"
                )
                expect(format([result], false)) == "       12345  Awesome App  (19.2.1)"
            }
            it("can format a single result with price") {
                let result = SearchResult(
                    formattedPrice: "$9.87",
                    trackId: 12345,
                    trackName: "Awesome App",
                    version: "19.2.1"
                )
                expect(format([result], true)) == "       12345  Awesome App  (19.2.1)  $9.87"
            }
            it("can format a two results") {
                results = [
                    SearchResult(
                        formattedPrice: "$9.87",
                        trackId: 12345,
                        trackName: "Awesome App",
                        version: "19.2.1"
                    ),
                    SearchResult(
                        formattedPrice: "$0.01",
                        trackId: 67890,
                        trackName: "Even Better App",
                        version: "1.2.0"
                    ),
                ]
                expect(format(results, false))
                    == "       12345  Awesome App      (19.2.1)\n       67890  Even Better App  (1.2.0)"
            }
            it("can format a two results with prices") {
                results = [
                    SearchResult(
                        formattedPrice: "$9.87",
                        trackId: 12345,
                        trackName: "Awesome App",
                        version: "19.2.1"
                    ),
                    SearchResult(
                        formattedPrice: "$0.01",
                        trackId: 67890,
                        trackName: "Even Better App",
                        version: "1.2.0"
                    ),
                ]
                expect(format(results, true))
                    == "       12345  Awesome App      (19.2.1)  $9.87\n       67890  Even Better App  (1.2.0)  $0.01"
            }
        }
    }
}
