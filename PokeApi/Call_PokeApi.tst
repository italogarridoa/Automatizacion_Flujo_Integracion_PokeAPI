---
parasoftVersion: 2026.1.0
productVersion: 10.7.5
schemaVersion: 13
suite:
  $type: TestSuite
  name: Automatización de Servicios PokeApi
  hasEnvironmentConfig: true
  environmentConfig:
    environments:
    - variables:
      - name: url
        maskValue: true
        value: AwAAAEBNRlNXUTFvQlRiWlZ5NVYzSk1DVGdEUUVDcDhNNHdEbjNpMFFBTENtRHJWVEFGOFNoV3VzVE9RQmo0ZVhibDlq
      name: url
      active: true
    - variables:
      - name: url
        maskValue: true
        value: AwAAAEBNRlNXUTFvQlRiWlZ5NVYzSk1DVGdEUUVDcDhNNHdEbjNpMFFBTENtRHJWVEFGOFNoV3VzVE9RQmo0ZVhibDlq
      name: url 2
  lastModifiedBy: igarrido
  dataSources:
  - id: ds_-1249774591_1779215885618_1348585154
    impl:
      $type: DbDataSource
      query: "SELECT PokemonName, ExpectedType\r\nFROM pokemon;"
      propertyName: ""
      account:
        local:
          $type: DbConfigSettings
          password: AwAAACxBVkhkV1E2MWZiMjNrNkdkOWhSK1pMWDh5N1FjeGZxRW9Takd5dWNsWUNBPQ==
          uri: jdbc:mysql://localhost:3306/pokeapi
          username: root
          driver: com.mysql.cj.jdbc.Driver
      data: true
      columnNames:
      - PokemonName
      - ExpectedType
    name: TechnologyDesafio
    useAllRows: true
  - id: ds_-1249774591_1779223873118_1105600936
    impl:
      $type: TableDataSource
      model:
        columnIdentifiers:
        - "Test 1: url"
        - weight
        - kilogramos
        - idTransaccion
        - fechaActual
        - nombrePokemon
    name: JsonDataSource
    useAllRows: true
  tests:
  - $type: TestSuite
    name: Consumo Básico y Extraccion de Variables
    testID: 3
    tests:
    - $type: RESTClientToolTest
      name: REST Client
      testID: 6
      tool:
        $type: RESTClient
        dataSourceNames:
        - TechnologyDesafio
        iconName: RESTClient
        name: GET pokemon ditto
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - JsonDataSource
          iconName: XMLDataBank
          name: Extraccion url y name pokemon
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - JsonDataSource
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/abilities[1]/item[1]/ability[1]/url[1]/text()"
              mode: 1
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/abilities[1]/item[1]/ability[1]/name[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: "Test 1: url"
              - customName: "Test 1: name"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              localName: root
              bodyType:
                $type: ComplexType
                attributes:
                - ns: ""
                  name: type
                  fixed: object
                  contentType:
                    $type: StringType
                  required: true
                name: rootType
                compositor: true
                compositorObj:
                  $type: AllCompositor
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              localName: ""
              bodyType:
                $type: ComplexType
                name: anonymous
                compositor: true
                compositorObj:
                  $type: SequenceCompositor
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${url}/pokemon/ditto"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            outputTools:
            - $type: DiffTool
              dataSourceNames:
              - TechnologyDesafio
              iconName: Diff
              name: Validacion Header Status
              differs:
              - $type: TextDiffer
                ignoredDiffs:
                - diff:
                    details: |
                      > Date: Tue, 19 May 2026 20:01:11 GMT
                      > Content-Type: application/json; charset=utf-8
                      > Transfer-Encoding: chunked
                      > Connection: keep-alive
                      > Access-Control-Allow-Origin: *
                      > cache-control: public, max-age=86400, s-maxage=86400
                      > Report-To: {"group":"cf-nel","max_age":604800,"endpoints":[{"url":"https://a.nel.cloudflare.com/report/v4?s=%2BAGkxRgDXRAuc6W2v2WfE%2FCwR61Rbjf605NwRsdkoaSzgzAU4ggxUJKbx8WLKqTso97QTGSW6GJcm0ys3WQEfRi5UGmYm51mx3gRZtFf1Q6LzmqwC0MSHzjIuAWK"}]}
                      > etag: W/"63dc-M7PZjjPDP8CZTtdHREPIuLp0j9U"
                      > function-execution-id: 4wq4js51x34x
                      > Server: cloudflare
                      > strict-transport-security: max-age=31556926
                      > x-cloud-trace-context: 2f17c529d638afa524ebef3511edb3a1;o=1
                      > x-country-code: BR
                      > x-orig-accept-language: es-ES,es;q=0.9
                      > x-powered-by: Express
                      > Server-Timing: cfCacheStatus;desc="HIT"
                      > Server-Timing: cfEdge;dur=3,cfOrigin;dur=0
                      > x-served-by: cache-gru-sbsp2090080-GRU
                      > x-cache: HIT
                      > x-cache-hits: 0
                      > x-timer: S1769872147.332890,VS0,VE2
                      > vary: Accept-Encoding,cookie,need-authorization, x-fh-requested-host, accept-encoding
                      > alt-svc: h3=":443"; ma=86400
                      > Nel: {"report_to":"cf-nel","success_fraction":0.0,"max_age":604800}
                      > Age: 48234
                      > cf-cache-status: HIT
                      > CF-RAY: 9fe5b1302a731a7a-EZE
                    type: "1a2,28"
              source:
                controls:
                - keys:
                  - ""
                  - ""
                  row:
                    refs:
                    - dataSourceName: ""
                    last: false
                - HTTP/1.1 200 OK
              mode: 1
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Trafico Respuesta Pokemon
              showResponseHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: abilitiename
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: pokemon
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: ditto
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
    - $type: RESTClientToolTest
      name: REST Client
      testID: 7
      tool:
        $type: RESTClient
        dataSourceNames:
        - JsonDataSource
        iconName: RESTClient
        name: GET pokemon habilidad
        outputTools:
        - $type: GenericAssertionTool
          dataSourceNames:
          - TechnologyDesafio
          iconName: XMLAssertor
          name: JSON Validacion Habilidad
          wrappedTool:
            $type: XMLAssertionTool
            dataSourceNames:
            - TechnologyDesafio
            iconName: XMLAssertor
            name: XML Assertor
            errorsOutput:
              name: Errors
            assertions:
            - $type: OccurrenceAssertion
              timestamp: 1779224691840
              name: BooleanHabilidad
              extractEntireElement: true
              Assertion_XPath: "/root/effect_entries/item[1]/effect"
              value:
                name: Count
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 1
            message:
              $type: ExpectedXMLMessage
              message: true
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
          parameterizedValue:
            column: "Test 1: url"
          selectedIndex: -2
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Trafico Respuesta habilidad
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: name"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
  - $type: TestSuite
    name: Pruebas Orientadas a Datos
    testID: 8
    tests:
    - $type: RESTClientToolTest
      name: REST Client
      testID: 9
      tool:
        $type: RESTClient
        dataSourceNames:
        - TechnologyDesafio
        iconName: RESTClient
        name: GET pokemon parametrizado
        outputTools:
        - $type: GenericAssertionTool
          dataSourceNames:
          - TechnologyDesafio
          iconName: XMLAssertor
          name: JSON Validacion TipodePokemon
          wrappedTool:
            $type: XMLAssertionTool
            dataSourceNames:
            - TechnologyDesafio
            iconName: XMLAssertor
            name: XML Assertor
            errorsOutput:
              name: Errors
            assertions:
            - $type: StringComparisonAssertion
              timestamp: 1779226133917
              name: Validacion para comparar texto
              extractEntireElement: true
              Assertion_XPath: "/root/types/item[1]/type/name/string()"
              value:
                name: String Comparison Assertion
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: '''grass'''
                  parameterizedValue:
                    column: ExpectedType
                  selectedIndex: -2
            message:
              $type: ExpectedXMLMessage
              message: true
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${url}/pokemon/${PokemonName}"
          parameterizedValue:
            column: PokemonName
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Trafico de respuesta pokemon
              showRequestHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: name"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: pokemon
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
            parameterizedValue:
              column: PokemonName
            selectedIndex: -2
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
  - $type: TestSuite
    name: Logica Personalizada
    testID: 10
    testLogicVariables:
    - $type: TestLogicString
      name: weight
      value:
        $type: TestLogicVariableString
        originalValue: "${weight}"
        value: "${weight}"
    - $type: TestLogicString
      name: kilogramos
      value:
        $type: TestLogicVariableString
        originalValue: "${kilogramos}"
        value: "${kilogramos}"
    tests:
    - $type: RESTClientToolTest
      name: REST Client
      testID: 11
      tool:
        $type: RESTClient
        dataSourceNames:
        - TechnologyDesafio
        iconName: RESTClient
        name: Get pokemon snorlax
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - JsonDataSource
          iconName: XMLDataBank
          name: Extraccion peso pokemon
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - JsonDataSource
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/weight[1]/text()"
              mode: 1
            saveExpectedXML: true
            canonicalizeOutput: true
            xmlMessage: true
            xmlMessageObj:
              contentType: application/json
              content: !!binary |-
                H4sIAAAAAAAA/+2d2W7rypKm789TGOueW9bk4cB7F+qmgAKqgQN0N9B3C5RESyxTpIqDh/30TUqi
                rNEWKUvin/ldreVJytCXkUPEH8Gnf3ufBjevXpz4Ufjnr/Yft79uvHAYjfxw/Oev//t//sN5+PVv
                f/3jKY6i9Cb/1TD553vi//lrkqazf7Zab29vf7x1/4jicatze9tu/b//9V//ezjxpq7jh0nqhkPv
                1036MfP+/BUN/tsbpr/++sfNkzvwAz/1vWT5IzeO3Y/iJzdPfupNd/7gpvyTjz0/unkK3an3lz+d
                ZmH+G0+t+ZeLn2Rx8Fcx0CQf6Sx68dyZ/8cwauX/tF47reVrttr3radW8avzdyq/vfjKT35P/NHI
                C5fvPIiiwHPDX389u0HiPbVWP1/8ehLkn9LiN8NsOvDiX3+1n1rFd+fWtQrzTrMznfjDF+fZTWsY
                2juroZ2fNXQcZGkahXWAPnRq2JnG2VFmdveYWb5HPqWLrwZu4v323mde7Oeu5G1PiIfHp9bWrxR/
                NYw/PWLt83gK3NRL0pXZsfv2x9hPJ9kgS7x4GIWpF6b5hzBt/Sv/QP79X//Zmr9Qa+r64fK/xSc1
                jcLW4pVa7V7usOPx0/LrxZt4Y3f48SNvMn+ltTdZvHLxIc1/sfjfcxRPKzj/fAIkYRQH7vvadPhm
                NiwH5BRvVgznc06scZuPpPjfOH/V33448odVlqXyr7z3bcjd3B0+f7r47eUqe3jOx96ownRfvlyr
                vTHbl9890g1/2IBBUDhRZQs6zbHgwwuC6K2GDd2z2NDr1rBhHAV15lGvORYkfpD/Tg0b+s2xYRh/
                5CegoIYRd80xIs4GVXbg0oL75liQuLPZxI/rLEsPzbHCm3qxW8urH5tjxHOOoeYWd9scK/Lj4vM4
                9rywjh3n2atr2THy3fx4VIvGefbrWlbMPDeus8a2G7Rfz/KDuJ+/RB0zGrRpT3IUac2zR7tBG3cS
                ZUHtA0i7QZv3IHCHL3VsaND2/TbJ36iODQ3avOccnE6di1GD9os5iXpWfL9ffI6nuIAX35h4/niy
                E2NqP7UWP1j8SjD6XbxAhRv7ge+XZ/aJl6SRk79XXOXYW7xovituuk3JZ/XR/h55qesHu4P9Ylg3
                T7Ebf8bJVgRvb59ai5+Uv/cFvy/OX/VOYFsUN6y9kC17T2H1zmFfWbP6SQnvSN/7epoF3nMaFS9c
                dY51tg6QzZtj2xfGWlfGBsyvfdfGWhfHBtiy5/JY6/rYAFP2XFrqXVsaYMvO1aXe5aUJluy5wNS7
                wjTAmL3XmHoXmQZYs/8yU+860wBzdq409S41DbBk52JT72rTAEv2XG/qXXAaYMueS069a04DbHmv
                Z0XD9pZ6p8lOwzaVaOqNXaf24bjTsF3FDWYT1znpjNw5287Sr7NNZvUukp2z7Sp1rJhGUU0zzral
                1DEjC9I4n111kZztylLfltpgug0Lu7zXOxV3jjXj63hLEfwrQ37Fl/5oX2TTH81/luQv8ezmn//y
                d3aVXsufF78dRMP8CpO/rRt77u9CAJmFaT6S7/VFc2nR5x88tQ6+VP420+i1iryo+PXDUaT5ljLL
                wuGkQhipeMktlUTxrcV/y89+HEfZrF4oKfBeveB3/kHHoTf67W4HcG8LQdjmb5R/WQxj8e3fUy+d
                RKMvVzp3OPHDajtP8QbO/A2cxRu0tg8JO0MofxLFIy++eU/8f4Z+8OevYgb9+ivMgvz6Pv/Rlgct
                PsAvw2TeyNkWSx3rTc781VsHTs6L9660PsDsKGa70rCKxA7cD5pLLM3SqFrcYJfX9nXicrxOCHsu
                gR04ogLsPMCW+SnnpNzOEt2Bc3lz0amvjslb/ndOMvG9k1zu0EkRcOc8isy9zflvd+ae4nOHbpGw
                Oxe74gh5OrYDF+YD2LZ+XjEx/vWVZuZ+OCO3ivRifp+54z7TgEWE+4wWM/vuM+rEAi9NnHHkzPyX
                3JLMKb/28g/nJNertgNAktOyreA4LeuyM+20XMRL6iUA7jkwX3kuFgIzp74wazkZD2g1WELOhW1P
                UW9FZAeEKc1Fph1TJgkgBuwULfGSmNxtRpvYSjDtnCY2Li+jcncabXxL+a5zgvS1JMfedlFyn6JS
                53RBZsmQ7e6iDFdaR+c0pWCJj6DChQESkzWFJDFZVXBDN87dznn1o/yfU9AdKLO4QmzPH9YM7T0Q
                2iO0BzZCe8YfnQntiQEjtKdGjNCeND5Ce6rkCO3pMyS0J34jILRnCklCe6rgDAztpZMszD+LeuG9
                R8J7hPfARnjP+OMz4T0xYIT31IgR3pPGR3hPlRzhPX2GhPfEbwSE90whSXhPFZyB4b38NBYHb36l
                J+vNQ3ttfemeVzzx+aS5uN1T5HJzcfloEaf2YzmWU1FuH1eGZmPMQZmX9REHZXiLeEPtB5eUzOQa
                fekzszNGpMzt3an1pJCSVbXjMKyI5llNsIjinRq/k+s4rQzM+uCrMrxB7AeB74apU965k4kf+uH4
                5Lv3oYeXXSEMNN8TXvxKD2Cfh4E6PJ3l2mFJuhnrMbOvm7F2+hR5lxgwns4ivDqSIRUFR79pXXam
                9ZueeO5okKVp5RvN9YpW2j80Fecv4mSzE+fi9q3gm7m4Y4v51xmASd1lOo/SvCgLs32PFsOGv5UG
                WFjPp+5rQsja+Fl5eCzS2j+Q0L6YIgF0N3oh1vY90AizikfIZcWtLJmrI0oUREninSQob1/s9g23
                0oD3U3a59uWub3cAo/jSrFudPklizqKJRsAZmGVM3eFLsLFwHJNj7K7v4eQYiaXDzci4LMxUw7KQ
                04vKwkw4KAs91c4ekBNs7wE0+TQIBDUbfQBOM30FNqnsFbyEm+oAT6yzDsCMaK8DRsUeO1BTb7QD
                QfQZjUC5ZUvtPL9cCb9R2Lryza5OINmXJvmja+nYC0eJ48ZDL0tOYce9r44X8pyBtYUlGn04SeBu
                xPqOkkqtz73LSqW6rCSCPRlQOusxw9NKA3SaaeBnasR6XbxMUvsLuNIAIfFvF2iq6l/QlQYIyX+p
                6hcDhpeVBkgKtvE3WXR4XmmAnNgedKUBSmp7qJUGyMrtuzRDEdXb43yr6ImU4B5upQEiintuBBbC
                es8Pz1nsP/vD/DhWUW25i237RAY2jiEGlbV0yHOL1bVArDRAu7AFjqUBUpUtYCsNkC1t6XdAaEpt
                S+cBlqL1Lcj1RMHhc6sbnwHFSdBcOeKVqlxYQ21ER4VBaYBi63QcT5cdnrc6v1yh9z1OJ4ntvI8s
                ePGcUfS2Yc5Rpbjr0drLluIyF/WKOmGmViAIMdn7Deh0T8iwM/OgNYqyQeA53mhc/QFRD1c7avWI
                UHLYkl1DlJjhaRyRVf3MPmLeeHwirW2T6cAAtK/GrlPKT+WHpcCU/UuydB9Psx6dss/J9VsAmlan
                BXgJ91gAnl53BQ4kxYhFqodxMM26YbjpVAzDSr1WGIJiVcIAE64PBp5gUSLQzChH7NFOSPdhaTgh
                Ul1hCYkgOhRbpQHorHUdT5Ednrc6dlJFquh0phU3DLYSVMdUNfSu9yzXNhcd1VgD6EyKOHS0H/Ft
                d8QBV7z25fWcW/pz4BafWhy9beqFjtna+92rbe0oUIoRCz0ZlSuB5VU56uAsLPRQR2Z1xYA6PGur
                BtTB2Vg5oM7M+uoBdYC2VhCoc9N6OiPUrKz8UMdlc/WHOjvbKkDUeVEFYgJFKytB1KFZXw2iDlD/
                WXGQFNXbAM4ctQ0szZVrvLmpFzvjrPJzPPrrNmhqNdTno1KbYpjZ2vJWnZhioQvszKyXmHyM4vw6
                l01nlbdrHrt17cl4nTvcOadjksXPlSfiPROxATsa50YtZpwb1Ygt1E+nKp8I8lwYGyUQcsgogRAF
                RwmEHDJKIIThUQIhCo4SCD1mlECIA6QEQpMbJRCK1CiBkMJFCYQuO0ogtHhRAmECRUogBKFRAiEO
                kBIIU0hSAiEKjhIIc1gKPm4BdOiY1dmZpmP2h54z8NyNCO1R4tH1mYd4FPEozBCP7rOYNsxiwNRd
                DA2iKDg0iHLI0CAKw0ODKAoODaIeMzSI4gDRIGpyQ4OoSA0NohQuNIi67NAgavFCg2gCRTSIgtDQ
                IIoDRINoCkk0iKLg0CCawxINoiw6NIi67EzTIA4C/++/3XhjHz9Kg7huAhpENIgwQ4NoIjEaWEpi
                QzwqhwzxqCg4xKNyyBCPCsNDPCoKDvGoHjPEo+IAEY9qckM8qkgN8agULsSjuuwQj2rxQjxqAkXE
                o4LQEI+KA0Q8agpJxKOi4BCPmsMS8agsOsSjuuyME49mg0FQr4fl3Xo8Hf0o+lGYoR81kRj7tS47
                0/brSf6DuN523b3adt2/+6HZOH8RJ5udOB239zw2bJYQM5jhaRyzVP1Mh1j/Hi+jtErY1cSw4W+l
                AdTEyfmaELJ+Gz+jkFHa2+TA4XOlAdSgynmbELJ+Fz+jcFje44AnDI+qb1FwVH3rMaPqWxygWtU3
                N7nSAOq+Ff1NixreVhpAvb6Um4FLChftFXTZ0V5BixftFUygSHsFQWi0VxAHSHsFU0jSXkEUHO0V
                zGEp2F6B2o/SAAo2dR1PkR2et9oCr1Bui9NJYjtnlXSSDaZ+Urx45Srp9XARTU2ot4WZWbWbENM9
                Z8HOzO16GGVhuqnOO2qvfmCvbsAqwl6txcy+vTrN0qia9neX13YEliIrgFGjs2e2jscngtteXigZ
                AJ6B5QIws1tcqczNNmGlMitEleoErRRUKgOzXkypDM9a+Z0yNKR3ZnAUlN0RViahqM7OtIRi4vnJ
                1B86aZQklbOK62aQVSSrCDOyiuYlqcgqigGzOquojY6WH1JbGaW0ppDkTqrLzrg7aRp74TidVL2P
                3t9yH23AMsJ9VIuZffdRdWJiD6UCm9zzjUAm+pAcwFkbtFNHZnXYTh0eD+wQBccDO/SYWV99ow7Q
                1gocdW5aD36AGklFQVw2l7qps7Ot3E2dFyVvJlCkpsMclggxdNkZJ8SIAjd2Bp67cd85SopBc9Br
                T0akGHrMkGKoEUOKIYkNKYYcMqQYouCQYsghQ4ohDA8phig4pBh6zJBiiANEiqHJDSmGIjWkGFK4
                kGLoskOKocULKYYJFK3sQKwOzfouxOoA6UNjCklre0qrg0ODaA5LekvLokM+qsvONPloOsnC/HMY
                RMHGGnKMfvRhfeFAP4p+FGboR/dZrN3uFhminIshQxQFhwxRDhkyRGF4yBBFwSFD1GOGDFEcIDJE
                TW7IEBWpIUOUwoUMUZcdMkQtXsgQTaCIDFEQGjJEcYDIEE0hiQxRFBwyRHNYIkOURYcMUZedoTLE
                yhLE9fsPEkQkiDBDgmgiMVpYSmJDOyqHDO2oKDi0o3LI0I4Kw0M7KgoO7ageM7Sj4gDRjmpyQzuq
                SA3tqBQutKO67NCOavFCO2oCRbSjgtDQjooDRDtqCkm0o6Lg0I6awxLtqCw6tKO67EzTjhapkcn/
                ZO7LBpKj5KPrRiAfRT4KM+SjJhJDPiqJDfmoHDLko6LgkI/KIUM+KgwP+agoOOSjesyQj4oDRD6q
                yQ35qCI15KNSuJCP6rJDPqrFC/moCRSRjwpCQz4qDhD5qCkkkY+KgkM+ag5L5KOy6JCP6rIzTT76
                7CdJFlfWjj6u791oR9GOwgzt6F5h0Xh8Iq1tk1GzAQ0lmym4rFaxKYOzVsGmDM1G9ZoyL+uVa8rw
                bFWtveebQhb7z/4wX2wqJul2+W2vN+igcDU0UIZws03/pMwK7ZM6QSt1T8rArNc8KcOzViWjDA2F
                jBkcUcfI5khRx+iyM00dM/I3lsCjlDHr8TqUMTYt/md9RHT07g8rz8UOc7EBuxkqLS1m9qm01InR
                4U8SGx3+5JBZq4lUB2ehLlIdmdXaSHV41uoj1cHZqJFUZ2a9TlIdoK1aSXVudPhTpGaZslUdl83q
                VnV2tilc1XmhcjWBopVKV3Vo1qtd1QHS4c8UkmjwdNmZpsGbJR85kOrap3UCaJ/QPsEM7ZOJxNA+
                SWJD+ySHDO2TKDi0T3LI0D4Jw0P7JAoO7ZMeM7RP4gDRPmlyQ/ukSA3tkxQutE+67NA+afFC+2QC
                RbRPgtDQPokDRPtkCklr+zaqg6N3ozksESDqsjNNgBi74+rPx1wfPupD1IcwQ31oIjE2al12pm3U
                U39avU6gfUuT1GtPRLZqPWb2bdVplkbVlDW7vLYDCWhgAYYC1jR0aEyktjLuMLrsTLvDJMN8Ig4n
                1W8x3avdYrqPPzQX5y/iZLMTJ+P2VYAk8PEs29IoN23pkwG2bDOQA2eSu7VvbU7cm0Syx4O3Pm0a
                Rdkg8JzUc6fVD2X0oLn2lkBoWY+ZfaFldWL0oJHERg8aOWT0oBEFZ2H+TR2Z1Rk4dXj0oBEFRw8a
                PWb0oBEHSA8aTW70oFGkhj5IChc9aHTZ0YNGixc9aEygSA8aQWj0oBEHaIKOBpZo0tXZmaZJn7j5
                x7Bhy3Hqp/Vj12XVTz1tOZ6l+ieolQboKKBgprxjQ8/UPXvkPXth4jnDbPPgf9TOvZHHuezO3e4z
                I9FUCh/+xbDhb6UBiGHlfE0IWfunmMn7mZyCGXSlARZqmLUb0QgBo4mEsuq8Bz1R2TnkBHXnQFMX
                nkNQVHnObWB1+5bSnsOtNEBEfc4KKSw/B56Y/hxgRgjQwaioQIeaugT9DoK0wG0Cyi1bOrRSFcTW
                tbkCxCSQ9VtQG9hJNfaeg/x71dWI6ybQRZUqApiZVUMAMVPOzpDUrQWBnZmVIAN/VPnx5e2N2Bdn
                Ls5cMOPMZSIxdmpddqbt1PnHFUdhNK2xXT+wXTdgIWG71mJm33ZNOQvAqGWxJwF1b03+lz1NFJxJ
                7vZA4t4MkHdqiXtWztNXTtCpoiOKp8vOtChe4gXPzshL8k+mhthp49xFJI9IHsyI5JkXGBKpQcW9
                UKaZRVIuPAQ4rjjq7Ey74gT+8KX6zaYjf7PxxuMT5+D2MfNyc1CsLzHIpNrbgkuwsS3QrJSUKOPS
                FJR0pDOjNndHxecEoeFvpQFKPW1xNS1eeFlpgGwTYlxOGB7+d7MKr2q1kMbt9JjhbZvktNoR43Ga
                3PC60gCVPtJ4mg4rvKs0QLvpNz6nThBPLA2Q6tuO44kBw89KA2Q77eNzwvDaPOXVGEW9SeXexcPh
                LNHTm4StdncTE9otsBGawRGHnJr5vItCq+gMAjepUQW+HnnQrJVQr9mhClyPmX1V4OrELK1KUsdm
                YWWSOjJrq5PUwVlYoaSOTLJKCXii5S6A0yuegJm4+h6AmjpuuC1vcFEQJYl30mrZJlxyYWq0zZPC
                pSi5h52WiBteJgiAoSioJgWauBwRgKaIESEpKkcEnDlKNljyICFxdHTZ1mVnWpft5CX/MJyBm0wq
                60e7PEXo2rMR/ageM/SjasTYr3XZmbZfu9PQS3y3+mbdvdpmbVLtUceGnRpgUtv0gzQue+s84KZX
                6HEHM9FKD8jplXr0YSZc60EbHtViD8gJVnsATb3cA4Ki9R6cLSULPsCmVfHB+ihc8gE8sZoPgBlR
                9AFGxaoPqKmXffQIXhpT+NHlpkDph7YOSg4cPre67RlQtQPNlSNStyO7huqhQ8onqt8GnIHi7Vny
                8ea+biyAR4m3e+smUGlFpRXMzJJwQ0x3p4admZt17NV4pk7/es/UMenE2GWbtmfhUGKGk3GuEnQx
                HWLigeIfCnyIVTLiZpLY8LW5Zlmn+hQ/k0PW0a7y3jn9WlItjKeJgsPfitEK1XjjaXLIOkhblevy
                8ThhePheaYBcVwX8ThQcPlcaoNQPA3fTY4anlQbINjHB7cQBEkFZqJm0WtDgdprc8LZ5QkeqbxC+
                pkgNTytGK9LqCReTwoVvfZ49tNpy4Wi67PC6+RIp0k8NT9PihXcVo9VufofPmUARTyxGK9W/EMcT
                hIafFaOV7TiJz4kD7Hak/Y+WoTijgSQ7P4VSeleU6x+KA4qCw9/m8WgDmr7iguaw5IEEKwPGXjhK
                HDceellyCrvL5YlMWlFrd60R7N7LAiqLjkZRU9o5KvucIjucbnqdPpz4G+1TVxYt149o+OIkgT+q
                3u68v57xot05PTlhZlaTx58ilmZpVK2obpfXdgSFji8AM6lhCKujaNcJwOn1L4CZePE7ADXLqOGm
                W8YEO63CGHiZUFQBRUGFPtDEJd4ANEUWDElRfSngzFElwlJWIAU6XZ0N7MzUbCTZIEn9NEurazbu
                1img2UCzATM0G3tVD+PxibS2Tb6gh6k9DQtoyGxqAkMXhX+hijLb06xGp+xziNlEz/vWglP2NhSI
                eo5mIzNlH0MxKu5wABQHaKvkV/sKJ/KAEJwMfbY6O/TZWrzQZ5tAEX22IDT02eIA0WebQhJ9tig4
                9NnmsESfLYsOfbYuO+P02WEUV5dm368v95eVZnfvDOrIWbuX/yIrcmpGhE37wquHGDZ8rRjtMP5I
                UveU0zFx9Qv7mRAyo56Q2LGmDAJslurqtXP7QsA6PB9IWVNv1AJZ++woJ84Gm61SX+2NTYkYPoa6
                V97hZPEZ5X21b25q0myozeNaURAliXfSNte+WH8PmAnJ6YFlu5he+zyiSA6fUyqCgBYlEGasldoM
                8UO5IhaQUcIiv2rK4uv8FD9p76NqRVTMJQfOKH/r2lxsZBTJ2pm6a5UanbPuYZjFSY26B1rSX3s3
                EJPQg01OkU3vPEE9NtCkxL3gEpX1Ak5Q1As0LYEovIT1hcDTUxf+FLP3fFPIYv/ZH+aLTcXswC6/
                7fXmcvxENGu4mqbuCW46qidYqetlICimlgGYsNgCeIIZe6CZka+HI41BhZOkJgotnoP8paoLLdYN
                uKzQom2Q5OfBmh3cJGo9m7dwk0C2kdyt7QSzOErz71XeCx46V9sLOJgguhPGZqHoTh2ZtcI7dXAW
                iu/UkVktwFOHZ60ITx2cjUI8dWbWi/HUAdoqyFPnptXwD2pWyifVcdksoVRnZ5uMUp0XUkoTKFop
                p1SHZr2kUh1g4KWJM46cmf+SW5I55dde/uGctH4ST7n0+qkmrwGcOQobWJqrsRl4QfDhjOLNgNFx
                Mpv1A9llZTadjrToy16hDeBKA4SkNu0+0ETFNqArDRCS27S7QBMW3LTvwScquQFdaYCS6AZqpQGy
                shsQri7kYsIbTpirG52U9AZupQEi4huWyM0lUkt+0+tBT0uAA7HSAG0JDhxLA6REOGArDZCV4fS0
                H+Jos3wDdKvDpgECDmiuHNFACcc0y+dk4G5AOU7AsR6hpU8K8g2wmSfe4FHMYtl/gKnlHyEmnXtk
                UzP3bPy3O3OGbhhuRkyOOh0/0kXw2jOS07Ektkufjs+5gPjDD+fND0fVl487lg+WD7A1f/loADLt
                kz+XazFgXK7ViFl/udbGJyIxBJaqvBBy+kI1GEqrnbi+iWqdAGdu/D/K8jVk7FWN3nVub+Wjd9rb
                AFdUNWJcUaXxcetRJcetR58htx7xwzOtVk0hyf1VFZyB99fEDUdJvrFV7s7ZuW3L32DVJyT6E0ls
                FupP1JHJ9eUEnLXSIXVkkj05gSfakRNw9uZD1JlZnxFRB6jWixNuip04oWalSFYdl80JY3V2Kj04
                4UWK3xyKUv03gYYywwiA5PNFwZnQeROW5mozvHCUxTVKC9YnH8IMhBlgQ5hhpqqZ7L6cj5EgFgVH
                gliPGQlicYDEFkTBEVswh6WJsYXhxK1T89GTDy144/GJE3Fbt0FYAWQUDpgEzcKwgjIuqwsGlMFZ
                GwtShmZjHEiZl/UxIGV4thYI6DOzU7eszM02zbIyK/TK6gSt1CorA0OnrJ7GsDWXqOx15BENckAD
                84hxFARRtmHMcZnEdRMum0ns/9R8nL+Ik81OnJDbl3PyiawjJmHD30oDLNSXq/uaELLeHX4mKroA
                3equZp/0ghKcS3nZI14mrJjptcEnqpsBXWmAjeoZ7Q1OiRh+VhpgvepJ2+lk8fV6eKCmdI07eGmA
                VndbuJUGiPS3ZYncXCK1lKJd3E1MLwqx0gBt1SgcSwOktKNgKw2QVZASVVkZMPbCUeK48dDLklMU
                bNXOK2d9AuqbOx5vRheOU7CtryCavTDUxRliQiiwyWlqiMaK5fjxMdEUMeD00o0wE89WAVAzV8Wx
                RCjfgZPpZjtgp5XrgJcJmQ4oCuY5gCae5QBgw1ounDPr4ab53BxWr9tv83Cxa89Psh6S2CzMeqgj
                k6sjBhwJK1FkkiWpwCPbKA2ObKMeM7KN4gBtzTaqc9Oqi4MaWWJBXGSJddmRJdbiRZbYBIpkiQWh
                kSUWB2jt0xTUwVmR3k8Cz5s5qRu8VM/w6z/jW32KkuGXxGZhhl+7gEAoTdy9pweBcKK48yCNb8sY
                0sSW7Wxy4PA3svuarqbEDC9Dj2GAy8kC7Hal/c9iSQ3kNsnZme/Xjp4oksPvSgPQatThhbYGD0Nd
                Y5PfaVPEG0sDUEkJOp8UNHytNABxm7jfyQLs/BTBJkSku2gTLfM7OXBG+VvtDFBjJKW4oDnyYLzy
                RK9MhjkvL3Ve/Sj/5xRwBDsv7ITXQndOSX7spVm8cYo+To6/HitCjo8cH2zI8U1FRsM9UXBClRQg
                E66jAJ6oIB9wevJumInrgwGoqQ6GGw33dKnRcE8Kl6KMG3ZaomB4mSAmhaKgKhFoTZC0nTOx+Bxn
                SW5R6kc1sovrZpBdJLsINrKLpiIjuygKjuyiHDKyi8LwyC6KgiO7qMeM7KI4QLKLmtzILipSI7so
                hYvsoi47sotavMgumkCR7KIgNHOzi6OP/B9/6MyycDipnF/cqHkmv0h+EWzkFw+ZrN0O99JJqnMu
                +l44jDaPjcet9ves9tc+Pap1EAKcuS0vZlmcZH5afR3RV6V54/GJU3E7skz6F2ikfo3hZX3aVxme
                rSlffWZ2ZqKUudmWhVJmRQZKnaCV2SdlYOZmnib+aOSFzix62zwZHxVC6BKKvHZEi8STJDYLE0/q
                yChsEwVHYZscMgrbhOFZm9lQB2djdkOdmfUZDnWAtmY51LlR2KZIjcI2KVw2pxPV2dmWUlTnRVrR
                BIpWphbVoZmbXoxdP3RGbjisXufQW7+KklwkuQg2koumIiO5KAqO5KIcMpKLwvBILoqCI7mox4zk
                ojhAkoua3EguKlIjuSiFi+SiLjuSi1q8SC6aQJHkoiC06yYXAUi3MVvBDWI/CHw3TJ0yaplDDP1w
                fHL0ssNl4dJOaGDnuHxPCD+ckbtxlD5Om7EeEUKbgTYDbGgzTEWGNkMUHNoMOWRoM4Thoc0QBYc2
                Q48Z2gxxgGgzNLmhzVCkhjZDChfaDF12aDO0eKHNMIEi2gxBaGgzxAGizRAFhzbDHJYmajOGca1H
                QffWAwuXFWb0ej80Hecv4mSzE+fjdmCMPAjojMqEQO1GPRfSewShZjYEcjfCoVro3YgFayF2Y0S4
                Fo43igFbsN2oh2z7DyAsDUgTZxw5M//FHU4yp/zayw07aRW92NWvw9WPALx40FYNHD53Y1DupNuH
                ZmnA2AtHiePGQy9LToF3ses7rnhz5dQXG6AsunNmLWfJx3Cy5U/H5S3XOVBQTkE52CgoP2RymqVR
                tTm6C2x7nppblXzWDiITdxS9OQM3CKov+fcs+Sz5YGPJtwAZPUREwdFDRA4ZPUSE4clpZwGnp5yF
                mbhuFoCaqlm40UNElxo9RKRwKQrTYaclS4eXCaJ0KApK0oEmLkgHoClydEiKapoBZ46iGZbm6irj
                KL/JJlM3qdERZn0XQGaDzAZsyGxMRUb2WBQc2WM9ZmSPxQGSPVbmRmJLkR2JLS1eJLZMoNiY+N45
                g0T5dhAHsyiqXorVvyVGxGEagHq5n3OuJ9ksjty4+mLSZTGxci4CjtzVvhrxNBq+zPzAq76SXK8p
                SFu6wdCmLV1rlhGTqLXb8pcdSC5suWU7WF9U3CCI3qpvBndsBj8wGXtsBoLU2h02AzNI1j+MGbgX
                PLtDd1T9XnBHhOHaF1X62YiCo5+NHDL62QjDQ5EoCg5Foh4zkqjiAFEkanKjn40iNfrZSOFC9qvL
                DtmvFi9kvyZQpJ+NIDT62YgDpJ+NKSTlcv6AMyfrD0uDE//RMEucWRYOqze0ueNRgdeekmT/RcGR
                /ZdDRvZfGB7Zf1FwZP/1mJH9FwdIFlmRmmVZZO2HT5PX0mdIgkR8xSQ6aw5LE6OzEy+YFbNx4oaj
                yuHZe3pJMSfPUDaezbx4Fr151RsS3V+vcpwDi63BFG1i1odStPHZrBTWJsf9XJ+h7P38ri/daAMJ
                I3chSBpL0rwGu7E3/BjW6It5/yB/oVWfjAg7RMHZGItQZ0Y0Qvo+RDRClRzRCH2GstEIk7p+1u7l
                LVeBZxK1RwQeHD5NYIlTGqqKyCdnfrQexJ77UjmK9IBQ59prC3WUouCoo5RDRh2lMDzC7aLgCLfr
                MbM+3K4OkC7Kmtyof1WkZln9qzoum7OR6uzooqzFi/yxCRTpoiwITTbtD0CE62aRlNNwAM6c1D8s
                zc3+f7hvG3v6cWn/9bDeZdP+nZ60DsXmxD/oSgOEUv8dbd2X7cn/zk/t3fL45NL/oCsNUBIAQK00
                QFYCAMKbjTyXjgiAE2ZpgJYMAG6lASJCAJbIzSVSSwoAvZW7iYgBIFYaoC0HgGNpgJQgAGylAbKS
                gHYXhKaIAtodWIrKAkC3ujgYIAyA5soRDZQGxN5z7CXVH678sH4u02wK8D5yZlnsP/tDN/UrnnB2
                p+X2xmhmOOmsT+4I3bTGY74fHuVnIo3D6l8XzjojvWGcr/f1nibzSNuUa2v55NRTgJPTToFMWDkF
                PFHdFOD0VFMwE9dMAVBRdwM1KdUNuBqjATjro5PzH8TOa+QPKz/Wp3vbk48saEe8FPVgkGvIqgJD
                6XhzA/Cpb+1yggbAGZwAj/KtPI2mg8rHsLZ+Clx9QpLgEQVHgkcOGQkeYXgkeETBkeDRY0aCRxyg
                Wkk83EjM6VIjMSeFy+bkhzo7lVJ4eJGuMoeiVBk80MgyGgGQLKMoOBOKpmFpbsZ4EETDyk9R73bX
                Dbhstrh7TwW/aL4YdKUBQhnjHu3UlXPG3TvwiWaNQVcaoJQ3hlppgPWZY21luiw+Tiw3G9ktndQ/
                F4TSAK3kP9xKA0TS/yyRm0uknQIA7fOJIjn8brVQiog3IFYagHxDf83UZogvlgZIiXDAVhpgvQxH
                e/WUxaftgFu2dK3RUBmFzWYBlVEg6/ufgfKpYf7TDVOOkk/11mfeZeVTPR6AoiqfAl1pgJJ8qg80
                YfkUPve50yllJOFWGiCSkSTCoJrTgpx+ZB2GxPcaEl/oEN6ziRrhvWaBbNf3PwPDe8mkaKj75r5W
                f65Bv321GB/1uqIRPsDJxfdAJhzdA55oaSTg9AojYSZeVwdAxUwI1MiD1IRFNB2GFkbTWTEbFpo9
                Z4TvzU292JnlB7EaIb4OIT5CfIAjxGcFMkJ8wvAI8YmCI8Snx4wQnzhAQnyK1AjxCYWHCPHpMyTE
                J75iWhHim7jTqRc7bjytHuF7vFqEr9eTVpXa/Owb0DVufYEmz7/ZuzmEbprFbuCM/efqfRzurtfH
                gRMMcU1pcMQ19ZhZH9f0xuMT4W0HBS9dW67zMACY2d0PQJmbSndrWBGI1ico1Q0ZYNfOG5wznPAc
                +OG4chzhvkccgTgC4Igj2MHM+jiCOkBbYwlmcLMznqDOzraYgjov4gomULQytqAOTVaXaFInwTtr
                9F64nSg4k9ytb7NGDw80h6VJTvmgJrXEB1HJ7klrjd0kjSPHHfqjysmth1v55JZyrlXuUAa0Bu3j
                51xUgnxRcWIvieLqyvuHe/lFRbv008a0qzYx65Ou2vhsTt1pkyMRpM+QjEIDoimP1tyBTKJWOw/U
                mEsQIE98Mp+BEbHE80bOIJoOql5de7f6XYO193KurmrEuLpK4+PqqkqOq6s+Q9mrKwll0dsr4My9
                9zxHwyxxBkXurvLNp80jka89JSlzFQVn46VVnZn111Z1gJS5KnOzM+Cgzo4yVy1ehIhMoEiZqyA0
                InviAInsiYIzQZoCS3OjtGM/P5P505k7rBGlvbtalLb3KC2XIk7LaiIHDp+7IcQu625KzPC0GxIj
                ZridLMD+PT5IbkvZ9dS44XGb5MhK6nqdFjs8rzSAnLKWt6nwwsNKA1ABmOB32hS7fbwRNYes80lB
                w9dKAxDhiPudLMD+HT6Ijkra9+TA4XOlAUjgzHFDE1gSi/k0YOyFo8Rx46GXJafAu1yommWVBz+o
                r6ImCon/9kJn4rmjQZZWVxJ31q9Cmv0etFv/KKnjICYtrAKfqkwAcvqpLxhKR3I5QYuGAztI+nWD
                DniduffWOMrPYcPAr9GfvUuXwmvPSLkiSsDZG3BQZ2Z9yEEdYGOyd2ftaJGFL7ldUfUodE9/P9e+
                ltu4KWgTs35L0MZHFFqVHFFofYZEocXP03JRaMCZG8j042ihwKl+7+E5k9x7IMa9xxp83HtUyXHv
                0WfIvUf9+My9RxScgfeeoTtL/Vd3s8ndcfeevvy9R31Cot8QBWfjlVWd2XUvrefcA5JpcZ8bRW9h
                5U3g/pFN4NqyFLFGtXAjiqLOTqVxJryIe5lDUapzH9AIVxoB0MSoV36Xe/1wksCdVr7xPPSuduPp
                d6iC1LzzQE751tP/qa1Anp7KvQdiZtx84Ch59wGb/O2ny4kFuYb4xVUNHD63uiU0pdQamsIRJNZQ
                WXTnDP65z6kXOx9RVjn296gvefPG4xMnY4eoH8yMjvdRZ2A7OWWPU4nRwko9Oss6CUMTvFAqtg4w
                4ag6Kyb4xH2vMaHZ87a1zsLqnWAe7+TDQ+rxSltDRGZwszPYoM7OtoCDOi8urCZQtPLSqg7N+puP
                OsDraIrO2gBm4s8c9839qH7dud5jZzt9tDWaFx7IKV952vfQ07r0QMyMaw8cJS8+YGvG1eesrePD
                YX6liWv0UOxvNAEjY8ABGm4mH59hp3V4hldjjs5nzfbnrxX4tfbv6zWDYW6yf+tzY/9WZMf+rcWr
                Afs3FMk97hy8BvmnMYr+rn7u2pCKcu7i3AU3zl3ms+PcpcWLc5cJFKUSjkBrQroRgKK3HcCZUyB4
                imwDleLKgLEXjhLHjYdelpwCj9vCpVdQA3u35ZvCy5Y7HRcwojT32tORgJEyNwJGiuy4ugpC4+oq
                DpCrqyi4xlxdz3qE9oORM5y48bhG3vV6JZ/MUY7R+tw4RiuyI++qxYu8qwkUubwKQuPyKg6Qy6sq
                OAPTPRPPTZ1h7CaTylfVrv6zeuRnJEuJKDgDl5KBFwyrryJ3HflVRLnZuG0Xb2VWXLrVCVp54VYG
                JnvZ7vNsXNUzMuhWJ8qmZItZRa3niFde++6KE0piO2tr9Sh89kfVVTaPdIW8dgTMtsCDOi+CDyZQ
                tDIAoQ7N3MbOs+jNi/OzsDPLwuq5g7u2fu5AfW6yjWvxYhtXv8fJhqSB16BI2Dl39ZEbv3hJ6gRu
                7Ltp5V39jtaD194lzGuEOfHHE2cSxYk3P3NWn5T3V5uUfZ5wo3h7BZv8iaX3U/uBPEK5JDo7uSg4
                fK5xd4UTaHbZBHXbvOGKq1XUXsmD/AZooOwhSaPprNgI0nx3iLNp1dvs/e31brM/NS/TLI3iE2fl
                9jbIlYhlxdRzNeDM3Q8G0ejDmcVeklTeCe5p23r1GclSIgrOwKUkSb38qhZHQVA9SXL/qN+8TvtY
                aV7eLvXy6eGHziwLkso674db/RYVTMjGTUjXGQRuUlnY8NBvy89GtuzmbdlpvkAG+Yys/pTPhwf9
                9ZEZ2bwZmRMJgiI++eam1Y+RDw/cSZmVZ5CAuflRpFaU5JFCA2bkOS7b2cyLh14QOEngVs7iPLZZ
                J5mVh2fl4nMovrccaxjFgfu+GuTy09gE2+n2Pz+Lp1l+zfntDvzAT31vdwYdnPaH/+TLSbf4s4/9
                gJY/LH/XT35P/NHIC5cvNYhyAm7466/ib/LPoPxx+ftJEO2IU55axXf3fLir8S++HnthfutL84/7
                sC9//o7jv1Zw5c+/25jGT2s/2KK6CWWFKUndtAKiqjbVM6n9hUk5k71D/nKKDNzEm5u6xfIun7ar
                n5W/7D0/R/GepWvx/dXM+Hy1/T4+84a+W01vVbxm63HLpT+HtjHZ5p/CPsblDxZ8ixFuflit4mfz
                0a1+sGbAfqf/buDFd6Y57+XLttq9z+BRPtTFdxfvG+ej3fe+A3f4ki9Iz24WpKt3it23P8Z+OskG
                WZLveVGYemGav++09a/8Hf/9X//ZWr5ga5ob68WrL5cDahWvWozmj1k4fmptvMfqTZ+9qRt4+5eP
                tV/4/INCUPfxw2Ocv+bWSBfvs/m23492/dfmf/wc52P6+Y92NdbN1/98x69Guv4ba3/yw5/s1oe6
                /h5b73nEYHc+1yidrDbCjUVyFHvu9Pdb7kJ7TzHnAjIfT2v+5s78zeeWJ6/7ENWClLvymmmL70yi
                6f6j6lmNLN71iwlYz7ozTcK1EX89H0+ekTmf4m0W/42en/1iA3LcOC2eznp5SNsjOAbYWT77nYF8
                w+Fp5y+WB49J9DaK3vYffc6zfy0MKN/4czsb+8+721mNDe1MW9q+YX9+6J+DX5/7p+xx557KK0tW
                w1dYc1aj3vroz7DulG+1OJDO337+3+V9c8+Bb/0u4fh7XSr2Rs4gyPbuL+dyuHLArfXRtcqRfHOe
                XA1rnB+0Lzum4h23BjYfxPqo0tgNk5kb529/scGtvee+D299SMuhnsmRvxnnV3tTOaaLUt0EujaA
                jSFdG+nWAHdwPq3+bPn1hxcE0dv1PXoxjib58/qIGubNy6E13JeXo2yKJy+H0zg/3gPzey9e/NFO
                QM7xd7fy/Xv5MP5IUje4uuP7reVIjnX9Hz6ZHTOoL2NBW0fly02cz0HurAMHB7xvTbjw4vXFsBu1
                fH2O85gF7LKz8ru4xeYF4tpsD4/2MONrj/n7FXj5V8svx9H+2OKF19JiGM1aSD9H9O0qelnvng+s
                Oa49H86xfn1J75gPrJprFH+y/H/iB697g/KX9ozFQJrlG+tjaph3LIfWHP9YDqiJHrIcWjUfWfzR
                ngP8vhP8/iO8N81/49C2c9Hp4reWY2nOhPkc0rdJnvI3y9irH3tFkCTw3Odx7Hl70wuXXb381s6g
                GrWSHRxfs1a1fcNs0ITdHdz3U3fnb8pQfdEauGwK3IQJvDGghk3ePWNr2sTdHGKDJu3mwL6fsBu/
                v2/727P/ve7d/sp2WvM2Wlef4q+tjfEcO8MrpYYv6BV7zakSB6uRMr6sU21beIxPVUslX9ITt62p
                FiGqkWIutEfr77j85iT/f1rc/5wkyoKG3P5eW/uGpe+ih60yzFP3GqrusHuNuoTf7nvj5c9mQT68
                MDuo2r6gy5ZD0XfTTUsMc82VceruuDLkEi5YvtmeA/Dr7vn3fe/5d7No6fpRoPfW5ojOMCOett5i
                z8f3vvPx7b89DILcf5y3SW7XgSqm0J+6qXeo7u1ya+Fra22srXJY30pP662Ll1sYvzLrG2nq6Yvk
                RT3jgKVfSVfrrpgXXDIPWPWdtPUHls+ism/5dpc/mWyarX022WOLSaeTTfOkzyebplzihLL2fru7
                7O4Z5XV/imr+nLrPx9R9HZC+5NTwWweGJj5PDtt1iUlz4L2XP353PpoAPh+GPOTChksAzd9nj/fv
                huhfD6So/eH+WpNLQ/db85Gc5Uoyf+XlF/sagjfC/H0DU/eCA1Zdwi/2vfE+R9nrKftd5ZvnxDRh
                FvmtbwZ5Fv/65j2bttJcZqnZnmfzibZqJzNv7VAOuPh/xa4ih9pztO9ut/tz7O/O0dnoznGwN8ey
                o9esQleSeUuOzX4k5ViOaOR00LD2kYbdVjHMTdP8EF3VuM5PG7fbVOUHbMvnsxdW6uU7N64rYdyy
                V4xTD2BPY3aWRtYk2f9pK7tnMtIbVTXt7mvTPnv9PO128/nS9D3dq9pr3avmL3fYljCKp5sNjL4x
                pnilrbWy+NaWMXMbiv+9ef54svP0sLvb/ANf/Oivfzy14igf7P8HQKJ5IHiOCwA=
              editable: true
            virtualDSCreator:
              writableColumns:
              - customName: weight
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        - $type: MethodTool
          dataSourceNames:
          - JsonDataSource
          iconName: Method
          name: Extension Tool
          returnValueMeansSuccess: true
          method:
            hasCode: true
            code:
              $type: JythonCode
              input:
                useText: true
                textInput:
                  $type: ScriptingTextInput
                  text: |-
                    from com.parasoft.api import *

                    def execute(input, context):

                        try:
                            # Leer variable
                            weight = context.getValue("weight")

                            Application.showMessage("=== DEBUG WEIGHT ===")
                            Application.showMessage(str(weight))

                            # Conversión
                            kg = float(weight) / 10

                            # Guardar como STRING (IMPORTANTE)
                            context.setValue("kilogramos", str(kg))

                            # Debug kg
                            Application.showMessage("=== DEBUG KG ===")
                            Application.showMessage(str(kg))

                            return kg

                        except Exception as e:
                            Application.showMessage("ERROR: " + str(e))
                            raise e
            hasMethodId: true
            methodId:
              $type: JythonMethodIdentifier
              methodName: execute
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${url}/pokemon/snorlax"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Trafico de respuesta pokemon
              showRequestHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: ExpectedType
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: pokemon
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: snorlax
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
  - $type: TestSuite
    name: Persistencia y Generación de Datos
    testID: 12
    testLogicVariables:
    - $type: TestLogicString
      name: idSuit
      value:
        $type: TestLogicVariableString
        originalValue: 0
        value: 0
    - $type: TestLogicString
      name: fechaSuit
      value:
        $type: TestLogicVariableString
        originalValue: 0
        value: 0
    - $type: TestLogicString
      name: nombrePokemon
      value:
        $type: TestLogicVariableString
        originalValue: 0
        value: 0
    tests:
    - $type: ToolTest
      name: Data Generator Tool
      testID: 19
      tool:
        $type: DataGeneratorTool
        dataSourceNames:
        - JsonDataSource
        iconName: DataGeneratorTool
        name: Extraccion de Variables UUID y Fecha
        generators:
        - $type: StringGenerator
          name: id
          pattern:
            values:
            - $type: ScriptedValue
              method:
                hasCode: true
                code:
                  $type: ScriptCode
                  input:
                    useText: true
                    textInput:
                      $type: ScriptingTextInput
                      text: "import java.util.Random\r\nimport com.parasoft.api.*\r\
                        \n\r\ndef execute(context) {\r\n\r\n    String idTransaccion\
                        \ = String.valueOf(new Random().nextInt(999999))\r\n\r\n \
                        \   Application.showMessage(\"Random ID: \" + idTransaccion)\r\
                        \n\r\n    context.setValue(\"idTransaccion\", idTransaccion)\r\
                        \n\r\n    return idTransaccion\r\n}"
                hasMethodId: true
                methodId:
                  $type: ScriptMethodIdentifier
                  functionName: execute
                  arguments:
                  - java.lang.Object
            fixedValue:
              $type: StringTestValue
            selectedIndex: 0
        - $type: StringGenerator
          name: fecha
          pattern:
            values:
            - $type: ScriptedValue
              method:
                hasCode: true
                code:
                  $type: ScriptCode
                  input:
                    useText: true
                    textInput:
                      $type: ScriptingTextInput
                      text: "import java.text.SimpleDateFormat\r\nimport java.util.Date\r\
                        \nimport com.parasoft.api.*\r\n\r\ndef execute(context) {\r\
                        \n\r\n    String metodo = new SimpleDateFormat(\"yyyy-MM-dd\
                        \ HH:mm:ss\").format(new Date())\r\n\r\n    Application.showMessage(\"\
                        Metodo (Fecha): \" + metodo)\r\n\r\n    context.setValue(\"\
                        metodo\", metodo)\r\n\r\n    return metodo\r\n}"
                hasMethodId: true
                methodId:
                  $type: ScriptMethodIdentifier
                  functionName: execute
                  arguments:
                  - java.lang.Object
            fixedValue:
              $type: StringTestValue
            selectedIndex: 0
        virtualDSCreator:
          writableColumns:
          - testVariableName: idSuit
            mode: 3
            customName: idTransaccion
          - testVariableName: fechaSuit
            mode: 3
            customName: fechaActual
    - $type: RESTClientToolTest
      name: REST Client
      testID: 16
      tool:
        $type: RESTClient
        dataSourceNames:
        - JsonDataSource
        iconName: RESTClient
        name: REST Client
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - JsonDataSource
          iconName: XMLDataBank
          name: Extraccion nombre pokemon
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - JsonDataSource
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/forms[1]/item[1]/name[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: nombrePokemon
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${url}/pokemon/pikachu"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: pokemon
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: pikachu
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
    - $type: ToolTest
      name: DB Tool
      testID: 14
      tool:
        $type: DbTool
        dataSourceNames:
        - JsonDataSource
        iconName: DBTool
        name: Insertar informacion a base de datos
        magicToken:
          fixedValue:
            $type: StringTestValue
            value: GO
        outputProviders:
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            name: SQL Query
          xmlResponseOutput:
            $type: NamedXMLToolOutputProvider
            name: Results as XML
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        sqlQuery:
          fixedValue:
            $type: StringTestValue
            useMultipleLines: true
            value: |-
              INSERT INTO pokemon (idTransaccion, fechaActual, nombrePokemon)
              VALUES ('${idTransaccion}', '${fechaActual}', '${nombrePokemon}')
          parameterizedValue:
            column: ExpectedType
        failOnSQLException: true
        account:
          local:
            $type: DbConfigSettings
            password: AwAAACxBVkhkV1E2MWZiMjNrNkdkOWhSK1pMWDh5N1FjeGZxRW9Takd5dWNsWUNBPQ==
            uri: jdbc:mysql://localhost:3306/pokeapi
            username: root
            driver: com.mysql.cj.jdbc.Driver
    - $type: ToolTest
      name: DB Tool
      testID: 20
      tool:
        $type: DbTool
        dataSourceNames:
        - JsonDataSource
        iconName: DBTool
        name: Consulta a informacion ingresada
        magicToken:
          fixedValue:
            $type: StringTestValue
            value: GO
        outputProviders:
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            name: SQL Query
          xmlResponseOutput:
            $type: NamedXMLToolOutputProvider
            name: Results as XML
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        sqlQuery:
          fixedValue:
            $type: StringTestValue
            useMultipleLines: true
            value: "SELECT count(*) FROM pokemon WHERE idTransaccion = ${idTransaccion}"
        failOnSQLException: true
        account:
          local:
            $type: DbConfigSettings
            password: AwAAACxBVkhkV1E2MWZiMjNrNkdkOWhSK1pMWDh5N1FjeGZxRW9Takd5dWNsWUNBPQ==
            uri: jdbc:mysql://localhost:3306/pokeapi
            username: root
            driver: com.mysql.cj.jdbc.Driver
