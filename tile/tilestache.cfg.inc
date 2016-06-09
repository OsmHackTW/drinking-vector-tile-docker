{

  "index": "www/preview.html",

  "cache": {
    "name": "Disk",
    "path": "/tmp/stache"
  },

  "layers": {
    "drinking_water": {
        "allowed origin": "*",
        "provider": {
            "class": "TileStache.Goodies.VecTiles:Provider",
            "kwargs": {
                "dbinfo": {
                    "host": "PG_PORT_5432_TCP_ADDR",
                    "user": "PG_ENV_POSTGRES_USER",
                    "database": "PG_ENV_POSTGRES_DB",
                    "password": "PG_ENV_POSTGRES_PASSWORD"
                },
                "queries": [ 
                    "SELECT osm_id, name, way AS __geometry__  FROM planet_osm_point WHERE amenity='drinking_water'"
                ]
            }
        }
    }
  }
}
