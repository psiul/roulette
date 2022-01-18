select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,household_demographics hd,date_dim d,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 382 and cs.cs_hash <= 715 and cd.cd_hash >= 204 and cd.cd_hash <= 954 and hd.hd_hash >= 217 and hd.hd_hash <= 617
;
