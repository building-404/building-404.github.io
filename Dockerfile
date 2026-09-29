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
COPY --from=builder /app/_site /usr/share/nginx/html
EXPOSE 80
