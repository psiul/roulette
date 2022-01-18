select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,date_dim d,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 495 and cs.cs_hash <= 828 and hd.hd_hash >= 268 and hd.hd_hash <= 668 and c.c_hash >= 220 and c.c_hash <= 970
;
