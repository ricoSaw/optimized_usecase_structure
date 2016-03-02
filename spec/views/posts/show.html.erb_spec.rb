require 'spec_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :body => "MyText"
    ))

    @comments = assign(:comments, [Comment.create!(:body => "MyText"), Comment.create!(:body => "MyText2")])
    @comment = assign(:comment, Comment.create!(:body => "MyText"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
