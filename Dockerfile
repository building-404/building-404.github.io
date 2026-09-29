# --- Stage 1: Build & Compile Jekyll Content ---
FROM ruby:3.2-alpine AS builder
RUN apk add --no-cache build-base gcc libc-dev

WORKDIR /app
COPY Gemfile ./
RUN bundle install

COPY . .
RUN bundle exec jekyll build --destination ./_site

# --- Stage 2: Bake static HTML straight into Nginx ---
FROM nginx:alpine

# 1. Clear out Nginx's default "Welcome to nginx" factory files
RUN rm -rf /usr/share/nginx/html/*

# 2. Copy the compiled HTML/CSS assets into Nginx's root web directory
COPY --from=builder /app/_site /usr/share/nginx/html

EXPOSE 80
