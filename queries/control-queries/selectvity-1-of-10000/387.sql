select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 668 and ss.ss_hash <= 688 and i.i_hash >= 676 and i.i_hash <= 726 and cd.cd_hash >= 481 and cd.cd_hash <= 581
;
