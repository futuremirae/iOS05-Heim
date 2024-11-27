//
//  GraphView.swift
//  Presentation
//
//  Created by 김미래 on 11/22/24.
//

import UIKit

final class GraphView: UIView {
  // TODO: mock데이터 제거 및 color 추가
  let emotionCharts: [Chart] =
  [Chart(value: 0.1, emotion: .sadness),
   Chart(value: 1.0, emotion: .angry),
   Chart(value: 0.3, emotion: .disgust),
   Chart(value: 0.7, emotion: .fear),
   Chart(value: 0.6, emotion: .happiness),
   Chart(value: 0.5, emotion: .neutral),
   Chart(value: 0.5, emotion: .surprise)]

  private let emotionEmojis = HeimEmoji.defaultEmotions()

  private let graphStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = LayoutConstants.defaultPadding
    stackView.distribution = .fillEqually
    return stackView
  }()

  private let emotionStack: UIStackView = {
    let stackView = UIStackView()
//    stackView.spacing = LayoutConstants.defaultPadding
    stackView.distribution = .fillProportionally
    return stackView
  }()

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupLayoutConstraints()
    setupGraphStackView()
    setupEmojiStackView()
  }
  // TODO: [Chart]파라미터로 하는 Initializer 만들기
}

// MARK: - Layout
private extension GraphView {
  enum LayoutConstants {
    static let defaultPadding: CGFloat = 13
    static let graphViewHeightRatio: CGFloat = 0.7
    static let emotionViewHeightRatio: CGFloat = 0.3
  }

  func setupViews() {
    addSubview(graphStackView)
    addSubview(emotionStack)
  }

  func setupGraphStackView() {
    emotionCharts.forEach {
      let barView = BarView(chart: $0)
      graphStackView.addArrangedSubview(barView)
    }
  }

  func setupEmojiStackView() {
    emotionEmojis.forEach { emotionEmoji in 
      emotionEmoji.snp.makeConstraints {
        $0.height.equalTo(emotionStack)
        $0.width.equalTo(emotionEmoji.snp.height)
      }
      
      emotionStack.addArrangedSubview(emotionEmoji)
    }
  }

  func setupLayoutConstraints() {
    graphStackView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.snp.height).multipliedBy(LayoutConstants.graphViewHeightRatio)
    }

    emotionStack.snp.makeConstraints {
      $0.top.equalTo(graphStackView.snp.bottom).offset(LayoutConstants.defaultPadding)
      $0.leading.trailing.equalTo(graphStackView)
      $0.height.equalToSuperview().multipliedBy(LayoutConstants.emotionViewHeightRatio)
    }
  }
}
