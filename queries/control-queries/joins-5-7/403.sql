select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 573 and ss.ss_hash <= 973 and c.c_hash >= 134 and c.c_hash <= 884 and cd.cd_hash >= 568 and cd.cd_hash <= 901
;
