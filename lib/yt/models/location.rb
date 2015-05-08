require 'yt/models/base'

module Yt
  module Models
    # Encapsulates information about the video recording attributes, including the location
    # of the video and the date recorded
    # @see https://developers.google.com/youtube/v3/docs/videos#resource
    class Location < Base
      attr_reader :data

      def initialize(options = {})
        @data = options[:data]
      end

      # @return [Integer] if the resource is a video, the video’s latitude.
      has_attribute :latitude, type: Integer

      # @return [Integer] if the resource is a video, the video’s longitude.
      has_attribute :longitude, type: Integer

      # @return [Integer] if the resource is a video, the video’s altitude.
      has_attribute :altitude, type: Integer

    end
  end
end
