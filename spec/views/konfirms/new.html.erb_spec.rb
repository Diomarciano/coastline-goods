require 'rails_helper'

RSpec.describe "konfirms/new", type: :view do
  before(:each) do
    assign(:konfirm, Konfirm.new(
      :no_order => "MyString",
      :no_rek => "MyString",
      :atas_nama => "MyString",
      :jumlah => "",
      :user => nil
    ))
  end

  it "renders new konfirm form" do
    render

    assert_select "form[action=?][method=?]", konfirms_path, "post" do

      assert_select "input#konfirm_no_order[name=?]", "konfirm[no_order]"

      assert_select "input#konfirm_no_rek[name=?]", "konfirm[no_rek]"

      assert_select "input#konfirm_atas_nama[name=?]", "konfirm[atas_nama]"

      assert_select "input#konfirm_jumlah[name=?]", "konfirm[jumlah]"

      assert_select "input#konfirm_user_id[name=?]", "konfirm[user_id]"
    end
  end
end
