class Welcome2Controller < ApplicationController

  # we can add a method for the index.html.erb view file
  # instance variables are visible in the view file
  def index
    @time = Time.now
  end

  def hello
  end

  def login
  end

  def signout
  end

  def about
  end

  def bio
  end

  def mission_statement
  end
end
