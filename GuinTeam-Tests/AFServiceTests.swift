//
//  AFServiceTests.swift
//  GuinTeam-Tests
//
//  Created by HeonJin Ha on 12/30/23.
//

import XCTest
@testable import GuinTeam_iOS

final class AFServiceTests: XCTestCase {
    
    var sut: AFService!
    
    override func setUp() {
        sut = .init()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_http_get_escaping_request_suceecss() {
        print("📋\(#function)---")
        let url = "https://dummy.restapiexample.com/api/v1/employees"
        
        let expectation = XCTestExpectation(description: "데이터가 성공적으로 리턴 되어야합니다.")

        sut.request(url: url, 
                    method: .get,
                    headers: .default,
                    parameters: nil,
                    returnType: EmployeesResponse.self) { result in
            
            switch result {
            case .success(let data):
                print("✅ --> \(data.data.first!)")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("ERROR: \(error)")
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func test_http_get_escaping_failure_502() {
        print("📋\(#function)---")
        let url = "https://9inteam.heon.dev/errorTest"
        
        let expectation = XCTestExpectation(description: "요청이 에러를 리턴해야합니다.")

        sut.request(url: url, method: .get,
                    headers: .default,
                    parameters: nil,
                    returnType: EmployeesResponse.self) { result in
            
            switch result {
            // swiftlint:disable:next empty_enum_arguments
            case .success(_):
                XCTFail("반드시 에러를 발생시켜야합니다.")
            case .failure(let error):
                print("✅ --> \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    // MARK: - Concurrency Test
    func test_http_get_concurrency_suceecss() async {
        print("📋\(#function)---")
        let url = "https://dummy.restapiexample.com/api/v1/employees"
        
        let expectation = XCTestExpectation(description: "데이터가 성공적으로 리턴 되어야합니다.")
        
        do {
            let response = try await sut.request(url,
                                          method: .get,
                                          headers: .default,
                                          parameters: nil,
                                          returnType: EmployeesResponse.self)
            print("✅ --> \(response.data.first!)")
            expectation.fulfill()
        } catch {
            XCTFail("ERROR: \(error)")
        }
    }
    
    func test_http_get_concurrency_failure_error() async {
        print("📋\(#function)---")
        let url = "https://9inteam.heon.dev/errorTest"
        
        let expectation = XCTestExpectation(description: "요청이 에러를 리턴해야합니다.")

        do {
            let response = try await sut.request(url,
                                  method: .get,
                                  headers: .default,
                                  parameters: nil,
                                  returnType: EmployeesResponse.self)
            XCTFail("반드시 에러를 발생시켜야합니다.")
        } catch {
            print("✅ --> \(error)")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
}

// MARK: - TestStub
struct EmployeesResponse: Decodable {
    let status: String
    let data: [Employees]
}

struct Employees: Decodable {
    let id: Int
    let name: String
    let salary: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case salary = "employee_salary"
    }
}
