# --- Stage 1: Build the Jekyll site from Markdown ---
FROM ruby:3.2-alpine AS builder
RUN apk add --no-cache build-base gcc libc-dev

WORKDIR /app
COPY Gemfile ./
RUN bundle install

COPY . .
RUN bundle exec jekyll build --destination ./_site

# --- Stage 2: Safe Extraction via Volume Mount ---
FROM alpine:latest
ARG REPO_NAME

# The pipeline mounts your Nginx volume to /target-volume
# This step automatically runs during the "dry-run" build phase
RUN --mount=type=volume,target=/target-volume \
    mkdir -p /target-volume/${REPO_NAME} && \
    rm -rf /target-volume/${REPO_NAME}/* && \
    cp -R /app/_site/* /target-volume/${REPO_NAME}/
