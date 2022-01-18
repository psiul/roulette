select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 868 and ss.ss_hash <= 968 and c.c_hash >= 666 and c.c_hash <= 716 and hd.hd_hash >= 631 and hd.hd_hash <= 831
;
