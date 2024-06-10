/* checksum : 171d914cd14ef208460a1d8618f1ba0e */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.supported.formats : 'atom json xlsx'
service zitatech_metadata {};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.pageable : 'false'
@sap.content.version : '1'
entity zitatech_metadata.MATERIAL_HEADERSet {
  @sap.unicode : 'false'
  @sap.label : 'Material'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  key Matnr : String(40) not null;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 7
  @sap.unicode : 'false'
  @sap.label : 'Created On'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Ersda : Timestamp not null;
  @sap.unicode : 'false'
  @sap.label : 'Created By'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Ernam : String(12) not null;
  @sap.unicode : 'false'
  @sap.label : 'Maint. status'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Pstat : String(15) not null;
  @sap.unicode : 'false'
  @sap.label : 'Material Type'
  @sap.creatable : 'false'
  Mtart : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Industry'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Mbrsh : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'Material Group'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Matkl : String(9) not null;
  @sap.unicode : 'false'
  @sap.label : 'Old matl number'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Bismt : String(40) not null;
  @sap.unicode : 'false'
  @sap.label : 'Base Unit'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  @sap.semantics : 'unit-of-measure'
  Meins : String(3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Mfr Part Number'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Mfrpn : String(40) not null;
  @sap.unicode : 'false'
  @sap.label : 'Manufacturer'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Mfrnr : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.sortable : 'false'
  Maktx : String(40) not null;
  @cds.ambiguous : 'missing on condition?'
  NP_MatDetails : Association to many zitatech_metadata.MATERIAL_CLASSIFICATIONSet on NP_MatDetails.Matnr = Matnr;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.pageable : 'false'
@sap.content.version : '1'
entity zitatech_metadata.MATERIAL_CLASSIFICATIONSet {
  @sap.unicode : 'false'
  @sap.label : 'Material'
  @sap.sortable : 'false'
  key Matnr : String(40) not null;
  @sap.unicode : 'false'
  @sap.label : 'Class'
  @sap.sortable : 'false'
  key Class : String(18) not null;
  @sap.unicode : 'false'
  @sap.label : 'Characteristic'
  @sap.sortable : 'false'
  key Atnam : String(30) not null;
  @sap.unicode : 'false'
  @sap.label : 'Char. Value'
  @sap.sortable : 'false'
  key Atwrt : String(70) not null;
};

