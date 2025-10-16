//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Shohkarim Mamadnazar on 16/10/25.
//

import Testing
import Foundation

class RemoteFeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

struct RemoteFeedLoaderTests {

    @Test func test_init_doesNotRequestDataFromURL() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        
        #expect((client.requestedURL == nil))
    }

    @Test func test_load_requestDataFromURL() async throws {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        #expect(client.requestedURL != nil)
    }
}
