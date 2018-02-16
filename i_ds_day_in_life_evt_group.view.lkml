view: i_ds_day_in_life_evt_group {
  sql_table_name: dbo.iDS_day_in_life_evt_group ;;

  dimension: evt_group {
    type: string
    sql: ${TABLE}.evt_group ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
