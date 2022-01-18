select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 395 and c.c_hash <= 728 and cd.cd_hash >= 234 and cd.cd_hash <= 984 and d.d_hash >= 318 and d.d_hash <= 718
;
