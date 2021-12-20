@include "base.ne"
@lexer lexer

create_collection_statement -> kw_create %ws kw_collection %ws collection_name %ws column_name_array {% d => {
    return{
        "type":"create collection",
        "params":{
            "columns" : d[6],
            "collection": d[4]
        }
    }
} %}

create_index_statement -> kw_create %ws kw_index %ws index_name %ws kw_on %ws collection_name %ws column_name_array {% d => {
    return{
        "type":"create index",
        "params":{
            "collection" : d[8],
            "name": d[4],
            "columns" : d[10]
        }
    }
} %}