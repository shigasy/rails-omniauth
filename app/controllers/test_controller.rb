class TestController < ApplicationController
  def test
    render status: 200, json: { text: 'text'}
  end
  def test2
    render status: 200, json: { text: 'text22222'}
  end
end
