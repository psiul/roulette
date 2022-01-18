select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 217 and ss.ss_hash <= 317 and i.i_hash >= 92 and i.i_hash <= 292 and c.c_hash >= 903 and c.c_hash <= 953
;
