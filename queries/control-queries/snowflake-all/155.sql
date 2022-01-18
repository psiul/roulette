select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_demographics cd,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 228 and cs.cs_hash <= 628 and d.d_hash >= 224 and d.d_hash <= 974 and cd.cd_hash >= 269 and cd.cd_hash <= 602
;
