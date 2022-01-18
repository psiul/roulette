select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 341 and ss.ss_hash <= 441 and cd.cd_hash >= 39 and cd.cd_hash <= 239 and d.d_hash >= 648 and d.d_hash <= 698
;
