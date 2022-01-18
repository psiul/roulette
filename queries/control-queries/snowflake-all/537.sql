select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer c,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 279 and cs.cs_hash <= 679 and d.d_hash >= 216 and d.d_hash <= 966 and cd.cd_hash >= 19 and cd.cd_hash <= 352
;
