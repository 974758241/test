CLASS zdmo_cx_rap_generator DEFINITION
  PUBLIC
  INHERITING FROM cx_xco_runtime_exception
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

*    INTERFACES if_t100_dyn_msg .
*    INTERFACES if_t100_message .

    CONSTANTS:

      gc_msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',


      BEGIN OF is_no_child_nor_grandchild,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE 'MV_ROOT_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF is_no_child_nor_grandchild,
      BEGIN OF non_alpha_numeric_characters,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF non_alpha_numeric_characters,
      BEGIN OF contains_spaces,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF contains_spaces,
      BEGIN OF is_too_long,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_MAX_LENGTH',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF is_too_long,
      BEGIN OF node_is_not_consistent,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF node_is_not_consistent,
      BEGIN OF entity_name_is_not_unique,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF entity_name_is_not_unique,
      BEGIN OF implementation_type_not_valid,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF implementation_type_not_valid,
      BEGIN OF no_namespace_set,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '007',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_namespace_set,
      BEGIN OF node_is_not_finalized,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '008',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF node_is_not_finalized,
      BEGIN OF is_not_a_root_node,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '009',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF is_not_a_root_node,
      BEGIN OF sematic_key_is_not_in_table,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '010',
        attr1 TYPE scx_attrname VALUE 'MV_SEMANTIC_KEY_FIELD',
        attr2 TYPE scx_attrname VALUE 'MV_TABLE_NAME',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF sematic_key_is_not_in_table,
      BEGIN OF repository_already_exists,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '011',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF repository_already_exists,
      BEGIN OF cannot_check_object_type,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '012',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF cannot_check_object_type,
      BEGIN OF parameter_is_initial,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '013',
        attr1 TYPE scx_attrname VALUE 'MV_PARAMETER_NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF parameter_is_initial,
      BEGIN OF package_does_not_exist,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '014',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF package_does_not_exist,
      BEGIN OF table_does_not_exist,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '015',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF table_does_not_exist,
      BEGIN OF root_cause_exception,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '016',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE 'MV_PARAMETER',
        attr4 TYPE scx_attrname VALUE '',
      END OF root_cause_exception,
      BEGIN OF field_uuid_missing,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '017',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF field_uuid_missing,
      BEGIN OF field_parent_uuid_missing,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '018',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF field_parent_uuid_missing,
      BEGIN OF field_root_uuid_missing,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '019',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF field_root_uuid_missing,
      BEGIN OF no_table_set,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '020',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_table_set,
      BEGIN OF no_semantic_key_set,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '021',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_semantic_key_set,
      BEGIN OF object_name_is_not_unique,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '022',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF object_name_is_not_unique,
      BEGIN OF software_comp_do_not_match,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '023',
        attr1 TYPE scx_attrname VALUE 'MV_TABLE_NAME',
        attr2 TYPE scx_attrname VALUE 'MV_PACKAGE_NAME',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF software_comp_do_not_match,
      BEGIN OF cds_view_does_not_exist,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '024',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF cds_view_does_not_exist,
      BEGIN OF starts_not_with_underscore,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '025',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF starts_not_with_underscore,
      BEGIN OF assocation_is_not_supported,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '026',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF assocation_is_not_supported,
      BEGIN OF not_a_field_in_cds_view,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '027',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF not_a_field_in_cds_view,
      BEGIN OF usage_is_not_supported,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '028',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF usage_is_not_supported,
      BEGIN OF invalid_json_array_name,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '029',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_json_array_name,
      BEGIN OF invalid_json_object_name,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '030',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_json_object_name,
      BEGIN OF invalid_json_property_name,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '031',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_json_property_name,
      BEGIN OF field_is_not_in_datasource,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '032',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_TABLE_NAME',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF field_is_not_in_datasource,
      BEGIN OF field_is_not_in_cds_view,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '033',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF field_is_not_in_cds_view,

      BEGIN OF no_object_id_set,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '034',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_object_id_set,
      BEGIN OF invalid_data_source_type,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '035',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_data_source_type,
      BEGIN OF no_data_source_set,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '036',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_data_source_set,
      BEGIN OF invalid_namespace,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '037',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_namespace,
      BEGIN OF uuid_is_not_key_field,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '038',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF uuid_is_not_key_field,
      BEGIN OF uuid_has_invalid_data_type,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '039',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF uuid_has_invalid_data_type,
      BEGIN OF more_than_one_key_field,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '040',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF more_than_one_key_field,
      BEGIN OF has_no_key_field,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '041',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF has_no_key_field,
      BEGIN OF invalid_binding_type,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '042',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_binding_type,
      BEGIN OF invalid_transport_request,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '043',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_transport_request,
      BEGIN OF no_draft_table_specified,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '044',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE 'MV_ROOT_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_draft_table_specified,
      BEGIN OF table_is_inactive,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '045',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF table_is_inactive,
      BEGIN OF cannot_add_additional_fields,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '046',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF cannot_add_additional_fields,

      BEGIN OF not_implemented,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '047',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF not_implemented,
      BEGIN OF not_draft_enabled,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '048',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF not_draft_enabled,
      BEGIN OF no_ui_v4_service_binding,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '049',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_ui_v4_service_binding,
      BEGIN OF admin_field_missing,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '050',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF admin_field_missing,
      BEGIN OF transport_does_not_exist,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '051',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF transport_does_not_exist,
      BEGIN OF underscore_not_at_pos_2_3,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '052',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF underscore_not_at_pos_2_3,
      BEGIN OF publish_needs_active_srvd,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '053',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF publish_needs_active_srvd,
      BEGIN OF grand_child_not_supported,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '054',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE',
        attr3 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr4 TYPE scx_attrname VALUE '',
      END OF grand_child_not_supported,
      BEGIN OF field_total_etag_missing,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '055',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF field_total_etag_missing,
      BEGIN OF field_etag_master_missing,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '056',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF field_etag_master_missing,
      BEGIN OF invalid_abap_type_name,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '057',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr3 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_abap_type_name,
      BEGIN OF clnt_is_not_key_field,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '038',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF clnt_is_not_key_field,
      BEGIN OF mult_edit_not_supported,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '058',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF mult_edit_not_supported,
      BEGIN OF delivery_class_c_required,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '060',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF delivery_class_c_required,
      BEGIN OF view_type_not_supported,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '061',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF view_type_not_supported,
      BEGIN OF no_fields_found,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '062',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_fields_found,
      BEGIN OF no_draft_for_cust_entites,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '063',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_draft_for_cust_entites,
      BEGIN OF job_scheduling_error,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '064',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF job_scheduling_error,
      BEGIN OF invalid_package_type,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '065',
        attr1 TYPE scx_attrname VALUE 'MV_PACKAGE_NAME',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_package_type,
      BEGIN OF no_etag_delegation_support,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '066',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_etag_delegation_support,
      BEGIN OF multi_edit_datasource_type,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '067',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF multi_edit_datasource_type,
      BEGIN OF multi_edit_implementation_type,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '068',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF multi_edit_implementation_type,
      BEGIN OF exceeds_max_mbc_hierachy_level,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '069',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF exceeds_max_mbc_hierachy_level,
      BEGIN OF mandatory_field_for_entity,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '070',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF mandatory_field_for_entity,
      BEGIN OF mandatory_field_for_project,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '071',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF mandatory_field_for_project,
      BEGIN OF no_odatav4_for_cust_entites,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '072',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_odatav4_for_cust_entites,
      BEGIN OF service_binding_is_published,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '073',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF service_binding_is_published,
      BEGIN OF service_binding_publish_err,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '074',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF service_binding_publish_err,
      BEGIN OF service_binding_un_publish_err,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '075',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF service_binding_un_publish_err,
      BEGIN OF method_not_implemented,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '076',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF method_not_implemented,
      BEGIN OF generated_objects_still_exist,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '077',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF generated_objects_still_exist,
      BEGIN OF no_odatav4_UI_srvb_wo_draft,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '078',
        attr1 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_odatav4_UI_srvb_wo_draft
      ,
      "Datasource type &3 does not support impl. type &1, only &2.
      BEGIN OF data_source_invalid_imp_type,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '079',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE 'MV_PARAMETER_NAME',
        attr4 TYPE scx_attrname VALUE '',
      END OF data_source_invalid_imp_type,
      BEGIN OF invalid_ext_element_Suffix,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '080',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_ext_element_Suffix,
      BEGIN OF no_ext_element_Suffix_set,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '081',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_ext_element_Suffix_set,
      BEGIN OF ext_elem_suffix_is_not_unique,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '082',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_ENTITY',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF ext_elem_suffix_is_not_unique,
      BEGIN OF too_many_nodes,
        msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '083',
        attr1 TYPE scx_attrname VALUE 'MV_VALUE',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE_2',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF too_many_nodes,
      begin of table_locked_by_transport,
      msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '084',
        attr1 TYPE scx_attrname VALUE 'MV_TABLE_NAME',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF table_locked_by_transport,
      begin of table_not_extensible,
      msgid TYPE symsgid VALUE 'ZDMO_CM_RAP_GEN_MSG',
        msgno TYPE symsgno VALUE '085',
        attr1 TYPE scx_attrname VALUE 'MV_TABLE_NAME',
        attr2 TYPE scx_attrname VALUE 'MV_VALUE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF table_not_extensible
            .



    DATA mv_entity  TYPE sxco_ddef_alias_name.
    DATA mv_root_entity  TYPE sxco_ddef_alias_name.
    DATA mv_value TYPE string.
    DATA mv_value_2 TYPE string.
    DATA mv_max_length TYPE i.
    DATA mv_parameter_name TYPE string.
    DATA mv_semantic_key_field TYPE string.
    DATA mv_table_name TYPE string.
    DATA mv_package_name TYPE string.

    CLASS-METHODS class_constructor .
    METHODS constructor
      IMPORTING
        !textid                LIKE if_t100_message=>t100key OPTIONAL
        !previous              LIKE previous OPTIONAL
        !mv_entity             TYPE sxco_ddef_alias_name OPTIONAL
        !mv_root_entity        TYPE sxco_ddef_alias_name OPTIONAL
        !mv_value              TYPE string OPTIONAL
        !mv_value_2            TYPE string OPTIONAL
        !mv_max_length         TYPE i OPTIONAL
        !mv_parameter_name     TYPE string OPTIONAL
        !mv_semantic_key_field TYPE string OPTIONAL
        !mv_table_name         TYPE string OPTIONAL
        !mv_package_name       TYPE string OPTIONAL .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZDMO_CX_RAP_GENERATOR IMPLEMENTATION.


  METHOD class_constructor.
  ENDMETHOD.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous
        textid   = textid.
    me->mv_entity = mv_entity.
    me->mv_root_entity = mv_root_entity.
    me->mv_value = mv_value.
    me->mv_value_2 = mv_value_2.
    me->mv_max_length = mv_max_length.
    me->mv_parameter_name = mv_parameter_name.
    me->mv_semantic_key_field = mv_semantic_key_field.
    me->mv_table_name  =       mv_table_name.
    me->mv_package_name = mv_package_name.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
