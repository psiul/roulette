select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,customer_demographics cd,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 67 and c.c_hash <= 817 and d.d_hash >= 420 and d.d_hash <= 820 and hd.hd_hash >= 3 and hd.hd_hash <= 336
;
