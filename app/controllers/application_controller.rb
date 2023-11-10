class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend
  include GroupsHelper
end
