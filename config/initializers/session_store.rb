# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_depot_session',
  :secret      => 'efce39d53a993a2348227409454dbea126293519da87e389b5ac9f418e47c012b78745464f04caf5ddcb0c5ce2204b4d171d3323a3da8cd3bbed0f6d6485cc08'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
 ActionController::Base.session_store = :active_record_store
