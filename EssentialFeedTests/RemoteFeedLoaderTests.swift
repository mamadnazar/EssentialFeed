//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Shohkarim Mamadnazar on 16/10/25.
//

import Testing
import Foundation

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

struct RemoteFeedLoaderTests {

    @Test func test_init_doesNotRequestDataFromURL() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        #expect((client.requestedURL == nil))
    }

}
