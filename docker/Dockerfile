FROM ruby:2.3
ENV LANG C.UTF-8

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    openssh-server \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    vim \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get update -qq \
  && apt-get install -y --no-install-recommends \
     nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG PROJECT_PATH=/rails
# ARG SRC_PATH=/Celebrity
# ARG APP_ROOT=${PROJECT_PATH}${SRC_PATH}

RUN mkdir -p ${PROJECT_PATH}
WORKDIR ${PROJECT_PATH}
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install

COPY . ${PROJECT_PATH}
# WORKDIR ${APP_ROOT}

RUN mkdir -p tmp/sockets

EXPOSE 3000