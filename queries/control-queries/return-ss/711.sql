select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 163 and d.d_hash <= 913 and cd.cd_hash >= 227 and cd.cd_hash <= 560 and c.c_hash >= 574 and c.c_hash <= 974
;
