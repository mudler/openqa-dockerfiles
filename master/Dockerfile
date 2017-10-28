FROM openqa/base
MAINTAINER mudler <edigiacinto@suse.com>

ADD entrypoint.sh /entrypoint.sh
ADD database.ini.postgresql /etc/openqa/database.ini.postgresql
RUN chmod +x /entrypoint.sh

# Demo as default - user can replace with own openqa.ini later
RUN sed -i 's/^# audit_enabled = 1/audit_enabled = 0/' /etc/openqa/openqa.ini
RUN sed -i 's/^# method = Fake|OpenID|iChain/method = Fake/' /etc/openqa/openqa.ini

EXPOSE 80

CMD "/entrypoint.sh"
