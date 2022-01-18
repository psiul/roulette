select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 232 and ss.ss_hash <= 732 and c.c_hash >= 136 and c.c_hash <= 236 and i.i_hash >= 761 and i.i_hash <= 961
;
