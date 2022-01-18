select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 528 and cd.cd_hash <= 728 and hd.hd_hash >= 637 and hd.hd_hash <= 737 and c.c_hash >= 453 and c.c_hash <= 953
;
