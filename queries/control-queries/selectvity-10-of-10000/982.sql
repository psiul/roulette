select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 255 and c.c_hash <= 455 and cd.cd_hash >= 206 and cd.cd_hash <= 256 and d.d_hash >= 255 and d.d_hash <= 355
;
