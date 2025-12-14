terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.26.0"
    }
  }
}

provider "postgresql" {
  host            = "localhost"
  port            = 54322
  database        = "postgres"
  username        = "postgres"
  password        = "postgres"
  sslmode         = "disable"
  connect_timeout = 15
}

resource "postgresql_subscription" "subscription" {
  name         = "subscription"
  conninfo     = "host=postgres-old port=5432 dbname=postgres user=replication_user password=replication"
  publications = ["publication"]
}
