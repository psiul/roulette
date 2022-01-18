select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,customer_demographics cd,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 85 and cs.cs_hash <= 418 and hd.hd_hash >= 357 and hd.hd_hash <= 757 and cd.cd_hash >= 7 and cd.cd_hash <= 757
;
