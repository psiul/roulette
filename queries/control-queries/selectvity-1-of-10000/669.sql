select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 794 and hd.hd_hash <= 894 and cd.cd_hash >= 465 and cd.cd_hash <= 515 and d.d_hash >= 965 and d.d_hash <= 985
;
