//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Shohkarim Mamadnazar on 16/10/25.
//

import Testing
import Foundation

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init () {}
    
    var requestedURL: URL?
}

struct RemoteFeedLoaderTests {

    @Test func test_init_doesNotRequestDataFromURL() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        #expect((client.requestedURL == nil))
    }

    @Test func test_load_requestDataFromURL() async throws {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        #expect(client.requestedURL != nil)
    }
}
