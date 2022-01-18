select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 118 and ss.ss_hash <= 868 and hd.hd_hash >= 160 and hd.hd_hash <= 493 and i.i_hash >= 302 and i.i_hash <= 702
;
