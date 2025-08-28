Rails.application.routes.draw do
  # Default Rails health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Custom health endpoint for Kubernetes/monitoring
  get "/healthz", to: proc { [200, {}, ['{"status":"ok"}']] }

  # Sentiment API endpoint
  post "/sentiment", to: "sentiment#analyze"
end

