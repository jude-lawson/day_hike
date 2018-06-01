require 'rails_helper'

RSpec.describe 'Trips Index Page (Visitor)' do
  context '/trips' do
    describe 'As a visitor' do
      it 'they should see a list of all hiking trip names' do
        visit trips_path

        @trips.each do |trip|
          expect(page).to have_link(trip.name)
        end
      end

      it 'clicking the link for a trip from the index page should take the user to that trip\'s show page' do
        visit trips_path

        within("#trip-#{@trips[0].id}") do
          click_link @trips[0].name
        end

        expect(page).to have_current_path(trip_path(@trips[0]))
        expect(page).to have_content(@trips[0].name)
      end
    end
  end

  context '/trip/:id' do
    describe 'As a visitor' do
      it 'should show a list of trails included in the trip' do
        visit trip_path(@trips[0])

        expect(page).to have_content(@trails[0].name)
        expect(page).to have_content("Address: #{@trails[0].address}")
        expect(page).to have_content("Length: #{@trails[0].length}")
        expect(page).to have_content(@trails[2].name)
        expect(page).to have_content("Address: #{@trails[2].address}")
        expect(page).to have_content("Length: #{@trails[2].length}")
      end

      it 'should show the total hiking distance of all trails on that trip' do
        visit trip_path(@trips[0])

        expect(page).to have_content("Trip Length: #{@trails[0].length.to_i + @trails[2].length.to_i} miles")
      end

      it 'should show average hiking distance of all trails on trip' do
        visit trip_path(@trips[0])

        expect(page).to have_content("Average Trail Length: #{@trips[0].trails.average(:length)}")
      end

      it 'should show the longest trail' do
        visit trip_path(@trips[0])

        expect(page).to have_content("Longest Hiking Distance: #{@trips[0].trails.maximum(:length)}")
      end
    end
  end
end
