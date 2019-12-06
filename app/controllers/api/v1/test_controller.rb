module Api
  module V1
    class TestController < ApplicationController
      def test
        p session.to_hash
        render status: 200, json: {text: 'text'}
      end

      def test2
        render status: 200, json: {text: 'text22222'}
      end
    end
  end
end
