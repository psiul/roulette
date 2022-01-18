select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer c,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 463 and hd.hd_hash <= 796 and d.d_hash >= 128 and d.d_hash <= 878 and c.c_hash >= 170 and c.c_hash <= 570
;
