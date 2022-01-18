select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 319 and cd.cd_hash <= 819 and c.c_hash >= 785 and c.c_hash <= 985 and hd.hd_hash >= 683 and hd.hd_hash <= 783
;
