

# Group Tools


## Tools [/tools]
Get all registered tools

### Get tools [GET /api/v1/tools]


+ Request returns a list of tools
**GET**&nbsp;&nbsp;`/api/v1/tools`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 4277,
                "title": "aliquam",
                "link": "http://muellerkihn.name/mike.tromp",
                "description": "Temporibus maxime consequatur. Libero tempora quos. Quisquam dolor laboriosam. Temporibus tempora b.",
                "tags": [
                  "developer",
                  "proxy",
                  "domain",
                  "webapps",
                  "calendar"
                ],
                "created_by": "410"
              },
              {
                "id": 4278,
                "title": "qui",
                "link": "http://miller.name/porfirio.walter",
                "description": "Explicabo similique voluptate. Quis dolor quam. Fugit dignissimos aliquam. Est eligendi tempore. Ne.",
                "tags": [
                  "calendar",
                  "https",
                  "domain",
                  "organization",
                  "writing"
                ],
                "created_by": "410"
              },
              {
                "id": 4279,
                "title": "possimus",
                "link": "http://harriipes.co/emmitt.johnston",
                "description": "Commodi fuga praesentium. Voluptatum culpa ab. Perspiciatis saepe aperiam. Atque molestiae at. Accu.",
                "tags": [
                  "collaboration",
                  "calendar",
                  "planning",
                  "organization",
                  "domain"
                ],
                "created_by": "410"
              },
              {
                "id": 4280,
                "title": "et",
                "link": "http://padberg.com/velva.kutch",
                "description": "Ut in consectetur. Deserunt ut ratione. Sed reiciendis vel. Voluptas voluptatem sed. Repellat et du.",
                "tags": [
                  "collaboration",
                  "developer",
                  "writing",
                  "webapps",
                  "proxy"
                ],
                "created_by": "410"
              },
              {
                "id": 4281,
                "title": "animi",
                "link": "http://swaniawskiklocko.name/carlton.heathcote",
                "description": "Corporis praesentium beatae. Rem enim neque. Labore est voluptas. Expedita aliquid voluptatem. Omni.",
                "tags": [
                  "organizing",
                  "writing",
                  "planning",
                  "node",
                  "proxy"
                ],
                "created_by": "410"
              },
              {
                "id": 4282,
                "title": "molestias",
                "link": "http://kuphal.name/nohemi",
                "description": "Expedita quasi et. Qui architecto sit. Eius perspiciatis cumque. Voluptate consequuntur minima. Qui.",
                "tags": [
                  "collaboration",
                  "node",
                  "writing",
                  "developer",
                  "planning"
                ],
                "created_by": "410"
              },
              {
                "id": 4283,
                "title": "vel",
                "link": "http://corkery.org/cynthia",
                "description": "Qui rerum voluptates. Eveniet omnis fugit. In non eos. Iste sed voluptatibus. Non totam et. Quia do.",
                "tags": [
                  "developer",
                  "proxy",
                  "node",
                  "organizing",
                  "organization"
                ],
                "created_by": "410"
              },
              {
                "id": 4284,
                "title": "vitae",
                "link": "http://lefflerkuvalis.info/fausto.wyman",
                "description": "Tempora ex a. Quibusdam modi perferendis. Saepe enim pariatur. Tenetur et et. Exercitationem deleni.",
                "tags": [
                  "collaboration",
                  "developer",
                  "domain",
                  "organizing",
                  "planning"
                ],
                "created_by": "410"
              },
              {
                "id": 4285,
                "title": "et",
                "link": "http://rodriguez.name/jadwiga_schiller",
                "description": "Dolorem itaque tempora. Voluptate atque repellat. Sit eos a. Est delectus neque. Ducimus qui rerum..",
                "tags": [
                  "writing",
                  "domain",
                  "calendar",
                  "developer",
                  "node"
                ],
                "created_by": "410"
              },
              {
                "id": 4286,
                "title": "quas",
                "link": "http://deckowkerluke.co/raymond.gulgowski",
                "description": "Laborum et rerum. Sed nisi saepe. Voluptatum quaerat et. Aut est officia. Repellat occaecati autem..",
                "tags": [
                  "collaboration",
                  "organizing",
                  "planning",
                  "webapps",
                  "writing"
                ],
                "created_by": "410"
              }
            ]

+ Request return the tool
**GET**&nbsp;&nbsp;`/api/v1/tools/4287`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 4287,
              "title": "sed",
              "link": "http://emard.biz/genaro",
              "description": "Tenetur omnis eum. Est eaque et. Consectetur alias omnis. Veritatis cum temporibus. Facere inventor.",
              "tags": [
                "planning",
                "calendar",
                "domain",
                "proxy",
                "collaboration"
              ],
              "created_by": "411"
            }

+ Request has status code 404
**GET**&nbsp;&nbsp;`/api/v1/tools/120`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Couldn't find Tool with 'id'=120"
            }

+ Request return a not found message
**GET**&nbsp;&nbsp;`/api/v1/tools/120`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Couldn't find Tool with 'id'=120"
            }
