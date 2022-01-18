select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 369 and c.c_hash <= 769 and hd.hd_hash >= 159 and hd.hd_hash <= 492 and cd.cd_hash >= 134 and cd.cd_hash <= 884
;
