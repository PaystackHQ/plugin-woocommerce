FROM ubuntu:18.04 AS builder

WORKDIR /dist

RUN apt-get -y install && apt-get update
RUN apt-get -y install wget unzip zip

ADD https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip /dist
RUN cd /dist && unzip woocommerce.latest-stable.zip && rm woocommerce.latest-stable.zip


FROM wordpress:php8.3

WORKDIR /var/www/html/

COPY . ./wp-content/plugins/paystack
COPY --from=builder /dist/ ./wp-content/plugins

