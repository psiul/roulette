select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 715 and c.c_hash <= 765 and d.d_hash >= 440 and d.d_hash <= 640 and cd.cd_hash >= 350 and cd.cd_hash <= 450
;
