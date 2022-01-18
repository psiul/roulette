select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 93 and ss.ss_hash <= 843 and c.c_hash >= 484 and c.c_hash <= 884 and cd.cd_hash >= 157 and cd.cd_hash <= 490
;
