require "selenium-webdriver"

class AtHopPage < BaseService

  ElementNotFoundError = Class.new(StandardError)

  def call(options={})
    @options = options
    logger.debug "calling at hop page..."

    login_myat(email, password)

    buy_pass

    close_successfully
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

  def buy_pass
    click_element(:id, 'top_up')
    click_element(:link_text, 'Buy a pass')
    click_element(:id, 'ProductId')
    click_element(:id, 'applyBtn')
    # buy the thing
    # click_element(:id, 'purchase-button')
  end

  def click_element(type, identifier)
    begin
      element = driver.find_element(type, identifier)
      raise ElementNotFoundError if element.blank?
      logger.debug "Found element by #{type} -> #{identifier}"
      element.click
    rescue ElementNotFoundError => ex
      logger.error "Element not found"
    end
  end

  def close_successfully
    logger.info "Finished Successfully"
    close
  end

  def close
    driver.close
  end

  def driver
    @driver ||= Selenium::WebDriver.for :firefox
  end

  def url
    "https://at.govt.nz/bus-train-ferry/at-hop-card/my-at-hop-account/"
  end

  def email
    options.fetch(:email)
  end

  def password
    options.fetch(:password)
  end
end
