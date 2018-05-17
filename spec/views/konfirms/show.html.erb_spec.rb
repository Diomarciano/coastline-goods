require 'rails_helper'

RSpec.describe "konfirms/show", type: :view do
  before(:each) do
    @konfirm = assign(:konfirm, Konfirm.create!(
      :no_order => "No Order",
      :no_rek => "No Rek",
      :atas_nama => "Atas Nama",
      :jumlah => "",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/No Order/)
    expect(rendered).to match(/No Rek/)
    expect(rendered).to match(/Atas Nama/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
