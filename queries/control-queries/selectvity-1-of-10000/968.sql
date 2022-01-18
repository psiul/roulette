select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 700 and ss.ss_hash <= 750 and d.d_hash >= 569 and d.d_hash <= 589 and cd.cd_hash >= 720 and cd.cd_hash <= 820
;
