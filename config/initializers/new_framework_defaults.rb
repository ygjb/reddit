# Enable per-form CSRF tokens. Previous versions had false.
Rails.application.config.action_controller.per_form_csrf_tokens = true

# Enable origin-checking CSRF mitigation. Previous versions had false.
Rails.application.config.action_controller.forgery_protection_origin_check = false

# Make Ruby 2.4 preserve the timezone of the receiver when calling `to_time`.
# Previous versions had false.
ActiveSupport.to_time_preserves_timezone = false

# Require `belongs_to` associations by default. Previous versions had false.
Rails.application.config.active_record.belongs_to_required_by_default = false

Rails.application.config.force_ssl = true
Rails.application.config.ssl_options = {  redirect: { status: 307, port: 81 } }
Rails.application.config.ssl_options = { hsts: { preload: true } }
Rails.application.config.ssl_options = { hsts: { subdomains: true } }


# Do not halt callback chains when a callback returns false. Previous versions had true.
ActiveSupport.halt_callback_chains_on_return_false = true
