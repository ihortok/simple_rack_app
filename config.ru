# frozen_string_literal: true

require 'pry'
require_relative 'app'

use NotFoundError

run App.new
