select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 306 and hd.hd_hash <= 806 and c.c_hash >= 229 and c.c_hash <= 329 and cd.cd_hash >= 612 and cd.cd_hash <= 812
;
