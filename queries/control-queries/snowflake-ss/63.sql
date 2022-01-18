select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 561 and ss.ss_hash <= 961 and d.d_hash >= 313 and d.d_hash <= 646 and cd.cd_hash >= 51 and cd.cd_hash <= 801
;
