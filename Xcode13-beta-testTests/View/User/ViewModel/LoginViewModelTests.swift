//
//  LoginViewModelTests.swift
//  Xcode13-beta-testTests
//
//  Created by Alberto Caamano Souto on 7/7/21.
//

import XCTest
@testable import Xcode13_beta_test

class LoginViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignInOk() async throws {
        let viewModel = LoginViewModel(service: APIServiceMock())
        viewModel.email = "test@test.com"
        viewModel.password = "good password"
        let _ = try await viewModel.signIn()
        XCTAssert(viewModel.result == "OK!")
    }

    func testSignInFailed() async throws {
        let viewModel = LoginViewModel(service: APIServiceMock())
        viewModel.email = "test@test.com"
        viewModel.password = "bad password"
        let _ = try await viewModel.signIn()
        XCTAssert(viewModel.result == "Failed!")
    }

}
