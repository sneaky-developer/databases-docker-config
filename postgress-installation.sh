apt-get update

apt-get install sudo systemctl wget lsb-core -y

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null

sudo apt update

sudo apt install postgresql postgresql-client -y

sudo systemctl enable postgresql

sudo systemctl daemon-reload

sudo systemctl start postgresql 

sudo systemctl status postgresql
