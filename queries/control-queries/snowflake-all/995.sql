select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_demographics cd,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 653 and c.c_hash <= 986 and cd.cd_hash >= 363 and cd.cd_hash <= 763 and hd.hd_hash >= 47 and hd.hd_hash <= 797
;
