require 'rails_helper'

RSpec.describe "konfirms/index", type: :view do
  before(:each) do
    assign(:konfirms, [
      Konfirm.create!(
        :no_order => "No Order",
        :no_rek => "No Rek",
        :atas_nama => "Atas Nama",
        :jumlah => "",
        :user => nil
      ),
      Konfirm.create!(
        :no_order => "No Order",
        :no_rek => "No Rek",
        :atas_nama => "Atas Nama",
        :jumlah => "",
        :user => nil
      )
    ])
  end

  it "renders a list of konfirms" do
    render
    assert_select "tr>td", :text => "No Order".to_s, :count => 2
    assert_select "tr>td", :text => "No Rek".to_s, :count => 2
    assert_select "tr>td", :text => "Atas Nama".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
