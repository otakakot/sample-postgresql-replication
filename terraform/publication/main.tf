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
  port            = 54321
  database        = "postgres"
  username        = "postgres"
  password        = "postgres"
  sslmode         = "disable"
  connect_timeout = 15
}

resource "postgresql_role" "replication" {
  name        = "replication_user"
  login       = true
  password    = "replication"
  replication = true
}

resource "postgresql_grant" "replication" {
  database    = "postgres"
  role        = postgresql_role.replication.name
  schema      = "public"
  object_type = "table"
  privileges  = ["SELECT"]
}

resource "postgresql_publication" "publication" {
  name       = "publication"
  database   = "postgres"
  all_tables = true
}
