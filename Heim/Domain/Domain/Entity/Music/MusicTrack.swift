//
//  MusicTrack.swift
//  Domain
//
//  Created by 정지용 on 11/25/24.
//

import Foundation

public struct MusicTrack: Equatable {
  public let thumbnail: URL?
  public let title: String
  public let artist: String
  public let isrc: String

  public init(thumbnail: URL?, title: String, artist: String, isrc: String) {
    self.thumbnail = thumbnail
    self.title = title
    self.artist = artist
    self.isrc = isrc
  }
}
