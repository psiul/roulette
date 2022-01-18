select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 65 and ss.ss_hash <= 465 and d.d_hash >= 27 and d.d_hash <= 777 and cd.cd_hash >= 226 and cd.cd_hash <= 559
;
