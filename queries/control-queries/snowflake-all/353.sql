select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,date_dim d,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 412 and cs.cs_hash <= 745 and cd.cd_hash >= 368 and cd.cd_hash <= 768 and d.d_hash >= 190 and d.d_hash <= 940
;
