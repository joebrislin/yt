require 'yt/models/base'

module Yt
  module Models
    # Encapsulates information about a live video broadcast.
    # The object will only be present in a video resource if the video is an
    # upcoming, live, or completed live broadcast.
    # @see https://developers.google.com/youtube/v3/docs/videos#resource
    class RecordingDetail < Base

      def initialize(options = {})
        @data = options[:data] || {}
      end

      # @return [String] if the resource is a video, the video’s description of location filmed.
      has_attribute :location_description, default: ''

      # @return [Hash] if the resource is a video, the video’s description of location filmed.
      has_attribute :location, default: {}

      # @return [Time] if the resource is a video, the date and time that the video was recorded
      has_attribute :recording_date, type: Time

    end
  end
end
