select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 164 and ss.ss_hash <= 914 and i.i_hash >= 204 and i.i_hash <= 604 and c.c_hash >= 379 and c.c_hash <= 712
;
