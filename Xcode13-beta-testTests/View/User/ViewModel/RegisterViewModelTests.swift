//
//  RegisterViewModelTests.swift
//  Xcode13-beta-testTests
//
//  Created by Alberto Caamano Souto on 7/7/21.
//

import XCTest
@testable import Xcode13_beta_test
class RegisterViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpOk() async throws {
        let viewModel = RegisterViewModel(service: APIServiceMock())
        viewModel.email = "test@test.com"
        viewModel.password = "password"
        viewModel.name = "name"
        viewModel.lastname = "name"
        let _ = try await viewModel.signUp()
        XCTAssert(viewModel.result == "OK!")
    }

    func testSignUpFailed() async throws {
        let viewModel = RegisterViewModel(service: APIServiceMock())
        viewModel.email = "test@test.com"
        viewModel.password = "password"
        let _ = try await viewModel.signUp()
        XCTAssert(viewModel.result == "Failed!")
    }

}
