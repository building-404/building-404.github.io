# --- Stage 1: Build & Compile Jekyll Content ---
FROM ruby:3.2-alpine AS builder

# Install build dependencies for native ruby extensions
RUN apk add --no-cache build-base gcc libc-dev

WORKDIR /app

# Cache Ruby Gems layer optimization
COPY Gemfile ./
RUN bundle install

# Bring in Markdown files and configurations
COPY . .

# Compile Jekyll Markdown layout into web-ready static files
RUN bundle exec jekyll build --destination ./_site

# --- Stage 2: Serve Payload Production Template ---
FROM nginx:alpine
# Copy the compiled HTML/CSS assets into Nginx's default directory
COPY --from=builder /app/_site /usr/share/nginx/html
