require 'rails_helper'

RSpec.describe 'Trail Pages (Visitor)' do
  context '/trails/:id' do
    describe 'As a visitor' do
      it 'should show the names of the trips and their length for this trail' do
        visit trail_path(@trails[2])

        expect(page).to have_content(@trips[0].name)
        expect(page).to have_content(@trips[2].name)
      end
    end
  end
end
