select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 45 and ss.ss_hash <= 795 and d.d_hash >= 584 and d.d_hash <= 984 and cd.cd_hash >= 252 and cd.cd_hash <= 585
;
