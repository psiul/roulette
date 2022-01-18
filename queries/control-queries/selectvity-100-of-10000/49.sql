select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 518 and ss.ss_hash <= 718 and d.d_hash >= 355 and d.d_hash <= 855 and cd.cd_hash >= 520 and cd.cd_hash <= 620
;
