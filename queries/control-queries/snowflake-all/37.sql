select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 383 and ss.ss_hash <= 783 and c.c_hash >= 388 and c.c_hash <= 721 and i.i_hash >= 175 and i.i_hash <= 925
;
