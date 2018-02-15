view: i_ds_day_scoring_rank_demo {
  sql_table_name: dbo.iDS_day_scoring_rank_demo ;;

  dimension_group: date_beg_lcl {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_beg_lcl_date ;;
  }

  dimension: ranking {
    type: number
    sql: ${TABLE}.ranking ;;
  }

  dimension: total_score {
    type: number
    sql: ${TABLE}.total_score ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
