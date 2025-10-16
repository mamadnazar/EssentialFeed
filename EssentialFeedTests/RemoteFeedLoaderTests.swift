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
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
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
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        
        #expect((client.requestedURL == nil))
    }

    @Test func test_load_requestDataFromURL() async throws {
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        sut.load()
        
        #expect(url == client.requestedURL)
    }
}
