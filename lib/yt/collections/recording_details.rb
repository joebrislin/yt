require 'yt/collections/base'
require 'yt/models/recording_detail'

module Yt
  module Collections
    class RecordingDetails < Base

    private

      def attributes_for_new_item(data)
        {data: data['recordingDetails']}
      end

      # @return [Hash] the parameters to submit to YouTube to get the
      #   content detail of a resource, for instance a video.
      # @see https://developers.google.com/youtube/v3/docs/videos#resource
      def list_params
        super.tap do |params|
          params[:params] = recording_details_params
          params[:path] = '/youtube/v3/videos'
        end
      end

      def recording_details_params
        {max_results: 50, part: 'recordingDetails', id: @parent.id}
      end
    end
  end
end
