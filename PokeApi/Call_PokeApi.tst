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
        value: https://pokeapi.co
      name: PokeEnviroment
      active: true
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
  - id: ds_-1249774591_1779727278589_840839079
    impl:
      $type: TableDataSource
      model:
        columnIdentifiers:
        - PokemonName
        - ExpectedType
        rows:
        - - charmander
          - fire
        - - squirtle
          - water
        - - bulbasaur
          - grass
    name: Table_Pokemon
    useAllRows: true
  tests:
  - $type: TestSuite
    name: Consumo Básico y Extraccion de Variables
    testID: 24
    dataSources:
    - id: ds_-1249774591_1779727278589_840839079
      impl:
        $type: TableDataSource
      name: Untitled
      useAllRows: true
      lastRow: -1
    tests:
    - $type: RESTClientToolTest
      name: REST Client
      testID: 25
      tool:
        $type: RESTClient
        dataSourceNames:
        - JsonDataSource
        iconName: RESTClient
        name: GET pokemon
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - JsonDataSource
          iconName: XMLDataBank
          name: JSON Data Bank
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
              - customName: urlAbilities
              - customName: nameAbilities
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        - $type: DiffTool
          dataSourceNames:
          - JsonDataSource
          iconName: Diff
          name: Diff
          differs:
          - $type: TextDiffer
            ignoredDiffs:
            - diff:
                details: |
                  < HTTP/1.1 200 OK
                  ---
                  > {"abilities":[{"ability":{"name":"limber","url":"https://pokeapi.co/api/v2/ability/7/"},"is_hidden":false,"slot":1},{"ability":{"name":"imposter","url":"https://pokeapi.co/api/v2/ability/150/"},"is_hidden":true,"slot":3}],"base_experience":101,"cries":{"latest":"https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/132.ogg","legacy":"https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/legacy/132.ogg"},"forms":[{"name":"ditto","url":"https://pokeapi.co/api/v2/pokemon-form/132/"}],"game_indices":[{"game_index":76,"version":{"name":"red","url":"https://pokeapi.co/api/v2/version/1/"}},{"game_index":76,"version":{"name":"blue","url":"https://pokeapi.co/api/v2/version/2/"}},{"game_index":76,"version":{"name":"yellow","url":"https://pokeapi.co/api/v2/version/3/"}},{"game_index":132,"version":{"name":"gold","url":"https://pokeapi.co/api/v2/version/4/"}},{"game_index":132,"version":{"name":"silver","url":"https://pokeapi.co/api/v2/version/5/"}},{"game_index":132,"version":{"name":"crystal","url":"https://pokeapi.co/api/v2/version/6/"}},{"game_index":132,"version":{"name":"ruby","url":"https://pokeapi.co/api/v2/version/7/"}},{"game_index":132,"version":{"name":"sapphire","url":"https://pokeapi.co/api/v2/version/8/"}},{"game_index":132,"version":{"name":"emerald","url":"https://pokeapi.co/api/v2/version/9/"}},{"game_index":132,"version":{"name":"firered","url":"https://pokeapi.co/api/v2/version/10/"}},{"game_index":132,"version":{"name":"leafgreen","url":"https://pokeapi.co/api/v2/version/11/"}},{"game_index":132,"version":{"name":"diamond","url":"https://pokeapi.co/api/v2/version/12/"}},{"game_index":132,"version":{"name":"pearl","url":"https://pokeapi.co/api/v2/version/13/"}},{"game_index":132,"version":{"name":"platinum","url":"https://pokeapi.co/api/v2/version/14/"}},{"game_index":132,"version":{"name":"heartgold","url":"https://pokeapi.co/api/v2/version/15/"}},{"game_index":132,"version":{"name":"soulsilver","url":"https://pokeapi.co/api/v2/version/16/"}},{"game_index":132,"version":{"name":"black","url":"https://pokeapi.co/api/v2/version/17/"}},{"game_index":132,"version":{"name":"white","url":"https://pokeapi.co/api/v2/version/18/"}},{"game_index":132,"version":{"name":"black-2","url":"https://pokeapi.co/api/v2/version/21/"}},{"game_index":132,"version":{"name":"white-2","url":"https://pokeapi.co/api/v2/version/22/"}}],"height":3,"held_items":[{"item":{"name":"metal-powder","url":"https://pokeapi.co/api/v2/item/234/"},"version_details":[{"rarity":5,"version":{"name":"ruby","url":"https://pokeapi.co/api/v2/version/7/"}},{"rarity":5,"version":{"name":"sapphire","url":"https://pokeapi.co/api/v2/version/8/"}},{"rarity":5,"version":{"name":"emerald","url":"https://pokeapi.co/api/v2/version/9/"}},{"rarity":5,"version":{"name":"firered","url":"https://pokeapi.co/api/v2/version/10/"}},{"rarity":5,"version":{"name":"leafgreen","url":"https://pokeapi.co/api/v2/version/11/"}},{"rarity":5,"version":{"name":"diamond","url":"https://pokeapi.co/api/v2/version/12/"}},{"rarity":5,"version":{"name":"pearl","url":"https://pokeapi.co/api/v2/version/13/"}},{"rarity":5,"version":{"name":"platinum","url":"https://pokeapi.co/api/v2/version/14/"}},{"rarity":5,"version":{"name":"heartgold","url":"https://pokeapi.co/api/v2/version/15/"}},{"rarity":5,"version":{"name":"soulsilver","url":"https://pokeapi.co/api/v2/version/16/"}},{"rarity":5,"version":{"name":"black","url":"https://pokeapi.co/api/v2/version/17/"}},{"rarity":5,"version":{"name":"white","url":"https://pokeapi.co/api/v2/version/18/"}},{"rarity":5,"version":{"name":"black-2","url":"https://pokeapi.co/api/v2/version/21/"}},{"rarity":5,"version":{"name":"white-2","url":"https://pokeapi.co/api/v2/version/22/"}},{"rarity":5,"version":{"name":"x","url":"https://pokeapi.co/api/v2/version/23/"}},{"rarity":5,"version":{"name":"y","url":"https://pokeapi.co/api/v2/version/24/"}},{"rarity":5,"version":{"name":"omega-ruby","url":"https://pokeapi.co/api/v2/version/25/"}},{"rarity":5,"version":{"name":"alpha-sapphire","url":"https://pokeapi.co/api/v2/version/26/"}},{"rarity":5,"version":{"name":"sun","url":"https://pokeapi.co/api/v2/version/27/"}},{"rarity":5,"version":{"name":"moon","url":"https://pokeapi.co/api/v2/version/28/"}},{"rarity":5,"version":{"name":"ultra-sun","url":"https://pokeapi.co/api/v2/version/29/"}},{"rarity":5,"version":{"name":"ultra-moon","url":"https://pokeapi.co/api/v2/version/30/"}}]},{"item":{"name":"quick-powder","url":"https://pokeapi.co/api/v2/item/251/"},"version_details":[{"rarity":50,"version":{"name":"diamond","url":"https://pokeapi.co/api/v2/version/12/"}},{"rarity":50,"version":{"name":"pearl","url":"https://pokeapi.co/api/v2/version/13/"}},{"rarity":50,"version":{"name":"platinum","url":"https://pokeapi.co/api/v2/version/14/"}},{"rarity":50,"version":{"name":"heartgold","url":"https://pokeapi.co/api/v2/version/15/"}},{"rarity":50,"version":{"name":"soulsilver","url":"https://pokeapi.co/api/v2/version/16/"}},{"rarity":50,"version":{"name":"black","url":"https://pokeapi.co/api/v2/version/17/"}},{"rarity":50,"version":{"name":"white","url":"https://pokeapi.co/api/v2/version/18/"}},{"rarity":50,"version":{"name":"black-2","url":"https://pokeapi.co/api/v2/version/21/"}},{"rarity":50,"version":{"name":"white-2","url":"https://pokeapi.co/api/v2/version/22/"}},{"rarity":50,"version":{"name":"x","url":"https://pokeapi.co/api/v2/version/23/"}},{"rarity":50,"version":{"name":"y","url":"https://pokeapi.co/api/v2/version/24/"}},{"rarity":50,"version":{"name":"omega-ruby","url":"https://pokeapi.co/api/v2/version/25/"}},{"rarity":50,"version":{"name":"alpha-sapphire","url":"https://pokeapi.co/api/v2/version/26/"}},{"rarity":50,"version":{"name":"sun","url":"https://pokeapi.co/api/v2/version/27/"}},{"rarity":50,"version":{"name":"moon","url":"https://pokeapi.co/api/v2/version/28/"}},{"rarity":50,"version":{"name":"ultra-sun","url":"https://pokeapi.co/api/v2/version/29/"}},{"rarity":50,"version":{"name":"ultra-moon","url":"https://pokeapi.co/api/v2/version/30/"}}]}],"id":132,"is_default":true,"location_area_encounters":"https://pokeapi.co/api/v2/pokemon/132/encounters","moves":[{"move":{"name":"transform","url":"https://pokeapi.co/api/v2/move/144/"},"version_group_details":[{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"red-blue","url":"https://pokeapi.co/api/v2/version-group/1/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"yellow","url":"https://pokeapi.co/api/v2/version-group/2/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"gold-silver","url":"https://pokeapi.co/api/v2/version-group/3/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"crystal","url":"https://pokeapi.co/api/v2/version-group/4/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"ruby-sapphire","url":"https://pokeapi.co/api/v2/version-group/5/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"emerald","url":"https://pokeapi.co/api/v2/version-group/6/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"firered-leafgreen","url":"https://pokeapi.co/api/v2/version-group/7/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"diamond-pearl","url":"https://pokeapi.co/api/v2/version-group/8/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"platinum","url":"https://pokeapi.co/api/v2/version-group/9/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"heartgold-soulsilver","url":"https://pokeapi.co/api/v2/version-group/10/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"black-white","url":"https://pokeapi.co/api/v2/version-group/11/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"colosseum","url":"https://pokeapi.co/api/v2/version-group/12/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"xd","url":"https://pokeapi.co/api/v2/version-group/13/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"black-2-white-2","url":"https://pokeapi.co/api/v2/version-group/14/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"omega-ruby-alpha-sapphire","url":"https://pokeapi.co/api/v2/version-group/16/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"lets-go-pikachu-lets-go-eevee","url":"https://pokeapi.co/api/v2/version-group/19/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"sword-shield","url":"https://pokeapi.co/api/v2/version-group/20/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"brilliant-diamond-shining-pearl","url":"https://pokeapi.co/api/v2/version-group/23/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"scarlet-violet","url":"https://pokeapi.co/api/v2/version-group/25/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"red-green-japan","url":"https://pokeapi.co/api/v2/version-group/28/"}},{"level_learned_at":1,"move_learn_method":{"name":"level-up","url":"https://pokeapi.co/api/v2/move-learn-method/1/"},"order":null,"version_group":{"name":"blue-japan","url":"https://pokeapi.co/api/v2/version-group/29/"}}]}],"name":"ditto","order":214,"past_abilities":[{"abilities":[{"ability":null,"is_hidden":true,"slot":3}],"generation":{"name":"generation-iv","url":"https://pokeapi.co/api/v2/generation/4/"}}],"past_stats":[{"generation":{"name":"generation-i","url":"https://pokeapi.co/api/v2/generation/1/"},"stats":[{"base_stat":48,"effort":0,"stat":{"name":"special","url":"https://pokeapi.co/api/v2/stat/9/"}}]}],"past_types":[],"species":{"name":"ditto","url":"https://pokeapi.co/api/v2/pokemon-species/132/"},"sprites":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/132.png","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/132.png","front_shiny_female":null,"other":{"dream_world":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/132.svg","front_female":null},"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/132.png","front_shiny_female":null},"official-artwork":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png","front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/132.png"},"showdown":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/132.gif","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/shiny/132.gif","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/132.gif","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/132.gif","front_shiny_female":null}},"versions":{"generation-i":{"red-blue":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/132.png","back_gray":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/gray/132.png","back_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/back/132.png","front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/132.png","front_gray":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/gray/132.png","front_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/132.png"},"yellow":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/132.png","back_gray":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/gray/132.png","back_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/transparent/back/132.png","front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/132.png","front_gray":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/gray/132.png","front_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/transparent/132.png"}},"generation-ii":{"crystal":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/132.png","back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/shiny/132.png","back_shiny_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/back/shiny/132.png","back_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/back/132.png","front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/132.png","front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/shiny/132.png","front_shiny_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/shiny/132.png","front_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/132.png"},"gold":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/132.png","back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/shiny/132.png","front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/132.png","front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/shiny/132.png","front_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/transparent/132.png"},"silver":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/132.png","back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/shiny/132.png","front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/132.png","front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/shiny/132.png","front_transparent":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/transparent/132.png"}},"generation-iii":{"emerald":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/132.png","front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/shiny/132.png"},"firered-leafgreen":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/132.png","back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/shiny/132.png","front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/132.png","front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/shiny/132.png"},"ruby-sapphire":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/132.png","back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/shiny/132.png","front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/132.png","front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/shiny/132.png"}},"generation-iv":{"diamond-pearl":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/132.png","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/shiny/132.png","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/shiny/132.png","front_shiny_female":null},"heartgold-soulsilver":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/132.png","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/shiny/132.png","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/shiny/132.png","front_shiny_female":null},"platinum":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/132.png","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/shiny/132.png","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/shiny/132.png","front_shiny_female":null}},"generation-ix":{"scarlet-violet":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ix/scarlet-violet/132.png","front_female":null}},"generation-v":{"black-white":{"animated":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/132.gif","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/shiny/132.gif","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/132.gif","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/shiny/132.gif","front_shiny_female":null},"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/132.png","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/shiny/132.png","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/shiny/132.png","front_shiny_female":null}},"generation-vi":{"omegaruby-alphasapphire":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/shiny/132.png","front_shiny_female":null},"x-y":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/shiny/132.png","front_shiny_female":null}},"generation-vii":{"icons":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/132.png","front_female":null},"ultra-sun-ultra-moon":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/132.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/shiny/132.png","front_shiny_female":null}},"generation-viii":{"brilliant-diamond-shining-pearl":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-viii/brilliant-diamond-shining-pearl/132.png","front_female":null},"icons":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-viii/icons/132.png","front_female":null}}}},"stats":[{"base_stat":48,"effort":1,"stat":{"name":"hp","url":"https://pokeapi.co/api/v2/stat/1/"}},{"base_stat":48,"effort":0,"stat":{"name":"attack","url":"https://pokeapi.co/api/v2/stat/2/"}},{"base_stat":48,"effort":0,"stat":{"name":"defense","url":"https://pokeapi.co/api/v2/stat/3/"}},{"base_stat":48,"effort":0,"stat":{"name":"special-attack","url":"https://pokeapi.co/api/v2/stat/4/"}},{"base_stat":48,"effort":0,"stat":{"name":"special-defense","url":"https://pokeapi.co/api/v2/stat/5/"}},{"base_stat":48,"effort":0,"stat":{"name":"speed","url":"https://pokeapi.co/api/v2/stat/6/"}}],"types":[{"slot":1,"type":{"name":"normal","url":"https://pokeapi.co/api/v2/type/1/"}}],"weight":40}
                type: 1c1
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
            HTTPClient_Endpoint: "${url}/api/v2/pokemon/ditto"
          parameterizedValue:
            column: ExpectedType
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
              showResponseHeaders: true
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
              value: api
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: v2
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
      testID: 26
      tool:
        $type: RESTClient
        dataSourceNames:
        - JsonDataSource
        iconName: RESTClient
        name: GET habilidad pokemon
        outputTools:
        - $type: GenericAssertionTool
          dataSourceNames:
          - JsonDataSource
          iconName: XMLAssertor
          name: Validar Respuesta habilidad
          wrappedTool:
            $type: XMLAssertionTool
            dataSourceNames:
            - JsonDataSource
            iconName: XMLAssertor
            name: XML Assertor
            errorsOutput:
              name: Errors
            assertions:
            - $type: TypeAssertion
              timestamp: 1779725479552
              name: Type Assertion
              extractEntireElement: true
              Assertion_XPath: "/root/effect_entries/item[1]/effect"
              value:
                fixedValue:
                  $type: StringTestValue
                  value: string
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
            HTTPClient_Endpoint: "${urlAbilities}"
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
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
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
    testLogicVariables:
    - $type: TestLogicString
      name: PokemonName
      value:
        $type: TestLogicVariableString
        originalValue: 0
        value: 0
    dataSources:
    - id: ds_-1249774591_1779727278589_840839079
      impl:
        $type: TableDataSource
      name: Untitled
      useAllRows: true
      lastRow: -1
    tests:
    - $type: RESTClientToolTest
      name: REST Client
      testID: 9
      tool:
        $type: RESTClient
        dataSourceNames:
        - Table_Pokemon
        iconName: RESTClient
        name: GET pokemon parametrizado
        outputTools:
        - $type: GenericAssertionTool
          dataSourceNames:
          - TechnologyDesafio
          enabled: false
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
        - $type: GenericAssertionTool
          dataSourceNames:
          - Table_Pokemon
          iconName: XMLAssertor
          name: Validacion Type Pokemon
          wrappedTool:
            $type: XMLAssertionTool
            dataSourceNames:
            - Table_Pokemon
            iconName: XMLAssertor
            name: XML Assertor
            errorsOutput:
              name: Errors
            assertions:
            - $type: ValueAssertion
              timestamp: 1779727775150
              name: Validacion para el tipo de pokemon
              extractEntireElement: true
              Assertion_XPath: "/root/types/item[1]/type/name/string()"
              value:
                name: Value
                value:
                  fixedValue:
                    $type: StringTestValue
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
            HTTPClient_Endpoint: "${url}/api/v2/pokemon/${PokemonName}"
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
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: api
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: v2
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
        - JsonDataSource
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
                H4sIAAAAAAAA/+2dWW/rSHe1/0rj3LNlTR5eqB3kJkCABHiB5AO+uwOKKkmMKVLh4KF/fajBAyXZ
                ZskStWpxXXUfTyo+3KzatdeqzdG/PC+iPx5NmoVJ/Nev7p9Xv/4wcZBMwnj216//99//5t3++pf7
                UZok+R/lT8bZP56z8K9f8zxf/qPTeXp6+vOp/2eSzjq9q6tu5///53/8VzA3C98L4yz348D8+iN/
                WZq/fiXj/zFB/ut+5I/DKMxDk22/4aep/1J+PczN4vDPvux+OfYX5j5cLIq4/Oaos/7nqEij+9Wo
                snJYy+TB+MvwzyDplP/pPPY627/U6d50Rp3Vj45ev1R+cvZ7Hk4mJt5+zjhJIuPHv+6nfpSZUeft
                +/ejLCoxbH4qLhZjk/667446q6+Wf3B1BfbXkc/D4MGb+rndhQxOfiG9H17ILCryPIktb8htz+I6
                8rT49jL6O5fReQu4+9HYz8xv87w0aVjGuNm9k7d3o87Oj9yPgvQ9Vt8uOPJzk+Vvl5f6T3/Ownxe
                jIvMpEES5ybOy4tddP5ZXvi//vPfO+u/0ln4Ybz93xWRRRJ3Nn+p0x2UT9FsNtr+u/wEM/ODl5N8
                wvovffiEzV8ebX7sfjRN0kWdh3F9V7M4SSP/ud493o7AW33C6vPf7vT2zqw/+X40K//U7zCehEGt
                SeH1x83z7v3rlyH8/t370XZWO3ghqZnUu4jtH+l030a//cqXD8ppBjmOVvFuM8reBUb5YqIoebIb
                Z/9E4xz0649zlkSW93xwgVFmYVR+226cwwuMM0hfyhU+shvo9QUGmhbjmmvS6yhvLnHb/eVyHqaW
                j/vtBUZqFib1bZ+kuwsMdFritJ/mry4w0jK7mc5SY2LLsZ5qTbIZ6yT0yzXdluqp1iWbkS6Nn1rO
                T91LrEvLMucLy9+0HOolFqd5iTS3X0e7l1igsqSIjllMu5dYpMaRHzxYjvMSy9TTvPzbluO8xCK1
                5un1LJPnS8yna6LWI/18Pn374NV26n40N+FsvrfV7446m2+sfiCa/F79ap2916f7wmBe7loTr/zr
                ac1ka/WnynXhZmdTuL2c3xOT+2FUZ0ypn76XJN5uwdXVqLP5zuWThJ+N8PTJQWcH8peD//SWR2aa
                J6u/ZHG/ex9GdZn7fe7dwM9G18Qu4GcjbCD7/9kAm8hPfzbC8+elPxxfE/noz4bYTB76w2e5mfzz
                Z4M8f975s/GdP988Ab8z55knIHjC/PL0I6ypJryNrcm50DJX6DU5CSYLM/M9+4Sm1+Qs6EfLue8d
                l9f0TjATDmtO1oVlet07wSxYc2yLJLEd3AmmwJqDK6I8Le+vNb4TpIRWI7SH2G9yk/dsmcn0Ph/c
                p7u7zvtWv7yEyaGiRThZq+8TM/VLbNuf2Jfft9+/H0VJUOaK5Wf5qfF/r3wjRZyXH/+9KLzWg99/
                YdT59E+NFuUus87GcPVzhx+g1Ty5LOJgXg/y6g990NRW/3zfqM7SpFhabFcj82ii3yXANDaT3/5u
                KeZqJchXf2JzJZsv/F6YfJ5MDl+WH8zDuOacuvqT3vpPeps/+UHc3Pu4+1GSTkz6x3MW/iMOo79+
                re78r/u4iMp9y/pbOzwOb7XNxLNWsL3139tX2zef8+UT2F7SRyjwW857ed5FOedFntTcLe1T7p+b
                8jGljy3mvURGmD/FvK3IesfVPbfA97IzzR9fIM+eyh/1snlojgvv/WxEuL9ZGNeR7f2Pv/SPiu/9
                DF/EvyC+SkN+AHtvs7IDu3MwOfzyXnyarC79F2/i19zSrzPVa2WqylQdIc2SqaJzjkyeebPEW4YP
                5UgL7/Xfprze48L8uzlQ/JVRKaNqDXGHMqrVhtK6/HejpOqHEbKS570jBPBtiOypfHocv4B9zGmM
                Leg9yVK1KZUAL4v5KAfSljNWnorN+c1G5R1pVnrdHGBlq9jQt5Yh7xhjzitvzdn1eb/bZLwfmFFe
                yWsar0/+zRviHenBeIWurZlqP+7wV+2nWdyBn5Yh7j2GSfmfo4DvGSLPWI0IA/tixK2KESpGuANb
                xQgVI3gwqxihYgQtdBUjVIxoB3kVI1SMaCF/FSNUjPi8GJHPi7i8MuuCxJ0KEipIuANbBQkVJHgw
                qyChggQtdBUkVJBoB3kVJFSQaCF/FSRUkPi8IFEu+2n0FNbt37guRnTx7RFm9eKV4yKkd+4I2TbM
                9OzbUm4DBGv9QUbNs3NDpky6b0NGvtm12TfrfCWNdYgenzTT/hiZ9rNn11vzlfB3KZMIt6H+gMx9
                VXc4uuKA1V0LGTNpkQcZ+TgNoyj049x73dlk5Q49jGfH73D2W06fcQu8nhAfwrpt2ddb4J66laoH
                lCukWXpAYcsLEuMbwaxupVIQuHGrt5Z6a32arM6NPxkXeU1haZOrNmQe7R4fIOvf84rlsRHS/T5C
                9sbqaqLKihkqS+3dQVOWFdqZtQUPNnVs0zjP0eMaC3SXOabXYs1PZJozqGPUwLFKOd0bYtSE5Rzs
                +hmyWYd6UgmSKMkyc5wZbf992aL9tZHkqNl7/7XfJ0i3r4kxy9yvwxWtrViBFupZcTtUpc/94CGy
                mDU6/Wre19IaPVuljZk2WP2HmDRk+YeYN1j1h5g0avGHmTni6UNm3mBHEJlRQ5c2ibkDHkZkxo1X
                SCaGjVNHZqYMesiWGTnQSVtmzPDHbZnho525ZWaNfPCWmbsUwFNLUjaaFOLRKKdg98EPmh/BfwjN
                /6ezzczEk8zz08AU2VHEW5enH694O9ZLcJxMXrws8msWJjbCd9Uiczbhu8/8VIKdUCP2W4GRpo5q
                qAOBxDENxXnQJ45oPIcSNW4si1KfGTWiR4kaOJZJifa0FBZm6ohGNYPRxjYqcOooR7TfUQMH899R
                s0Y24PWZj2ECOvCoAx3OgkdNG8eDR5sLUiB+LtOqIg2nYVAu+XXdJ/uw79oDuwWLIpyptMes2QC5
                Sqk5w9tKqemj+UqpYSMbS4c9YvBOOEt7t8R3ANFdSmyEQMRNHd+OGHqp70EDHlPNMvjAqZ2EoI3a
                iIMclDh1lJ+5P54CvEHY1S//tBnhg/EmyZNFQbzTv64A1PstnT8qQEwaysBOzBkzcyUGDppFERN3
                aFmfJMU4Mp6ZzKwaDd82s7APmGsmWtpbmkRRR7XSKKWrNpzNbHYs497Z5w3A82ikqLGOSNE6NGkw
                I8cy6pEo2qgmBI4c34inz0hRg507I6WMfOKMFDngWTPa5RHnpAh1MMOdESGlDXQ6hJQw/LkQUu5o
                J0JIMSOfBSFFjmiKJ0XtiB1+wHxoGLPBNWnAy1AkBxe7qi4Pl1xz/FGuswcyKR4cau0q8dqdOGjo
                bRBd5hQWccdGDdyRfVsP+zU5jPs26rB37O1E08hfXX2aPNWViNdL0rDfzJJEq2FivYWBOC0k87yi
                46YxZKKDJvQIoiMn8wmi4+bxCqKTJvULomPn8gyi04brTk/MmsKhiQ6Zz6WJTpzDqYlOmdmtic6e
                yLGJjprUtYmO3Yn+3cT8EXVYYtyOqLDEd8AxQfDJz03qzQqbvpjDYQUiohqIHiVgLZ2ISbM0GkLn
                DGo4JSbukANy/jJJyxy8WFgYeTpDtV+Gz75PGSRZkU5twuNG4aEsxBHSykKa4bxRtY9WtLXVlakR
                ELRMjY3ilqlRpkZW5DI1NopbpkaZGqmxy9TYaMYtU6NMjUyQZWqUqZGRskyNMjW2ALVMjTI1tpC/
                TI3NJokyNV464CFbJhIDl5tKbqpPjTJhYLyx8WsWgTZmmYbeeEscIDLLyCyjllRyb8i9gY1b7g25
                N1iRy70h9wYlabk35N6gpy33htwbVJDl3pB7g5Gy3Btyb7QAtdwbcm+0kL/cG3JvtOoOyL0h9wY5
                cYfcG+Mo/PtvP6259GzcG3cVfnJvyL2BS5rFvYHOWa1O1OqED7TMMjLLMIKWWUZmGW7cMsvILEON
                XWYZmWU4WcssI7MMIXGZZWSW4WYvs4zMMtzYZZaRWaZFuGWWufQdkFlGZhly4i6ZZYrxOLLudnLd
                rSCUX0Z+GVzS8stoneEk7tA6My+/llovM/1mlpnh9fExsv49r7B472I1SLpaaFgeRzDS1FGtRb2F
                ydPwhjiiZTdutbebOrbl7m6ljX7YJY5pGembTa4BcVPHt04utPKIyLBPHNM6JKJzOfzIdS6nUdw6
                l6NzOdTYAc/lUGfeOpnT4lNQ1JGtc1A6bMYBWYfNdNiMkbIOm12OvQ6b6bAZN3YdNtNhsxbh1mGz
                S98BzMNm1M5MHQPQwQv+KD/z0QsFuKPnXLJivAiz1V+zOedyXSGo45TOn70gJg11IoCYM+iqTkzc
                oWUmSIo4r2t+2Kwxt1pjtMY4QppljcmLPLF4SKuU++emjGU8psVM6IA1s9mxuHvnxk1qEkRGDmgQ
                pCbNZDtBps1hOUEmzGw3QeZOZDVBxkxqM0FGTmZxQEbNb29Apo9pbSAuSqkgr4L857qvCbNFGHh5
                kmU2VXm9eFpVeVdIqyqvqjwNZsKqPDZwHUvUAQt6/tojaI/w+R4hT008y+cW+4ObK+0PtD9whDTL
                /gCdM17zYmLYWB11iUEjNnglxk1TZkAHTVhoQEeuBpiN4lYDzKZIk3pb0bFz+VvRacO1ZCRmraK8
                egUSEucwbqNTZjZvo7Pn916i3wFJfZL6Ppf6ksi3ft3xjdrASOxzhbTEPol9dLAl9knsY8QtsU9i
                HytyiX0S+yhJS+yT2EdPW2KfxD4qyBL7JPYxUpbYdzn2RN2a0FGTdmxCx65zqxeeYbi6ZqHjlnvj
                0ndA3bNklyEn7pBdJp8XcXlV4ySq+Siu/TK3wwpC+WXkl8ElzeKXwW4yJAOHDByMuGXgkIGDFbkM
                HDJwUJKWgUMGDnraMnDIwEEFWQYOGTgYKcvAIQNHC1DLwCEDRwv5y8AhA0er7oAMHDJwkBN3z8Bh
                Y964qeCTeUPmDVzSLOYNdM5qdqJmJ3yg5ZWRV4YRtLwy8spw45ZXRl4Zauzyysgrw8laXhl5ZQiJ
                yysjrww3e3ll5JXhxi6vjLwyLcItr8yl74C8MvLKkBN3yCuzqnTO/7fwHyxodm7vKgRll5FdBpe0
                7DKyy9DBll1GdhlG3LLLyC7Dilx2GdllKEnLLiO7DD1t2WVkl6GCLLuM7DKMlGWXkV2mBahll5Fd
                poX8ZZeRXaZVd0B2GdllyIk7ZJeZhllW1N1KrL0yd1cVfPLKyCuDS5rFK2Nms2MZ984ezVyOAmTU
                NG4CZMiETgJk3GQuAmTUPA4CZMqk7gFk5FzOgedyMizScBoG5eNatwi+T/3u3NQpVG38sGZStJFp
                c6jZyISZlWxk7kQqNjJmUgUbGTmZeoqMml85RaYv1VSqKTlxh1TTSWgxU3TuuhV0Ukwhp79Txkee
                PIeBTYT0FCHS1B0hzaKpo3NW/wn1n+ADTeYWQcdN4xhBB03oGkFHTuYcQcfN4x5BJ03qIEHHzuUi
                Qaet/hPqP0EFmc+tg06cw7GDTpnZtYPOnsi5g46a1L2Djl39Jy6vm8nnIJ/D4ZJP9lKytFKyq/ik
                ZEvJxiUtJVtKNh1sKdlSshlxS8mWks2KXEq2lGxK0lKypWTT05aSLSWbCrKUbCnZjJSlZEvJbgFq
                KdlSslvIn6wXCDpu/n4g6HdA1g1ZNz61bqT+zKqrf7VbpHwb8m3gkpZvQwsMJ3GHFphFuLByBnav
                1ORGS4wrpFmWmLzIk5qK6z7l/rkp03h6sDETOnqwgUulVHZKSNyh7DQLysgI5lb5ab+Z/LR/d3yE
                rH/PK5bHhkj33CHihAjShb4B1bEOpYCgToeIuF0K7e4Vn9zkEv8BbwPmSVKMI+Plxq9pytymADq9
                qhKVK6RZSlTonHV6VadX+UDr9GqjuGkq3eigCWvd6Mh1erVR3Dq9qtOr1Nh1erXRjFunV3V6lQmy
                Tq/q9CojZZ1evaDUp9OrOr1Kjd0RfZX4DsjPJj/bp4L23C8vquYwt1r2dQXf2bTsAbblgUrNpmYN
                pWdTkwZdaaiZO7TWTMzUxJnxgqJu3rdZcbrdZlac7pA4TuQ2abW1hzq2Ze5ppYuq+wPS8DGN6KOi
                Bk7jpMI+woqFmfnIHKpjbUDMHNGyxswbzLPGjBrZtMbMHdC1Rp0HwvnWqGnjONf45xA46xozciDv
                GjNmePMaM3w09xoza2T72jUxdzUeOnV3lp5a4TQGu8/n1HQJv1WTLbc64aRmGpX/tPJxDCv81AXH
                ed8gMWko1yAxZyfyK2L+oJ5NYuIOOTbH4cTmZT/dD5t6rfBa4bFJa4XXCsNJ3KEVprzsNImThd0y
                c6tlRsuMI6RZlhnZSoUZ1lPqUlH4xnH9g3iuRsTtUmjfSm66JP5rLLlJc4uAq+7QIuIO1R0yE029
                icnK67QTsT8s8ao9qPaATVq1B72VlSSU5RPQ1rhFuJW8Knn9NHmNwuDBKmftweesZjY7NjJ6544M
                vG5OpKCx2guRQkZsLESKmkaURIYMK0n2oJUDvj43pPGNiJo6tsF6CpGGNRhl6ohGbt1EGt7IyKlj
                HbBdFmmIA5JuQWTDNXGijm442tQRDtQzizSqgQhTRzJ8WzLS+IbnTh31aP3gSIMcDTN1TCP33SON
                b2TkXeY3RjjhsXPpQM6qdbfTDjuXYNucq3Tk8BnpBO8Ifdbgd6zT5Mrg4Y0jP7M7p9PQa6qJHbE6
                p6NzOlycqZy86LBp3LzooMkcvei4aVy96KBRnb3EyBHNpsS4wUyQxKSR/XjE2AE9YsS04V5dScxa
                TR8amz7gTHjExIEMYsSU4W1KxOzR3DPEqJGNHMTYnbBxEPNHNHIQ43bETUB8B9TaVt3ByIk71B0s
                eygvzRv72dzGL9NXX1v5ZVwhLb+M1hlO4g6tM/4iNlnoWy0y/WYWGZecuz13VxhWzFDLyy00ZDY/
                JjNtLEPmNTFpREcmM28sS+aQmDSqJ5P5WC6iKZOZN5grkxk1si2TmTugL5M5P4EzZjLDxnFm8s8g
                cNZMZuRA3kxmzPDmTGb4aO5MZtbI9swBcxHFCYNmnzlHlEWzUVUbETd1fDviiaW+B3LFyoZMbJIA
                9Yax4nbIGLbMXp78R4t5otMd3FXYyX0s9zEuaSh7GDFn0BWGmLhDi0xq7PrBDhvqB+tS/tHX8gL4
                EIKRZg1oreItzJbAC07Hbw/xnPTEIY0Hmzausc4sEMc0Fuge9jmcvQzJ6ZMhxFGNiJs2trFO4RBH
                NRboHrNVB/W8E3F0oyKnjnPEM2bEMY6Imzq+wc70EYc2GGnqqEY+Pkkc4sjYaXeXgEdWiUMckDZt
                ZMOdDiaOazjWtFGNcwybOJxxINPGMehBd+KgBiVOG+FAfQWIoxqIMm0kw7duII5vePa0UY/WM4M4
                yNFQ08Y0cm8S4vhGxt7vQcd6C1rCEAe+E/x7P7gB0LM9Yn8Y4mBHxE0b24604iEOd0fuAHOrwcjM
                TDzJPD8NTJEdRfwcFV2X5hybs62YnZCIpxhM4KxHt9UYRK1YqAP8zH1YFNsNwq5++YdNb5Lgwcui
                cGLVXG14U0Go5mrO92QhJg3VLuQHnPMiT2qawvcp989NGesEKS1m1KOMxPMH4sk6Ytxgp72ISSMf
                OiLGDngQhp42nPWXmDiQLZWYMrw5kpg9mmePGDWyfYwYuxPmJWL+iH4aYtyO+DmI7wCm3E0MHFR/
                JSbukCqYFeMsD/OiboViowpeVxFKFZQqiEuaRRU0s9mxjHtnj2bAXsmkqCW/SuVmiWVCjRs7qgmB
                I8e3DAXyb3BGtrwbcskwxbMcMjImtQc7lzEJO+XGabNJH9Dyfsn7xUVZ3i95v1qAWt4veb9ayF/e
                r2aTRHm/Lh3w8n417zKR96vZnag73q84qbuR2Ni+bqrFkrPZvvrXDvVmsennt6l0Hl3l1GJj8yTi
                waaN6yB9yXL/qAxKVTerV5BBgXaqg3zPcTsjLWwapx22DoWFucfcsRbVZefUFGKTfyAav2hh8xiS
                sCdsMM608UzqQcIObmToTkW6TaYNaPuiZa2XhTdFGsdgR4uYz16HvTqC8qaNbyAzIy1jZisj9mwC
                T5425tEspLSgSQ2k2PMKMnSnXs9mNaXIM9qk4I6I26nYtnp1lRsGXaf4W71K+fz23OqXf+ZfDIo0
                s/Mvqm0dn6mOGDaW24u08wOi14sUNZYFiRQyqvmIFDei9YgUNZghhpQysjODFDmgL+MHpJ/LybBI
                w2kYlI9r3YrgPvW7c1PH8Q1QhzWcik1KG0jDJiUMr6OSckdTUUkxI8t5pMgR1SVS1I5oS6T01fiF
                r9POKaW8aVT+rpWUN6wQPJuU13VI6r11fOVxifWAb+lxCX+X2NawTJO8/KfNbHjba2Y2JF4wZWyQ
                sYEPNJm5AR03jcEBHTShyQEdOZnRAR03j9kBnTSp4QEdO5fpAZ02XDsKYtYUxhJ0yHzmEnTiHAYT
                dMrMJhN09kRGE3TUpGYTdOx645OOk7cItyPKK/EdcEx7HZsoevEmad198lZ+valgPJv82utBS/Rs
                Aiw1biwJtjskRo0owlIDx5Jhu31i1KhCbPeGGDqiFEsNHEyMpWaNLMdSgwcUZKmzFDhJlpo2jijb
                gkkETpYdDIiZAwmz1JzhpVlq+mjiLDVsZHl2gN3Enk8gpAbuiERIfQ8cEwkXRRkkkW/Bs5wHq+3M
                dEKTQSAkho0lD9K+QgVLqaLFDFa/p+WMXLsnnqwdy5/+9pde4MexTW/YTvdOPS6UQTkE+4wZ1Ckf
                xjB48Z7CuGYKsn0Ur/Uo6lF0B7Y2M9rM8GDWZkabGVroODYNWsSgFg1a3vC2AVryyCo2cbqNqGEz
                43ar+pcU5aM4s3lvb+/qCr7egD0RasugLQMtdOWzymfbQV75rJrmtJC/9hPaT3y+n8j8eJKVs7ZN
                x5beVRd+R4EeJlIwpWDygUbs1UKMm0YyRgeN2qeFGDlilxZi3Dw1TnTSpFVOdOyA/VmIacN1ZyFm
                TWH6QYfMJ5OgEwfqy0JMmVmOQmeP1pOFGLW0P2lP/Lgd6cZCfAccU/9MPCnqLvVb6a9q05D0J+kP
                GjaN9IftrZISJVmEEbdkEcki1Ni1Q9MOrVV3wLEdWjD3Lb2ZA/gNmpnNjg2PnjZnJKDJrILIqGk2
                Z8iQCS2CyLjJ9sHIqHn2wMiUSfe/yMi5LIH4pJncU8i0OZxTyISZXVPI3IkcU8iY5ZZSLZ47wlWH
                v3iwu1WHT5MoSoqa49xW4ocVhmerxA9/ECXr30N+uRlVPR79mcSDTR3bNN409LjGAj24Jo5pRFmP
                GjiNuCeDq0VE3xFHNKqSOugSQ0fUU6mB86iq2BM3GGfqmCbVsLEDHBn6YEAc7YD2AeqdDlxPIWra
                OF2FWjCJwDlj+tShjeOPoeYM75Khpo/mlaGGjeyYYd5xRmZm4knm+WlgiuwoF0GTr4vPnvzZrO72
                bOsiuKkwRDzPhy7/4cnaxLCxtFbaqg+WHkUcz4jCCDFusHI9MWnkujExdsCqMe0iiVPDpA9ouAom
                MXGg+iUxZfjqJTF7tNolMWrkyiUx9kscQDtlJdPPy2AJrM5DddU6WpVMh2DTVDLRQSOeGSHGrdJx
                Q6BRDzIQI1e1XtV6StKq1qtaT08bzuFNzFraiLQRQuLSRqSNcLOXNiJthBs7WR9EdNyuS1FZZMzS
                y/3owUqNwn9PDnrgSI2SGmUPGtsyiCWO9G+Iz26hyiO9W2joO4OVOII6YyPipo1tKVEt1fxoI1qK
                n4TW3XSwDx3rdFJrC3gzaVPYO0tQ3tQxLjWwZZordTRLdZXi3c7Il+bdWnsBdVzLYCBfx26JCPuN
                VzsPp1wdqDGOiNup2Lap1ep1opcOd0fuAO0T0MDrXBXwDQOvfvmH7881eZHWTLK2Br3rCkIZ9GTQ
                g4ZNY9BDB612EY3ixnJEEoNG9UMSI0e06BHjBrOOEZNGdjERYwf0MBHTVrsItYugggxqESMmDmRd
                IqYMb54hZo/m5yBG3Zit4JSF+WlaZOVg87DuWLfV+dsKTVXnVZ2Hhq3qvKrzjLhVnVd1nhW5qvOq
                zlOSVnVe1Xl62qrOqzpPBVnVeVXnGSmrOq/qfAtQO1mdn7yU/wkDb1nEwdymPt/TyxZVn3cINk19
                HrsJ0RnLxaec9kwcJHXzj+18d6P5jvDEMDNutw7wLYs0K0KrFz738D0CZjY7NkB65w4QMvkDGTWP
                9IFMmVT2QEbOJXngk2aqDiPT5qgMIxNmrgojcyeqCCNjdrIaPA8nExN7y+SpbuK02Yj1VRxRMdgh
                2DTFYHTQMms3iltmbZm1WZGTVSvRcfNULNFJk1Yt0bFzVS7RacusLbM2FWS+cjw6cY6SPDpl5rI8
                Onui0jw6aifL86kfxt7EjwMr5+LgqgJTxXkV56Fhqziv4jwjbhXnVZxnRa7ivIrzlKRVnFdxnp62
                ivMqzlNBVnFexXlGyirOqzjfAtTIr08nxq7z+c0mKW68UZr4DjjWIaGcEOMXb+LXzLS26l/1rdxS
                /6T+QcOW+if1jxG31D+pf6zIpf5J/aMkLfVP6h89bal/Uv+oIEv9k/rHSFnqn9S/FqCW+if1jx+3
                1L9L3wHH1L8gtX1Fy6Da5PBs0t9gcHyQrH/PK5bHRkm3jbVNauBg1U1q1sj1zcEdMXjACmcLeMOV
                hKiZAxWFqDnDl4Wo6aMVhqhhI5eGhrfE4MsNcubNEm8ZPpS7+sJ7/bcpB37cPHOGVL3HnKqrPNf6
                aih1fDtSD+0Pie9BZGYmnmSenwamyI5CfoZNEnXYN1CE1sTucNV/mb0Ec6sALp/BKkQd+dGRH2jY
                NEd+9Gr2U5xynPuT5Mkb+1HNiNhOenoFmSY9h2DTTHrooHXOsVHcOueoc46syBG9QMS4wZxAxKSR
                fUDE2AFdQMS0dc5R5xypIIOa2oiJA1naiCnDG9qI2aPZ2YhRI5vZiLE7YWUj5o/orCLG7YivivgO
                OOY4SZNyU5Et/MzurOldBaPkV8mv0LAlv0ozYcQtzUSaCTV2aSYqMTMTV4lZJWZu9peoSJxyg1zO
                hWm0TBIre/LwSvtjJVwuYj97vfaUz2axTBPf4ghG+WD29WCiR4hwO1xPzvIkeFiGkQXQcoANHWHs
                Qh8tro617/gj6RLrbhc8oWXnf0U8IT75UZQ8WU2H15oOd0NkoOmwucexp+nQmaXfrdlw6gf+xCo3
                vNaOTWdincKtM7E6E8uKXP4O+TsoSUtukL+DnrbOxOpMLBVkGZZkWGKkLMPSBQVXnYnVmVhq7DoT
                KwdNi3A7olAR3wHXRKokKDJvafsC1ms1YpdS5RRuKVVSqliRS6mSUkVJWkqVtBNy1hTaCfbrYZgr
                zNjkVfRUFaiVd8CxKtDcRMtVeMz9uOZytCkD3ejsd8siJSuWJl0mT3Xz8G2cNHTKh3Yh5dlyYnMm
                3XBiQ+dzNmHz1n5I+6F96Nfc73+XDUQ2nPbyd6rVUWqCl8Cuq8rNLfwGAz1EJCJKRKQkrT2d9nT0
                vLWn057O7U4wNn3JEF3lLrG+k5joUALjyB1gfQAcU+jKaCkzr3Fq/AebHfStpFw5+p3CLUe/HP2s
                yFWMUzGOkjRpMQ4du3pPNUlb5yd0foIKMl81H524ek+p9xQ3e/WeUu8pbuwyvZGb3oTbQZmK+A44
                plS9+E81l6GtRFWV+c4mUfUG0Eomn0hFDRxLpuphq/ScQlXvB2sOPHREqYoaOJhYRc0aWa6iBg8o
                WFFnKXCSFTVtHNGqBZMInGxFzRxIuKLmDC9dUdNHE6+oYSPLV90+MXgnBKzVG9xp7wCihEUN3BER
                i/oeOCZjpWaamszq9Sm3NxWGiIetnifeskjDaRj4eVh3vd0PljtHt9KnDJAs9nO71+vc3sHHhw7l
                nz5OTJCW0551d9U7Hd1kVMWJcWNp4sSgURVxYuSIejgxbjA1nJg0shZOjB1OmSVmjaPLEkNuVrk6
                5QZtXn4t9R6TMLBpTtu/wn9ZLvZuHlTHp+UNry3TkkeWOomXJESZjRm3YwJPUq4+ebIY2yz6XXyJ
                Bz1MVJRVUZYRtIqyKspy41ZRVkVZauyAx5OIaasErhI4FWS+giY6caBjScSUmQvH6OzRjiQRo1aV
                XlV6ftyOHIUhvgOO6STjKAls3jnU7w8rBM+mkfRviE9LIaok1MCxdJKBGro1r5T0r4mhI2ol1MDB
                1BJq1qR6CbarDRk69foJKFNRp4ZwQhU1bRypqgWTCJNYhb1agvKmjnEgeZCaM7NAiD2rwJOnjns0
                cZYaNqk8iz2/IEPHDvadsfYdV8Sdgs0nhzuF3yrW3RLDg/IbNUe5EcMH1Sn6bGL4gLl1KKIYTg0c
                TAwfEqNGFcOp4xuuok9NG6eiT7tPA60u0/KGr7vRkldF4jS7tJ4KEpCsVZA4fUHCKtbdKkhk81Ub
                oyf/0ap34bChd64Tn+JArEkQ48aqSBCDRq1HECNHtOYT4wYz5hOTRnaIE2OHq24Ss1ZtU7U2WvLI
                tTbiOeUSJaBT1iSe/Nyk3rJc8e2KEj0VJVSUcAm3ihIqSrAiV1FCRQlK0ipKqChBzlpFCRUlaMmr
                KKGixBFFibm/KHdrnp/WXIC2NYm7ZmoSgwG0n4avwys1cEc8ZNT3wDEfWeznRepH3iycWp1vu27o
                fBvxyqpKiyotlKRJKy1mNjsWee/sKz9ea0Bq0kwnrpBpA3XyIiXMXNBC5o7WQ4oUc2NVw1NuyqZR
                uWe32Y3dDLQb027MJdzajWk3Ro2da0fmBm2mXRk6cY6dGTpl5t0ZOnuiHRo6amRvh0sdL64dV+eJ
                QxwRt0uhPeTzQRBHuyN3wKUH4BbLhKJ4d9j1M/OzPE08PwhrrkWbMvPtFXyZGVmLQEwBSFG77lqO
                ygfUS02WpFauvNsb+AcU+5ABjyyBzZlUlMCGzlckx+bNXLzFJq964mn2nHeOZ7cusbap3aq8cnL8
                zL2ijZl442QxtthKDK7wuzJhr0HaSmgrQQtdWwltJdpBHnkrwSyoAO4mmHG7ldFOk6DIvPGqSm6T
                03b1+hMdk3AKN88mAp006TYCHbuOSTRPm2nbhk5cxyR0TIKbvY5J6JgEN3bVIppNUtwQN4nvgGPV
                oFlYLv7hYukHdtWg62aqQYM7aBlc9SCHnkxE3NTxrQJcS0ud1FGtYqdqzDvYhzfE8a4qc8tr+i2I
                blX1W6+jUEe5lJSW6VXU0SzFSmrhp+z7Q+LIl17YWmmWOq4lzkoT381gronjXap4600I1PEtG8Kl
                Q96RO0C9T43MzMSTzPPTwBTZUcjPUehinnjUvFF2p6/sTn+b2JsbfzIuciu/U++2AhLx9Bv2UWAw
                hwItZ2SZnBY6qKRFyxu+CE1LHrlixJxlARYweswmP8ytG3OEu7WPSJNywQ+i0K4vXF89NBhN/MS4
                ebZt6KRJN27o2F1/2cGsiB/KISdW1awB/jqEvQ3imRaxOZNOitjQVc1SNasd5FXNUjWrBbjdKq2E
                abLRaK0yWnXcV0brAmdltMpo6Xkro1VG264USxmtMtpPM9rAX+bho1+3o8M2ox3CZ7ToYSKtUFoh
                JenGNhGnnAWzxSoJnyRPNROSzTR4c6dpkK+lED1tpr0mOnGgtivElJn39Ojs0XpREKNWAUU7+u9z
                2TIBf3zxssivudnZ5LK3g2Zy2WGP2JkPmM22gDdcPjv8wWQIzxwoo6XmDJ/TUtNHy2qpYSPntX3m
                9VPSYOuVWOr4dqTRFPU9UNcjlSu+Klf409yk3ktS2FQr7vANCGY2OzZEei2sU1CThqtQ0HoM+Xgj
                RzdQLYiUMHwViHYmYSaPHPFolTdSzMg1N9o5hRQ6cpy73kOl/Aux1WnTu4befk5cQeHaHrtBm2nL
                hk6cY9uGTpl5A4HOnmgTgY6aNKdFx352LfmUSWyJcun5T37NZWebyDb0Wose88sLAVPZFvCGS2a7
                zK+yAkpnqTnDJ7TU9NFSWmrYjSW1p8yywjgoM9bUrpfH8MM5e9ULaZIsetpwKRYxcaAEi5hys+nV
                STWq8pej0HbdaejAKXHEaN3RusNMXOsO37oj9s5W8cfltU2Sv61W+V5fq7xWeedoa5XXKs9FWau8
                3CgtQC03CmceK9yXNrUfIxEyOz30Fnb1Nfhqt1zOiA9W8VtulnV0Q5tl92hrs6ytBCFqbSW0leDH
                7fr52KcwmnjB3E9ndrpEQ4cLmCNHqZZSLWLi0iWkS3Cz12ZCmwlu7NpMqET75Ztyci9I/Wxus3Xo
                4/eehY8TPZZ6LD/3GZoosHoir3vwTyRyizSOjQ4yYeZNDjJ3og0OMmbkzQ31++8Q8yhq4I4Yr0jn
                GUfoUz8BdK/zQQ54xzZuQRJPw4mVDnun7iPavrlAmXkLh86eaBuHjtrJxlfL5MmkZdLkLYvYqnJ4
                3cWvHKJHjJYfLT+8GThyaYsUueuO1ImfPpgs9yI/Df2am7bNanStZhnwFdGT+g/C2dybJ2lm1hmM
                VajcNBMqQ+Yur2j7CmrYyCvp4AczIjx4RJFIK1CjuKnj2xFVqM88uWM2Q6AOezohDn5id0uMy/Jk
                sVzNgnk5NabFwmJ3cXPV0O5CL/p1q2wE/4gC5l7MuN2aEcfJ5MVbpiarmaBs5sIbNeXRY+kWbrce
                yyw3ZaadJlFkVQK9aer9kLRJilO18tyUdzCMvWURZTYOs9sr/ON6CpNThonvjSM/sxHebodd+BjR
                onPaOCknk6iME6u3Gdze4s8lipNTv7k6ilZVlCc/t0pPbm+1b2hZrMz9cp203V/eyYLYtjjJiqVJ
                AxNFXhb5NnXZu67mFPdjZX1l2etw4iSN/OfXcWyusHozev3h2/Uty8T2tz8OozAPTZ0bbf+zL4cB
                b79Z/mb2ex5OJibe/vo4KUH68a/71U+X1/j67ftRFiV7Iuios/rqO4u38d2PZmb98uIS3MEb9/5t
                L3ysd9/ef+VDXL1/8X0UVaxbzFnu53WwWYzbetjdg8OuO7Kxn5n1ZezchesyoN6+dz8y02mSHpgC
                Nl/ffNzhZ2lpgtCvqbCv/krn7u16Nh/9egPWV7RzP7ZfW///6tOrV9wpx7X6+Lcv7wyt+lx9PbTV
                Vxbl/dn+wU538L6p3n5t9WlpObq9Txv7wUP5iE/9IsrfPiL1n/6chfm8GBdZOdUncW7ivPzAReef
                5Uf96z//vbP9a51FeXUmffvndiSd1V9dDePPZTwbdSqfsfnEqVn4kTn8qH74ge1PrwwRLyce3fpv
                7oxx8zkfPvP7cX78sfvRNC1Hc3qcb6Os/v3tx301xo8/8frzJ6a5A/LjZ3z8wBrDrLJM8vnbWvIW
                rpPU+IvfT+XDsbd8n4n9ehid9ed6689dX2r2+PO70flwMfejebLYS7fOekmrD8SOrA/jPFeQrf96
                GWvTabhaCjw/zVcvvmj0Rux++Dc35SyQ98bwFfC9ny5Xl3nyNEme9lKI8ywvmzG/fub7ajMLp3ir
                zaHBvtN9HzLq4rMz/rdB484Yb2PdwXy6WeP1E1bPwuoj33Zue/nVx/R593upmXjjqNib9s/z0LyO
                sPNxSJ3XMXyfss3KtLXZ0aw+cWdI60FsxpOnfpwt/bT84MaG9eEzDwH7OKRzPY7fjPDrtaPRe1i9
                fR8GsB3MpW/gztAqN+/tN+5HLyaKkqdLPqObEWA8oR/HAvN8bgcF+3Rux3f5Z3M7EKAn88Ct+/K5
                3Px8paDkhdVldm+dDdKXLPejCz7CYWc7hu8f4hNnRHWGU68U0lxQvA9v74n+dKjVMGl4AvpiwCBT
                0PsIG91cfjOWurv6S9/Jz8d56I5eerRfzp/bXyhnzGS/hNbojLgaAMp0+D6WL+bCZp/X9ZAQHtb1
                QL5/UpuM+vWQaof86qfvR1kYPe7XkxuN+M0QUGL+42hgon47KIS43w4FK/K3g6od+5uf30mXd/Pl
                vYTZLMpvNqawHL7UsLMdBUIwvA/my7r49ofKoYWpWVUQIuNPZ6kxDdXFPxv83nBA5qBPR4YyHx0a
                IEQ47g/ry8Dc+/H70boX22sXtsuGZ2UoMKF5YFQ4YVkdHERIVof0ZThWfnR3cdpZnR73LADbLhnr
                7hgXDNzHTmUk4J6X+pfgkjGm1lVBexxqXcHZ3A+Vj7kfzcv/5KvtkpclRXTxHdNj59CA3HzQPr8S
                guft4MW5+NgdvJDzeY8OfNr9aBmVw4mLA27YBh+810G4+bBVR0/wgL1dkIsP1dvgz/YgvX7CTir5
                WM0kn3efqOpZiktWO5471bGc7D7v/N0dQM8VQHuZ9jgq4957mpfj3ztrEYcLPzcXVBAeOx+G13kd
                D7gX0PZCXPIJWlwbtIfQ4jrO5i98/YTLPVDurfsHxu/6yl+9JOfW/urwz7b6f/iQ6vpWXf8f92SO
                9Usp3t9J8VkxtMkbHnY+GZSDd//zazlbKHzygfejZ+/lsre1HICTt3A17rPdrvKP7zyx4c4ju/fM
                hsEBk32jtzLsrMdwuhR9/efuR4d6bl74Qg8NycUo/uRKzhbXhz5tN9D3In0v1L9pDH7Z2Ag73wzv
                dM/HNx8EMSeca1LY/Zj37gzZ+nD3enA/P1Hfvb76/kh9r8aR+nnNhuPr0/Tdw6fprQberTHwOr0A
                /Dwvs0iLwfd+PvhT9TEoo8zEdbsKrgffxxn8tgmDZ30DBkDR83oR9ndi+POr6J/uIkzNDonroV9/
                3Qxjv+fF4cs60Gal+9pmZfXlg2ONk3RRt3PH6vc/zDWrf74Pdj3K+9GTCWfzvfcvXF+V3DbfWrkW
                knJI/wf85/mPiKgJAA==
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
            HTTPClient_Endpoint: "${url}/api/v2/pokemon/snorlax"
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
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: api
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: v2
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
            HTTPClient_Endpoint: "${url}/api/v2/pokemon/pikachu"
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
          dataSource:
            columnName: fechaSuit
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: api
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: v2
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
              VALUES ('${idSuit}', '${fechaSuit}', '${nombrePokemon}')
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
            outputTools:
            - $type: TextDataBankTool
              iconName: TextDataBank
              name: Text Data Bank
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
            value: "SELECT count(*) FROM pokemon WHERE idTransaccion = '${idSuit}'"
        failOnSQLException: true
        account:
          local:
            $type: DbConfigSettings
            password: AwAAACxBVkhkV1E2MWZiMjNrNkdkOWhSK1pMWDh5N1FjeGZxRW9Takd5dWNsWUNBPQ==
            uri: jdbc:mysql://localhost:3306/pokeapi
            username: root
            driver: com.mysql.cj.jdbc.Driver
