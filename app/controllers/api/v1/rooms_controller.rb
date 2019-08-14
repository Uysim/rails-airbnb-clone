module Api
  module V1
    class RoomsController < BaseController
      def create
        @room = Room.create(permitted_params)
        respond_with :api, :v1, @room
      end

      def update
        @room = Room.find(params[:id])
        @room.update(permitted_params)
        respond_with :api, :v1, @room
      end

      def show
        @room = Room.find(params[:id])
        respond_with :api, :v1, @room
      end

      def destroy
        @room = Room.find(params[:id])
        @room.destroy
        respond_with :api, :v1, @room
      end

      private

      def permitted_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(
          params,
          only: [:name, :image, :property]
        )
      end
    end
  end
end
