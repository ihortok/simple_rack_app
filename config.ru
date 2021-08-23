# frozen_string_literal: true

require 'pry'
require_relative 'app'

use NotFoundError
use HomeRedirect  

run App.new
