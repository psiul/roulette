select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 803 and d.d_hash <= 823 and cd.cd_hash >= 520 and cd.cd_hash <= 570 and hd.hd_hash >= 639 and hd.hd_hash <= 739
;
