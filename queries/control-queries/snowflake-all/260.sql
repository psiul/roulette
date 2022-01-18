select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,customer c,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 653 and cs.cs_hash <= 986 and cd.cd_hash >= 60 and cd.cd_hash <= 460 and c.c_hash >= 64 and c.c_hash <= 814
;
