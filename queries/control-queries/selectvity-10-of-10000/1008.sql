select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 897 and ss.ss_hash <= 997 and cd.cd_hash >= 673 and cd.cd_hash <= 723 and c.c_hash >= 317 and c.c_hash <= 517
;
