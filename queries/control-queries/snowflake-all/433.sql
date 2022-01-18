select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,household_demographics hd,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and d.d_hash >= 381 and d.d_hash <= 781 and hd.hd_hash >= 55 and hd.hd_hash <= 805 and c.c_hash >= 15 and c.c_hash <= 348
;
