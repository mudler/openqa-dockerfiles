FROM opensuse:tumbleweed
MAINTAINER mudler <edigiacinto@suse.com>

ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 && \
    gpg --verify /tini.asc 
RUN chmod +x /tini

RUN zypper --non-interactive ar -f -G https://download.opensuse.org/repositories/devel:/openQA/openSUSE_Tumbleweed/devel:openQA.repo && \
    zypper --non-interactive in -f openQA openQA-client openQA-common openQA-worker apache2 perl-DBD-Pg perl-DateTime-Format-Pg

RUN mv /etc/apache2/vhosts.d/openqa.conf.template /etc/apache2/vhosts.d/openqa.conf && \
        a2enmod headers && \
        a2enmod proxy && \
        a2enmod proxy_http
RUN mkdir -p /run/dbus
ENTRYPOINT ["/tini", "--"]
