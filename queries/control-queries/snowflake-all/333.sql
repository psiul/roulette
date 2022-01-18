select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,household_demographics hd,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 226 and cs.cs_hash <= 976 and c.c_hash >= 196 and c.c_hash <= 529 and cd.cd_hash >= 543 and cd.cd_hash <= 943
;
