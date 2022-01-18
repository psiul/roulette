select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,date_dim d,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 469 and cs.cs_hash <= 802 and c.c_hash >= 152 and c.c_hash <= 902 and cd.cd_hash >= 433 and cd.cd_hash <= 833
;
