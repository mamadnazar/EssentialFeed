//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Shohkarim Mamadnazar on 16/10/25.
//

import Foundation
import Testing
import EssentialFeed

struct RemoteFeedLoaderTests {

    @Test func test_init_doesNotRequestDataFromURL() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let (_, client) = makeSUT()
        
        #expect((client.requestedURL == nil))
    }

    @Test func test_load_requestsDataFromURL() async throws {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        #expect(url == client.requestedURL)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        
        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }
    
}
