# encoding: UTF-8
require 'spec_helper'
require 'yt/models/channel'
require 'yt/models/playlist'

describe Yt::Playlist, :partner do
  subject(:playlist) { Yt::Playlist.new id: id, auth: $content_owner }

  context 'given a playlist of a partnered channel', :partner do
    context 'managed by the authenticated Content Owner' do
      let(:id) { ENV['YT_TEST_PARTNER_PLAYLIST_ID'] }

      describe 'views can be retrieved for a specific day' do
        context 'in which the playlist was viewed' do
          let(:views) { playlist.views_on ENV['YT_TEST_PARTNER_PLAYLIST_DATE']}
          it { expect(views).to be_a Float }
        end

        context 'in which the playlist was not viewed' do
          let(:views) { playlist.views_on 20.years.ago}
          it { expect(views).to be_nil }
        end
      end

      describe 'views can be retrieved for a range of days' do
        let(:date) { 4.days.ago }

        specify 'with a given start (:since option)' do
          expect(playlist.views(since: date).keys.min).to eq date.to_date
        end

        specify 'with a given end (:until option)' do
          expect(playlist.views(until: date).keys.max).to eq date.to_date
        end

        specify 'with a given start (:from option)' do
          expect(playlist.views(from: date).keys.min).to eq date.to_date
        end

        specify 'with a given end (:to option)' do
          expect(playlist.views(to: date).keys.max).to eq date.to_date
        end
      end

      describe 'views can be grouped by day' do
        let(:range) { {since: 4.days.ago.to_date, until: 3.days.ago.to_date} }
        let(:keys) { range.values }

        specify 'without a :by option (default)' do
          views = playlist.views range
          expect(views.keys).to eq range.values
        end

        specify 'with the :by option set to :day' do
          views = playlist.views range.merge by: :day
          expect(views.keys).to eq range.values
        end
      end

      describe 'playlist starts can be retrieved for a specific day' do
        context 'in which the playlist was viewed' do
          let(:playlist_starts) { playlist.playlist_starts_on ENV['YT_TEST_PARTNER_PLAYLIST_DATE']}
          it { expect(playlist_starts).to be_a Float }
        end

        context 'in which the playlist was not viewed' do
          let(:playlist_starts) { playlist.playlist_starts_on 20.years.ago}
          it { expect(playlist_starts).to be_nil }
        end
      end

      describe 'playlist starts can be retrieved for a range of days' do
        let(:date) { 4.days.ago }

        specify 'with a given start (:since option)' do
          expect(playlist.playlist_starts(since: date).keys.min).to eq date.to_date
        end

        specify 'with a given end (:until option)' do
          expect(playlist.playlist_starts(until: date).keys.max).to eq date.to_date
        end

        specify 'with a given start (:from option)' do
          expect(playlist.playlist_starts(from: date).keys.min).to eq date.to_date
        end

        specify 'with a given end (:to option)' do
          expect(playlist.playlist_starts(to: date).keys.max).to eq date.to_date
        end
      end

      describe 'playlist starts can be grouped by day' do
        let(:range) { {since: 4.days.ago.to_date, until: 3.days.ago.to_date} }
        let(:keys) { range.values }

        specify 'without a :by option (default)' do
          playlist_starts = playlist.playlist_starts range
          expect(playlist_starts.keys).to eq range.values
        end

        specify 'with the :by option set to :day' do
          playlist_starts = playlist.playlist_starts range.merge by: :day
          expect(playlist_starts.keys).to eq range.values
        end
      end

      describe 'average time in playlist can be retrieved for a specific day' do
        context 'in which the playlist was viewed' do
          let(:average_time_in_playlist) { playlist.average_time_in_playlist_on ENV['YT_TEST_PARTNER_PLAYLIST_DATE']}
          it { expect(average_time_in_playlist).to be_a Float }
        end

        context 'in which the playlist was not viewed' do
          let(:average_time_in_playlist) { playlist.average_time_in_playlist_on 20.years.ago}
          it { expect(average_time_in_playlist).to be_nil }
        end
      end

      describe 'average time in playlist can be retrieved for a range of days' do
        let(:date) { 4.days.ago }

        specify 'with a given start (:since option)' do
          expect(playlist.average_time_in_playlist(since: date).keys.min).to eq date.to_date
        end

        specify 'with a given end (:until option)' do
          expect(playlist.average_time_in_playlist(until: date).keys.max).to eq date.to_date
        end

        specify 'with a given start (:from option)' do
          expect(playlist.average_time_in_playlist(from: date).keys.min).to eq date.to_date
        end

        specify 'with a given end (:to option)' do
          expect(playlist.average_time_in_playlist(to: date).keys.max).to eq date.to_date
        end
      end

      describe 'average time in playlist can be grouped by day' do
        let(:range) { {since: 4.days.ago.to_date, until: 3.days.ago.to_date} }
        let(:keys) { range.values }

        specify 'without a :by option (default)' do
          average_time_in_playlist = playlist.average_time_in_playlist range
          expect(average_time_in_playlist.keys).to eq range.values
        end

        specify 'with the :by option set to :day' do
          average_time_in_playlist = playlist.average_time_in_playlist range.merge by: :day
          expect(average_time_in_playlist.keys).to eq range.values
        end
      end

      describe 'views per playlist start can be retrieved for a specific day' do
        context 'in which the playlist was viewed' do
          let(:views_per_playlist_start) { playlist.views_per_playlist_start_on ENV['YT_TEST_PARTNER_PLAYLIST_DATE']}
          it { expect(views_per_playlist_start).to be_a Float }
        end

        context 'in which the playlist was not viewed' do
          let(:views_per_playlist_start) { playlist.views_per_playlist_start_on 20.years.ago}
          it { expect(views_per_playlist_start).to be_nil }
        end
      end

      describe 'views per playlist start can be retrieved for a range of days' do
        let(:date) { 4.days.ago }

        specify 'with a given start (:since option)' do
          expect(playlist.views_per_playlist_start(since: date).keys.min).to eq date.to_date
        end

        specify 'with a given end (:until option)' do
          expect(playlist.views_per_playlist_start(until: date).keys.max).to eq date.to_date
        end

        specify 'with a given start (:from option)' do
          expect(playlist.views_per_playlist_start(from: date).keys.min).to eq date.to_date
        end

        specify 'with a given end (:to option)' do
          expect(playlist.views_per_playlist_start(to: date).keys.max).to eq date.to_date
        end
      end

      describe 'views per playlist start can be grouped by day' do
        let(:range) { {since: 4.days.ago.to_date, until: 3.days.ago.to_date} }
        let(:keys) { range.values }

        specify 'without a :by option (default)' do
          views_per_playlist_start = playlist.views_per_playlist_start range
          expect(views_per_playlist_start.keys).to eq range.values
        end

        specify 'with the :by option set to :day' do
          views_per_playlist_start = playlist.views_per_playlist_start range.merge by: :day
          expect(views_per_playlist_start.keys).to eq range.values
        end
      end
    end

    context 'not managed by the authenticated Content Owner' do
      let(:id) { 'PLbpi6ZahtOH6J5oPGySZcmbRfT7Hyq1sZ' }

      specify 'playlist starts cannot be retrieved' do
        expect{playlist.views}.to raise_error Yt::Errors::Forbidden
        expect{playlist.playlist_starts}.to raise_error Yt::Errors::Forbidden
        expect{playlist.average_time_in_playlist}.to raise_error Yt::Errors::Forbidden
        expect{playlist.views_per_playlist_start}.to raise_error Yt::Errors::Forbidden
      end
    end
  end
end