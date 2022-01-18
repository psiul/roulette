select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 226 and ss.ss_hash <= 976 and c.c_hash >= 512 and c.c_hash <= 912 and cd.cd_hash >= 38 and cd.cd_hash <= 371
;
