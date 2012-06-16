require 'helper'
describe Helpers do
  include Helpers

  def lispy(&bl)
    @lispy ||= Alf.lispy(app.settings.database, &bl)
    bl ? @lispy.evaluate(&bl) : @lispy
  end

  it 'provides locals for pages' do
    page_locals('balletschool').should be_a(Hash)
  end

end
