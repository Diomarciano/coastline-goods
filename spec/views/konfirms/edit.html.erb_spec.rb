require 'rails_helper'

RSpec.describe "konfirms/edit", type: :view do
  before(:each) do
    @konfirm = assign(:konfirm, Konfirm.create!(
      :no_order => "MyString",
      :no_rek => "MyString",
      :atas_nama => "MyString",
      :jumlah => "",
      :user => nil
    ))
  end

  it "renders the edit konfirm form" do
    render

    assert_select "form[action=?][method=?]", konfirm_path(@konfirm), "post" do

      assert_select "input#konfirm_no_order[name=?]", "konfirm[no_order]"

      assert_select "input#konfirm_no_rek[name=?]", "konfirm[no_rek]"

      assert_select "input#konfirm_atas_nama[name=?]", "konfirm[atas_nama]"

      assert_select "input#konfirm_jumlah[name=?]", "konfirm[jumlah]"

      assert_select "input#konfirm_user_id[name=?]", "konfirm[user_id]"
    end
  end
end
