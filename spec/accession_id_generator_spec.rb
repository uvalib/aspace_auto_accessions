require 'rspec'
require_relative '../backend/model/mixins/accession_id_generator'

describe 'YaleAccessionIdGenerator' do

  it "understands what a fiscal year is" do
    YaleAccessionIdGenerator.id_0_generator.call({'accession_date' => '2013-07-01'}).should eq('2014')
    YaleAccessionIdGenerator.id_0_generator.call({'accession_date' => '2013-06-01'}).should eq('2013')
  end
end
