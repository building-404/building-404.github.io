# --- Stage 1: Build the Jekyll markdown site ---
FROM ruby:3.2-alpine AS builder

# Install build dependencies
RUN apk add --no-cache build-base gcc libc-dev

WORKDIR /app
COPY Gemfile ./
RUN bundle install

COPY . .
RUN bundle exec jekyll build --destination ./_site

# --- Stage 2: Prepare production Nginx payload ---
FROM nginx:alpine
# Copy the compiled HTML/CSS assets into Nginx's default directory
COPY --from=builder /app/_site /usr/share/nginx/html
