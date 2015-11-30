ActionMailer::Base.smtp_settings = {
  enable_starttls_auto: true,
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  authentication: :plain,
  user_name: "pizika005@gmail.com",
  password: "HAI ANHANH"
}
