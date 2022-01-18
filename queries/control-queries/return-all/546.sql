select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,household_demographics hd,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 97 and cs.cs_hash <= 847 and cd.cd_hash >= 369 and cd.cd_hash <= 769 and hd.hd_hash >= 361 and hd.hd_hash <= 694
;
