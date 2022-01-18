select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 868 and ss.ss_hash <= 968 and c.c_hash >= 357 and c.c_hash <= 557 and hd.hd_hash >= 154 and hd.hd_hash <= 654
;
