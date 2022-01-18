select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer c,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 173 and hd.hd_hash <= 506 and c.c_hash >= 251 and c.c_hash <= 651 and cd.cd_hash >= 17 and cd.cd_hash <= 767
;
