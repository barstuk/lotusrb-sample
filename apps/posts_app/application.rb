require 'lotus/helpers'
require "pry"

module PostsApp
  class Application < Lotus::Application
    configure do
      ##
      # BASIC
      #

      # Define the root path of this application.
      # All paths specified in this configuration are relative to path below.
      #
      root __dir__

      # Relative load paths where this application will recursively load the code.
      # When you add new directories, remember to add them here.
      #
      load_paths << [
        'controllers',
        'views'
      ]

      # Handle exceptions with HTTP statuses (true) or don't catch them (false).
      # Defaults to true.
      # See: http://www.rubydoc.info/gems/lotus-controller/#Exceptions_management
      #
      # handle_exceptions true

      ##
      # HTTP
      #

      # Routes definitions for this application
      # See: http://www.rubydoc.info/gems/lotus-router#Usage
      #
      routes 'config/routes'

      # URI scheme used by the routing system to generate absolute URLs
      # Defaults to "http"
      #
      # scheme 'https'

      # URI host used by the routing system to generate absolute URLs
      # Defaults to "localhost"
      #
      # host 'example.org'

      # URI port used by the routing system to generate absolute URLs
      # Argument: An object coercible to integer, default to 80 if the scheme is http and 443 if it's https
      # This SHOULD be configured only in case the application listens to that non standard ports
      #
      # port 443

      # Enable cookies
      #
      # cookies true

      # Enable sessions
      # Argument: Symbol the Rack session adapter
      #           A Hash with options
      #
      # See: http://www.rubydoc.info/gems/rack/Rack/Session/Cookie
      #
      # sessions :cookie, secret: ENV['WEB_SESSIONS_SECRET']

      # Configure Rack middleware for this application
      #
      # middleware.use Rack::Protection

      # Default format for the requests that don't specify an HTTP_ACCEPT header
      # Argument: A symbol representation of a mime type, default to :html
      #
      # default_format :html

      # HTTP Body parsers
      # Parse non GET responses body for a specific mime type
      # Argument: Symbol, which represent the format of the mime type (only `:json` is supported)
      #           Object, the parser
      #
      # body_parsers :json

      ##
      # DATABASE
      #

      # Configure a database adapter
      # Argument: A Hash with the settings
      #           type: Symbol, :file_system, :memory and :sql
      #           uri:  String, 'file:///db/bookshelf'
      #                         'memory://localhost/bookshelf'
      #                         'sqlite:memory:'
      #                         'sqlite://db/bookshelf.sqlite3'
      #                         'postgres://localhost/bookshelf'
      #                         'mysql://localhost/bookshelf'
      #
      adapter type: :sql, uri: ENV['POSTSAPP_DATABASE_URL']

      # adapter type: :file_system, uri: ENV['WEB_DATABASE_URL']

      # Configure a database mapping
      # See: http://www.rubydoc.info/gems/lotus-model#Data_Mapper
      #
      mapping 'config/mapping'

      ##
      # TEMPLATES
      #

      # The layout to be used by all views
      #
      layout :application # It will load Web::Views::ApplicationLayout

      # The relative path to templates
      #
      templates 'templates'

      ##
      # ASSETS
      #

      # Specify sources for assets
      # The directory `public/` is added by default
      #

      # Enabling serving assets
      # Defaults to false
      #
      serve_assets true

      ##
      # SECURITY
      #

      # X-Frame-Options is a HTTP header supported by modern browsers.
      # It determines if a web page can or cannot be included via <frame> and
      # <iframe> tags by untrusted domains.
      #
      # Web applications can send this header to prevent Clickjacking attacks.
      #
      # Read more at:
      #
      #   * https://developer.mozilla.org/en-US/docs/Web/HTTP/X-Frame-Options
      #   * https://www.owasp.org/index.php/Clickjacking
      #
      # security.x_frame_options "DENY"

      # Content-Security-Policy (CSP) is a HTTP header supported by modern browsers.
      # It determines trusted sources of execution for dynamic contents
      # (JavaScript) or other web related assets: stylesheets, images, fonts,
      # plugins, etc.
      #
      # Web applications can send this header to mitigate Cross Site Scripting
      # (XSS) attacks.
      #
      # The default value allows images, scripts, AJAX, and CSS from the same
      # origin, and does not allow any other resources to load (eg object,
      # frame, media, etc).
      #
      # Inline JavaScript is NOT allowed. To enable it, please use:
      # "script-src 'unsafe-inline'".
      #
      # Content Security Policy introduction:
      #
      #  * http://www.html5rocks.com/en/tutorials/security/content-security-policy/
      #  * https://www.owasp.org/index.php/Content_Security_Policy
      #  * https://www.owasp.org/index.php/Cross-site_Scripting_%28XSS%29
      #
      # Inline and eval JavaScript risks:
      #
      #   * http://www.html5rocks.com/en/tutorials/security/content-security-policy/#inline-code-considered-harmful
      #   * http://www.html5rocks.com/en/tutorials/security/content-security-policy/#eval-too
      #
      # Content Security Policy usage:
      #
      #  * http://content-security-policy.com/
      #  * https://developer.mozilla.org/en-US/docs/Web/Security/CSP/Using_Content_Security_Policy
      #
      # security.content_security_policy "default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self';"

      ##
      # FRAMEWORKS
      #

      # Configure the code that will yield each time Web::Action is included
      # This is useful for sharing common functionality
      #
      # See: http://www.rubydoc.info/gems/lotus-controller#Configuration
      controller.prepare do
        # include MyAuthentication # included in all the actions
        # before :authenticate!    # run an authentication before callback
      end

      # Configure the code that will yield each time Web::View is included
      # This is useful for sharing common functionality
      #
      # See: http://www.rubydoc.info/gems/lotus-view#Configuration
      view.prepare do
        include Lotus::Helpers
      end
    end

    ##
    # DEVELOPMENT
    #
    configure :development do
      # Don't handle exceptions, render the stack trace
      handle_exceptions false

      # Serve static assets during development
      serve_assets      true
    end

    ##
    # TEST
    #
    configure :test do
      # Don't handle exceptions, render the stack trace
      handle_exceptions false

      # Serve static assets during development
      serve_assets      true
    end

    ##
    # PRODUCTION
    #
    configure :production do
      # scheme 'https'
      # host   'example.org'
      # port   443
    end
  end
end