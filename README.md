
# Rails Bare #

## Description ##

An empty rails 4.2 app with authentication

=====
Gems used:
- Rails 4.2
- Devise w/ Google Oauth Support
- Rspec



===

## Testing Google Oauth Locally ##

1. Click "APIs", under "APIs & auth"
 - Find and enable "Google+"
 - Find and enable "Contacts"

2  Click "Credentials", under "APIs & auth"
  - Click "Create new Client ID"
    - Enter your email
    - Enter a product name
    - Click "Save" button
  - Click "Edit Settings" from the Credentials page
    - Add `http://dev.mybox.com:3000/users/auth/google_oauth2/callback` to the **Redirect URIs*

3. Add the following to your `/etc/hosts` file:
```# Google Oauth fun
127.0.0.1 dev.mybox.com
```


4. Create an .env file with your newly created Client id and secret

```bash
# .env
# Environment variables that will not be committed into the REPO
export GOOGLE_OAUTH_CLIENT_ID="CLIENT ID"
export GOOGLE_OAUTH_CLIENT_SECRET="CLIENT SECRET"
```

5. Load the .env file and run your rails server
```bash
. .env
rails s
```

Voila!
