require "selenium-webdriver"

class RenewMonthlyPass < BaseService

  ElementNotFoundError = Class.new(StandardError)

  def call(options={})
    @options = options
    logger.debug "calling at hop page..."

    login_myat(email, password)

    follow_buying_process

    buy_pass!

    close_successfully

    purchase_record.save

    purchase_record
  end

  private

  def login_myat(account_email, account_password)
    driver.navigate.to url
    form_inputs.find{|el| el['name'].include? 'UsernameTextBox'}.send_keys(account_email)
    form_inputs.find{|el| el['name'].include? 'PasswordTextBox'}.send_keys(account_password)
    form_inputs.find{|el| el['name'].include? 'SubmitButton'}.click
  end

  def form_inputs
    @form_inputs ||= driver.find_elements(:tag_name, 'input')
  end

  # TODO: separate these into page objects
  def follow_buying_process
    click_element(:id, 'top_up')
    click_element(:link_text, 'Buy a pass')
    click_element(:id, 'ProductId')
    click_element(:id, 'applyBtn')
  end

  def buy_pass!
    # buy the thing
    click_element(:id, 'purchase-button', simulated?)
  end

  def click_element(type, identifier, simulated=false)
    begin
      element = driver.find_element(type, identifier)
      raise ElementNotFoundError if element.blank?
      logger.debug "Found element by #{type} -> #{identifier}"
      element.click unless simulated? == true
    rescue ElementNotFoundError => ex
      logger.error "Element not found"
      purchase_record.failed!
    end
  end

  def close_successfully
    logger.info "Finished Successfully"
    purchase_record.succeeded!
    close
  end

  def close
    driver.close
  end

  def driver
    @driver ||= Selenium::WebDriver.for :firefox
  end

  def url
    purchase_record.url
  end

  def email
    purchase_record.email
  end

  def password
    purchase_record.password
  end

  def purchase_record
    @purchase_record ||= options.fetch(:purchase_record)
  end

  def simulated?
    purchase_record.simulated?
  end
end
