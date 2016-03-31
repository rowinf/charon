class BaseService

  attr_reader :logger, :options

  def initialize
    @logger = Rails.logger
    after_initialize
  end

  protected

  def after_initialize
  end

end
