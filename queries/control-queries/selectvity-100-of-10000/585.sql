select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 153 and cd.cd_hash <= 253 and hd.hd_hash >= 116 and hd.hd_hash <= 316 and c.c_hash >= 226 and c.c_hash <= 726
;
