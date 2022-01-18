select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 325 and ss.ss_hash <= 345 and cd.cd_hash >= 237 and cd.cd_hash <= 287 and d.d_hash >= 643 and d.d_hash <= 743
;
