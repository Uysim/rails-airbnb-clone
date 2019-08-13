module Api
  module V1
    class PropertiesController < BaseController
      def index
        respond_with current_user.properties
      end

      def show
        @property = current_user.properties.find(params[:id])
        respond_with :api, :v1, @property
      end

      def create
        @property = current_user.properties.create(permitted_params)
        respond_with :api, :v1, @property
      end

      def update
        @property = current_user.properties.find(params[:id])
        @property.update(permitted_params)
        respond_with :api, :v1, @property
      end

      def destroy
        @property = current_user.properties.find(params[:id])
        respond_with :api, :v1, @property
      end

      private

      def permitted_params
        params.require(:data).require(:attributes).permit(:name, :address, :floor)
      end
    end
  end
end
