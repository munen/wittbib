# encoding: UTF-8
def log_in(options={})
  @current_user = Factory :user
  visit "/users/sign_in"
  fill_in "user_email", :with => @current_user.email
  fill_in "user_password", :with => @current_user.password
  click_button "Login"
end

def log_out
  visit root_path
  find("#user_nav li + li").click
end

def wait_for_ajax(timeout = 2)
  page.wait_until(timeout) do
    page.evaluate_script 'jQuery.active == 0'
  end
end
