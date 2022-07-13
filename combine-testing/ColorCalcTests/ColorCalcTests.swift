import XCTest
import Combine
import SwiftUI
@testable import ColorCalc

class ColorCalcTests: XCTestCase {
  var viewModel: CalculatorViewModel!
  var subscriptions = Set<AnyCancellable>()
  
  
  override func setUp() {
    viewModel = CalculatorViewModel()
  }
  
  override func tearDown() {
    subscriptions = []
  }
  
  func test_correctNameReceived() {
    //given
    let expected = "rwGreen 66%"
    var result = ""
    
    viewModel.$name
      .sink(receiveValue: { result = $0 })
      .store(in: &subscriptions)
    
    //when
    viewModel.hexText = "006636AA"
    
    //then
    XCTAssert(
    result == expected,
    "Name expected to be \(expected) but was \(result)")
  }
  
  func test_processBackspaceDeletesLastCharacter() {
    //given
    let expected = "#0080F"
    var result = ""
    
    viewModel.$hexText
      .dropFirst()
      .sink(receiveValue: { result = $0 })
      .store(in: &subscriptions)
    
    //when
    viewModel.process(CalculatorViewModel.Constant.backspace)
    
    //then
    XCTAssert(
      result == expected,
    "Hex was expected to be \(expected) but was \(result)")
  }
  
  func test_correctColorReceived() {
    // Given
    let expected = Color(hex: ColorName.rwGreen.rawValue)!
    var result: Color = .clear
    
    viewModel.$color
      .sink(receiveValue: { result = $0 })
      .store(in: &subscriptions)
    
    // When
    viewModel.hexText = ColorName.rwGreen.rawValue
    
    // Then
    XCTAssert(
      result == expected,
      "Color expected to be \(expected) but was \(result)"
    )
  }
  
  func test_processBackspaceReceivesCorrectColor() {
    // Given
    let expected = Color.white
    var result = Color.clear
    
    viewModel.$color
      .sink(receiveValue: { result = $0 })
      .store(in: &subscriptions)
    
    // When
    viewModel.process(CalculatorViewModel.Constant.backspace)

    // Then
    XCTAssert(
      result == expected,
      "Hex was expected to be \(expected) but was \(result)"
    )
  }

  func test_whiteColorReceivedForBadData() {
    // Given
    let expected = Color.white
    var result = Color.clear

    viewModel.$color
      .sink(receiveValue: { result = $0 })
      .store(in: &subscriptions)
    
    // When
    viewModel.hexText = "abc"
    
    // Then
    XCTAssert(
      result == expected,
      "Color expected to be \(expected) but was \(result)"
    )
  }

  
 
  
}
