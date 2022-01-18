select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 739 and ss.ss_hash <= 789 and hd.hd_hash >= 719 and hd.hd_hash <= 819 and c.c_hash >= 94 and c.c_hash <= 114
;
