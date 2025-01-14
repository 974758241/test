CLASS zcl_test_for_zhgy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    CLASS-METHODS test_cl_abap_context_info
      IMPORTING !out TYPE REF TO if_oo_adt_classrun_out.

    CLASS-METHODS test_string_use
      IMPORTING !out TYPE REF TO if_oo_adt_classrun_out.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_test_for_zhgy IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " cl_abap_context_info方法的使用
    test_cl_abap_context_info( out ).
    " 字符串操作的使用
    test_string_use( out ).

    " ABAP 日期时间处理类
    " 主要作用是向给定的时间戳添加一定的时间间隔。
    DATA lv_tstmp        TYPE tzntstmpl.
    DATA lv_result_tstmp TYPE tzntstmpl.

    GET TIME STAMP FIELD lv_tstmp.
    out->write( |Current Timestamp: { lv_tstmp }| ).
    " 添加 3600 秒（1小时）到当前时间戳
    lv_result_tstmp = cl_abap_tstmp=>add( tstmp = lv_tstmp
                                          secs  = 3600 ).
    out->write( |Add 1 hour: { lv_result_tstmp }| ).
    " 从当前时间戳减去 1800 秒（30分钟）
    lv_result_tstmp = cl_abap_tstmp=>add( tstmp = lv_tstmp
                                          secs  = -1800 ).
    out->write( |Subtract 30 minutes: { lv_result_tstmp }| ).

    "
    DATA lv_date TYPE d.
    DATA lv_time TYPE t.
    CONVERT TIME STAMP lv_tstmp TIME ZONE sy-zonlo
            INTO DATE lv_date TIME lv_time. "" 将时间戳转换为日期和时间
    " 添加 3600 秒（1小时）到当前日期时间
    out->write( |add_to_short: { lv_tstmp }| ).
    " 四舍五入
    lv_result_tstmp = cl_abap_tstmp=>add_to_short( tstmp = lv_tstmp
                                                   secs  = 3600 ).
    out->write( |add_to_short Add 1 hour: { lv_result_tstmp }| ).
    " 添加 3600 秒（1小时）到当前日期时间，并将结果截断为,不会四舍五入
    lv_result_tstmp = cl_abap_tstmp=>add_to_short_trunc( tstmp = lv_tstmp
                                                         secs  = 3600 ).
    out->write( |add_to_short_trunc Add 1 hour trunc: { lv_result_tstmp }| ).

    " 返回 -1: 第一个时间戳早于第二个时间戳
    " 返回 0: 两个时间戳相等
    " 返回 1: 第一个时间戳晚于第二个时间戳
    DATA result TYPE i.
    " 比较2个时间的大小
    result = cl_abap_tstmp=>compare( tstmp1 = lv_tstmp
                                     tstmp2 = lv_result_tstmp ).
    out->write( |Compare: { result }| ).

    DATA(res_time) = cl_abap_tstmp=>get_system_timezone( ). " 返回系统设置的时区
    out->write( |系统时区: { res_time } | ).

    DATA lv_is_double TYPE abap_bool.

    lv_date = '20231029'.  " 夏令时结束日期示例
    lv_time = '020000'.    " 凌晨2点

    " 检查是否在重叠时间段
    lv_is_double = cl_abap_tstmp=>isdoubleinterval( date = lv_date
                                                    time = lv_time ).

    IF lv_is_double = abap_true.
      " 在重叠时间段内
      " 这个小时会重复出现两次
      out->write( | 当前时间在夏令时切换重叠期间 | ).
    ELSE.
      " 不在重叠时间段
      out->write( | 当前时间在正常时间段 | ).
    ENDIF.
  ENDMETHOD.


  METHOD test_cl_abap_context_info.
    DATA lv_date TYPE d.
    DATA lv_time TYPE t.

    lv_date = cl_abap_context_info=>get_system_date( ).
    lv_time = cl_abap_context_info=>get_system_time( ).
    DATA(system_url) = cl_abap_context_info=>get_system_url( ).

    DATA(lv_user_dec) = cl_abap_context_info=>get_user_description( ).
    DATA(user_alias) = cl_abap_context_info=>get_user_alias( ).
    DATA(user_business_partner_id) = cl_abap_context_info=>get_user_business_partner_id( ).
    DATA(user_formatted_name) = cl_abap_context_info=>get_user_formatted_name( ).
    DATA(language_abap) = cl_abap_context_info=>get_user_language_abap_format( ).
    DATA(language_iso)  = cl_abap_context_info=>get_user_language_iso_format( ).

    out->write( |System Date: { lv_date }| ).
    out->write( |System Time: { lv_time }| ).
    out->write( |User Dec: { lv_user_dec }| ).
    out->write( |User Alias: { user_alias }| ).
    out->write( |User Business Partner ID: { user_business_partner_id }| ).
    out->write( |User Formatted Name: { user_formatted_name }| ).
    out->write( |User Language ABAP: { language_abap }| ).
    out->write( |User Language ISO: { language_iso }| ).
    out->write( |System URL: { system_url }| ).
  ENDMETHOD.


  METHOD test_string_use.
    " 将字符转换成字符串,保留空格
    cl_abap_string_utilities=>c2str_preserving_blanks( EXPORTING source = ' Apple '
                                                       IMPORTING dest   = DATA(lv_str) ).
    out->write( |Trimmed String: { lv_str }| ).
    lv_str = ' Apple '.
    " 删除字符串后面的空格
    cl_abap_string_utilities=>del_trailing_blanks( CHANGING str = lv_str ).
    out->write( |Trimmed String: { lv_str }| ).

    DATA lv_distance TYPE i.
    " CL_ABAP_STRING_UTILITIES=>EDIT_DISTANCE 方法用于计算两个字符串之间的编辑距离（也称为Levenshtein距离）。编辑距离是指将一个字符串转换为另一个字符串所需的最少单字符编辑（插入、删除或替换）次数。
    lv_distance = cl_abap_string_utilities=>edit_distance( val1     = 'kitten'
                                                           val2     = 'sitting'
                                                           cost_del = 1        " 可选: 删除操作的成本
                                                           cost_ins = 1        " 可选: 插入操作的成本
                                                           cost_sub = 1        " 可选: 替换操作的成本
                                                           max      = 0 ).     " 可选: 最大距离限制，0表示无限制

    out->write( |Edit Distance: { lv_distance }| ).

    " ABAP字符串操作计划
    "     转义字符
    "     字符串拼接
    "     字符串长度
    "     类型转换
    "     字符串分割
    "     去除空白
    "     大小写转换
    "     查找替换
    "     字符串检查
    "     字符串对齐

    " 1. 转义字符
    lv_str = |This is a 'quoted' string|.
    " 2. 字符串拼接
    DATA lv_str1 TYPE string VALUE 'Hello'.
    DATA lv_str2 TYPE string VALUE 'World'.
*CONCATENATE lv_str1 lv_str2 INTO DATA(lv_result) SEPARATED BY space.
    DATA(lv_result) = |{ lv_str1 } { lv_str2 }|.
    lv_result = |{ lv_str1 } { lv_str2 }|.
    out->write( |字符串拼接:{ lv_result }| ).
    " 3. 字符串长度
    DATA(lv_length) = strlen( lv_str ).
    out->write( |字符串长度:{ lv_length }| ).

    " 4. 类型转换
    DATA lv_num TYPE i VALUE 123.
    DATA(lv_str_num) = CONV string( lv_num ).
    DATA(lo_type) = cl_abap_typedescr=>describe_by_data( lv_str_num ).
    out->write( |lv_str_num类型是:{ lo_type->get_relative_name( ) }| ).
    lv_num = CONV i( lv_str_num ).
    lo_type = cl_abap_typedescr=>describe_by_data( lv_num ).
    out->write( |lv_num类型是:{ lo_type->get_relative_name( ) }| ).
    " 5. 字符串分割
    SPLIT lv_str AT space INTO TABLE DATA(lt_strings).
    out->write( '字符串分割:' ).
    out->write( lt_strings ).

    " 6. 去除空白
    CONDENSE lv_str NO-GAPS. " 删除所有空格
    out->write( |删除所有空格:{ lv_str }| ).
    lv_str = | This is a 'quoted' string |.
    " 或使用
    SHIFT lv_str LEFT DELETING LEADING space. " 删除前导空格
    out->write( |删除前导空格:{ lv_str }| ).
    SHIFT lv_str RIGHT DELETING TRAILING space. " 删除尾随空格
    out->write( |删除尾随空格:{ lv_str }| ).

    " 7. 大小写转换
    TRANSLATE lv_str TO UPPER CASE.
    out->write( |转换为大写:{ lv_str }| ).
    TRANSLATE lv_str TO LOWER CASE.
    out->write( |转换为小写:{ lv_str }| ).

    " 8. 查找替换
    REPLACE ALL OCCURRENCES OF 'old' IN lv_str WITH 'new'.
    lv_str = | search is a 'quoted' string |.
    " 9. 字符串检查
    IF lv_str CS 'search'.  " 包含
      out->write( |字符串包含:search| ).
    ENDIF.
    lv_str = |string pattern matching: str*|.
    " 在 CP 操作中：
    " • * 表示任意数量的字符（包括零个字符）
    " • + 表示一个字符
    IF lv_str CP 'str*'. " 匹配,字符要是以str开头的
      out->write( |字符串模式匹配:str*| ).
    ENDIF.
    lv_str = |str1|.
    IF lv_str CP 'str+'.
      out->write( |字符串模式匹配:str+| ).
    ENDIF.
    CONDENSE lv_str NO-GAPS.
    IF lv_str NA space.     " 不包含空格
      out->write( |字符串不包含空格| ).
    ENDIF.
    lv_str = | search is a 'quoted' string |.
    " 10. 字符串对齐

    " 左对齐
    DATA lv_output TYPE c LENGTH 10 VALUE 'ABAP'.
    SHIFT lv_output LEFT DELETING LEADING space.
    out->write( |左对齐:{ lv_output }| ).
    " 右对齐
    SHIFT lv_output RIGHT DELETING TRAILING space.
    out->write( |右对齐:{ lv_output }| ).
  ENDMETHOD.

ENDCLASS.
