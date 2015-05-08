require 'yt/collections/base'
require 'yt/models/location'

module Yt
  module Collections
    class Locations < Base

    private

      def attributes_for_new_item(data)
        {data: data['location']}
      end

      # @return [Hash] the parameters to submit to YouTube to get the
      #   content detail of a resource, for instance a video.
      # @see https://developers.google.com/youtube/v3/docs/videos#resource
      def list_params
        super.tap do |params|
          params[:params] = locations_params
          params[:path] = '/youtube/v3/videos'
        end
      end

      def locations_params
        {max_results: 50, part: 'location', id: @parent.id}
      end
    end
  end
end
