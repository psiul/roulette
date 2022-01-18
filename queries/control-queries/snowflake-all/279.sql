select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 491 and ss.ss_hash <= 891 and hd.hd_hash >= 79 and hd.hd_hash <= 829 and cd.cd_hash >= 418 and cd.cd_hash <= 751
;
