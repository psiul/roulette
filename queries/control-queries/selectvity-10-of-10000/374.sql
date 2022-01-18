select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 282 and ss.ss_hash <= 382 and i.i_hash >= 684 and i.i_hash <= 734 and hd.hd_hash >= 275 and hd.hd_hash <= 475
;
