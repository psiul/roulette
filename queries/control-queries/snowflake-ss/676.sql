select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 503 and c.c_hash <= 836 and i.i_hash >= 77 and i.i_hash <= 477 and hd.hd_hash >= 39 and hd.hd_hash <= 789
;
