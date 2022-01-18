select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 530 and ss.ss_hash <= 930 and i.i_hash >= 169 and i.i_hash <= 919 and c.c_hash >= 213 and c.c_hash <= 546
;
