connection: "mcdnx_02254_cda"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: mcdnx_02254_cda_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mcdnx_02254_cda_default_datagroup

explore: i_ds_day_in_life {}

explore: primary_audit {}

explore: relationship {}

explore: script {
  join: users {
    type: left_outer
    sql_on: ${script.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: users {}
