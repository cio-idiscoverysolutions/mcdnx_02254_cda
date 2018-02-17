view: i_ds_day_scoring_demo {
  sql_table_name: dbo.iDS_day_scoring_demo ;;

  dimension_group: date_beg_lcl {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_beg_lcl ;;
  }

  dimension_group: timeline_end_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timeline_end_date ;;
  }


  measure: most_recent_date {
    type: time
    sql: MAX(${date_beg_lcl_time});;
  }

  measure: earliest_date {
    type: time
    sql: MIN(${date_beg_lcl_time});;
  }


  dimension: file_extension {
    type: string
    sql: ${TABLE}.file_extension ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.FULL_NAME ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: results_num_value {
    type: number
    sql: ${TABLE}.results_num_value ;;
  }

  dimension: results_text_value {
    type: string
    sql: ${TABLE}.results_text_value ;;
  }

  dimension: udf_id {
    type: number
    sql: ${TABLE}.UDF_ID ;;
  }

  measure: total_score {
    type:  sum
    sql:  ${TABLE}.results_num_value ;;
  }


  measure: count {
    type: count
    drill_fields: [date_beg_lcl_time, full_name, name, notes, results_text_value, results_num_value]
  }
}
