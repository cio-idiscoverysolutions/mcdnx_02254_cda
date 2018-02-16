view: i_ds_day_in_life_v2 {
  sql_table_name: dbo.iDS_day_in_life ;;

  dimension: custodian {
    type: string
    sql: ${TABLE}.custodian ;;
  }

  dimension_group: date_beg_source {
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
    sql: ${TABLE}.date_beg_source ;;
  }

  dimension_group: date_end_source {
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
    sql: ${TABLE}.date_end_source ;;
  }


  measure: most_recent_date {
    type: time
    sql: MAX(${date_end_source_time});;
  }

  measure: earliest_date {
    type: time
    sql: MIN(${date_beg_source_time});;
  }

  dimension: evt_group {
    type: string
    sql: ${TABLE}.evt_group ;;
  }

  dimension: evt_type {
    type: string
    sql: ${TABLE}.evt_type ;;
  }

  dimension: file_extension {
    type: string
    sql: ${TABLE}.file_extension ;;
  }

  dimension: file_of_interest_ind {
    type: string
    sql: ${TABLE}.file_of_interest_ind ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: source_file {
    type: string
    sql: ${TABLE}.source_file ;;
  }

  dimension: udf_id {
    type: string
    sql: ${TABLE}.UDF_ID ;;
  }

  dimension: user_ext_ind {
    type: string
    sql: ${TABLE}.user_ext_ind ;;
  }

  measure: count {
    type: count
    drill_fields: [date_beg_source_time, evt_group, evt_type, object, notes]
  }
}
