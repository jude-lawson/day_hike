require 'rails_helper'

RSpec.describe 'Trail Pages (Visitor)' do
  context '/trails/:id' do
    describe 'As a visitor' do
      it 'should show the names of the trips and their length for this trail' do
        visit trail_path(@trails[2])

        expect(page).to have_content(@trips[0].name)
        expect(page).to have_content(@trips[2].name)
        expect(page).to have_content("Length: #{@trips[0].trails.sum(:length)}")
        expect(page).to have_content("Length: #{@trips[2].trails.sum(:length)}")
      end

      it 'should show the total number of trips where this trail is included' do
        visit trail_path(@trails[2])

        expect(page).to have_content("Total Trips With This Trail: 2")
      end
    end
  end
end
