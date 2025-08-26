FROM postgres:17-bookworm

# Init
COPY ./init.sql /docker-entrypoint-initdb.d

# PGroonga
RUN apt update
RUN apt install -y -V ca-certificates lsb-release wget
RUN wget https://packages.groonga.org/debian/groonga-apt-source-latest-$(lsb_release --codename --short).deb
RUN apt install -y -V ./groonga-apt-source-latest-$(lsb_release --codename --short).deb
RUN wget -O usr/local/share/keyrings/postgres.gpg.asc https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN (echo "Types: deb"; \
  echo "URIs: http://apt.postgresql.org/pub/repos/apt"; \
  echo "Suites: $(lsb_release --codename --short)-pgdg"; \
  echo "Components: main"; \
  echo "Signed-By: /usr/local/share/keyrings/postgres.gpg.asc") | \
  tee /etc/apt/sources.list.d/pgdg.sources
RUN apt update
RUN apt install -y -V postgresql-17-pgdg-pgroonga