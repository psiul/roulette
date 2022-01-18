select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,customer c,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 445 and cs.cs_hash <= 845 and c.c_hash >= 307 and c.c_hash <= 640 and hd.hd_hash >= 154 and hd.hd_hash <= 904
;
