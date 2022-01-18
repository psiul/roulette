select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 447 and ss.ss_hash <= 780 and c.c_hash >= 184 and c.c_hash <= 934 and i.i_hash >= 562 and i.i_hash <= 962
;
