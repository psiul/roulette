select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,household_demographics hd,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 106 and cs.cs_hash <= 856 and d.d_hash >= 311 and d.d_hash <= 711 and hd.hd_hash >= 396 and hd.hd_hash <= 729
;
