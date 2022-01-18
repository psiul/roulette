select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 786 and ss.ss_hash <= 886 and c.c_hash >= 799 and c.c_hash <= 849 and cd.cd_hash >= 533 and cd.cd_hash <= 553
;
