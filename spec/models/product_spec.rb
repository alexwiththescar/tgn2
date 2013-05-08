# == Schema Information
#
# Table name: products
#
#  id                 :integer         not null, primary key
#  content            :string(255)
#  user_id            :integer
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  ammount            :decimal(, )
#  price              :decimal(, )
#  organic            :boolean
#  delivery           :boolean
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  pic_file_name      :string(255)
#  pic_content_type   :string(255)
#  pic_file_size      :integer
#  pic_updated_at     :datetime
#

require 'spec_helper'

describe Product do

  let(:user) { FactoryGirl.create(:user) }
  before { @product = user.products.build(content: "Lorem ipsum") }

  subject { @product }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Product.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @product.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @product.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @product.content = "a" * 141 }
    it { should_not be_valid }
  end
end
