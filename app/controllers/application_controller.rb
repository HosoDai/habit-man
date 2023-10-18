class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend
  include MemosHelper
end
