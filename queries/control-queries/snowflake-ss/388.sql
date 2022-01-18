select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 425 and ss.ss_hash <= 758 and d.d_hash >= 312 and d.d_hash <= 712 and cd.cd_hash >= 234 and cd.cd_hash <= 984
;
